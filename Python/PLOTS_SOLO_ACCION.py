import cvxpy as cp
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import scipy
import time
import cvxpy as cp
import numpy as np

def setup_mpc(N, A, B, Q, R, x_ref, x0, G, W, umin=None, umax=None, xmin=None, xmax=None):
    """
    Fully vectorized MPC with proper Parameter handling
    """
    (nx, nu) = B.shape

    # Variables
    u = cp.Variable((nu, N), name="Input")

    # Pre-compute A^k matrices
    A_powers = [np.eye(nx)]  # A^0
    for k in range(N):
        A_powers.append(A @ A_powers[-1])

    # State prediction matrices
    F = np.vstack([A_powers[k+1] for k in range(N)])
    S_blocks = [[A_powers[k-i] @ B for i in range(k+1)] + [np.zeros((nx, nu))]*(N-k-1) 
               for k in range(N)]
    S = np.block(S_blocks)

    # Vectorized predictions
    X_vec = F @ x0 + S @ cp.vec(u, order='F')

    # Vectorized cost
    Q_block = scipy.linalg.block_diag(*[Q]*N)
    R_block = scipy.linalg.block_diag(*[R]*N)
    cost = cp.quad_form(X_vec - np.tile(x_ref, N), Q_block) + \
           cp.quad_form(cp.vec(u, order='F'), R_block)

    # Constraints
    constraints = []

    # Clustering constraints (vectorized but Parameter-friendly)
    if G is not None:
        for k in range(N):
            constraints += [G @ u[:,k] >= W[k]]  # Direct Parameter usage

    # State constraints (vectorized)
    if xmin is not None or xmax is not None:
        X = cp.reshape(X_vec, (nx, N), order='F')
        if xmin is not None:
            constraints += [X >= np.tile(xmin.reshape(-1,1), (1,N))]
        if xmax is not None:
            constraints += [X <= np.tile(xmax.reshape(-1,1), (1,N))]

    # Input constraints
    if umin is not None:
        constraints += [u >= np.tile(umin.reshape(-1,1), (1,N))]
    if umax is not None:
        constraints += [u <= np.tile(umax.reshape(-1,1), (1,N))]

    # Problem setup
    prob = cp.Problem(cp.Minimize(cost), constraints)
    u.value = np.zeros((nu, N))  # Initialization

    return prob, u

def measure_values(x0, W, N, t):
    # Read CSV data ONCE and keep in memory
    data = pd.read_csv(r'C:\Users\Barrantes\Desktop\Asistencia Control\MPC_CSV_50us.csv', header=None).values

    # Set INITIAL STATE (current time t only)
    x0.value = np.array([data[t, 1], data[t, 2]])
    
    # Update CONSTRAINTS for each prediction step k
    for k in range(N):
        # Get row index for time t+k (future prediction)
        row = min(t + k, len(data)-1)  # Prevent out-of-bounds
        
        # Extract measurements FOR THIS SPECIFIC TIME STEP
        v0_Sigma = data[row, 3]
        v0_Delta = data[row, 4]
        v_alpha_Delta = data[row, 5]
        v_beta_Delta = data[row, 6]
        vP_Ca = data[row, 7]
        vP_Cb = data[row, 8]
        vP_Cc = data[row, 9]
        vN_Ca = data[row, 10]
        vN_Cb = data[row, 11]
        vN_Cc = data[row, 12]

        # Calculate v vector FOR THIS TIME STEP
        v = np.array([
            -v0_Sigma - (1/2)*v0_Delta - (1/2)*v_alpha_Delta,
            -v0_Sigma - (1/2)*v0_Delta + (1/4)*v_alpha_Delta - (np.sqrt(3)/4)*v_beta_Delta,
            -v0_Sigma - (1/2)*v0_Delta + (1/4)*v_alpha_Delta + (np.sqrt(3)/4)*v_beta_Delta,
            -v0_Sigma + (1/2)*v0_Delta + (1/2)*v_alpha_Delta,
            -v0_Sigma + (1/2)*v0_Delta - (1/4)*v_alpha_Delta + (np.sqrt(3)/4)*v_beta_Delta,
            -v0_Sigma + (1/2)*v0_Delta - (1/4)*v_alpha_Delta - (np.sqrt(3)/4)*v_beta_Delta
        ])

        # Update W[k] WITH TIME-STEP-SPECIFIC VALUES
        W[k].value = np.array([
            -min(v[0] + vP_Ca, v[3] + vN_Ca),
            -min(v[1] + vP_Cb, v[4] + vN_Cb),
            -min(v[2] + vP_Cc, v[5] + vN_Cc),
            max(v[0], v[3]),
            max(v[1], v[4]),
            max(v[2], v[5])
        ])
    
    

def simulation(s):

    sim_time = 0.1  # Simulation time (100 ms)
    steps = int(sim_time / Ts)
    time_axis = np.arange(0, sim_time, Ts)

    (nx, nu) = B.shape

    # History logging
    x_hist = np.zeros((nx, steps))  # [i_α^Σ, i_β^Σ] history
    u_hist = np.zeros((nu, steps))  # [v_α^Σ, v_β^Σ] history

    


    # ------------------------------------------
    # Main Simulation Loop
    # ------------------------------------------
    for t in range(steps):
        # 1. Update initial state parameter
        measure_values(x0, W, N,s)  # Critical: Update for MPC
        
        # 2. Warm-start with previous solution (shift forward)
        if t > 0:
            
            u.value = np.hstack([u.value[:,1:], u.value[:, -1:]])  # Shift control inputs
        
        # 3. Solve MPC

        
        prob.solve(
    solver=cp.OSQP,
    verbose=False,          # Disable solver output
    warm_start=True,        # Critical for MPC
    eps_abs=1e0,           # Absolute tolerance (OSQP name)
    eps_rel=1e0,           # Relative tolerance (OSQP name)
    eps_prim_inf=1e0,      # Primal infeasibility tolerance (OSQP name)
    max_iter=200,           # Max iterations (OSQP name)
    polish=False
)
        
        
        # 4. Handle solver failures
        if prob.status not in [cp.OPTIMAL, cp.OPTIMAL_INACCURATE]:
            print(f"Solver failed at t={t*Ts:.4f}s, status: {prob.status}")
            break
        
        # 5. Extract and apply first control input
        optimal_u = u[:,0].value
        s=s+1
        
        # 6. Store results
        x_hist[:,t] = x0.value
        u_hist[:,t] = optimal_u

    # Trim arrays to actual simulation steps
    x_hist = x_hist[:, :t]
    u_hist = u_hist[:, :t]
    time_axis = time_axis[:t]

 # ------------------------------------------
    # Plot Results
    # ------------------------------------------
    
#Problem

Ts = 50e-6  # Sampling time (50 μs)
L = 2.5e-3   # Cluster inductance (H)

A = np.array([[1.0, 0.0], 
              [0.0, 1.0]])   # State matrix (identity)
B = np.array([[-Ts/L, 0.0], 
              [0.0, -Ts/L]])  # Input matrix
Q = np.diag([1.0, 1.0])
R = np.diag([0.001, 0.001])
x_ref = np.array([35.0, -15.0])
G = np.array([
    [-1, 0],
    [0.5, -np.sqrt(3)/2],
    [0.5, np.sqrt(3)/2],
    [1, 0],
    [-0.5, np.sqrt(3)/2],
    [-0.5, -np.sqrt(3)/2]
])

# Initialize lists to store timing results
TOL = 1

solvers = [
    ('OSQP', {
        'eps_abs': TOL,
        'eps_rel': TOL,
        'max_iter': 10000,
        'verbose': False
    }),
    ('ECOS', {
        'abstol': TOL,
        'reltol': TOL,
        'max_iters': 10000,
        'verbose': False
    }),
    ('SCS', {
        'eps_abs': TOL,
        'eps_rel': TOL,
        'max_iters': 10000,
        'verbose': False
    })  
]




# Filter out solvers that aren't available in the current installation
available_solvers = []
for name, params in solvers:
    try:
        # Try to create a simple problem to test solver availability
        x = cp.Variable()
        prob = cp.Problem(cp.Minimize(x**2), [x >= 0])
        prob.solve(solver=eval(f"cp.{name}"), **params)
        available_solvers.append((name, params))
    except:
        print(f"Solver {name} not available")

print(f"Available solvers: {[name for name, _ in available_solvers]}")

# Horizons and experiments
horizons = range(1, 80)  # Test N=1 to 20 (adjust as needed)
num_experiments = 5  # Reduced for faster benchmarking

# Store results: {solver_name: {horizon: [solve_times]}}
results = {name: {N: [] for N in horizons} for name, _ in available_solvers}

# Benchmark loop
for solver_name, solver_params in available_solvers:
    print(f"\n=== Testing solver: {solver_name} ===")
    
    for N in horizons:
        print(f"  Horizon N = {N}...", end=' ', flush=True)
        
        for exp in range(num_experiments):
            # Setup MPC problem
            x0 = cp.Parameter(2, name="x0")
            W = [cp.Parameter(6, name=f"W{k}") for k in range(N)]
            prob, u = setup_mpc(N, A, B, Q, R, x_ref, x0, G, W)
            
            # Initialize (use a fixed t for consistency)
            t = 12000 # Prevent out-of-bounds
            measure_values(x0, W, N, t)
            
            # Time the solver
            start_time = time.time()
            try:
                u.value = np.zeros((B.shape[1], N))  # Warm-start
                prob.solve(solver=eval(f"cp.{solver_name}"), **solver_params)
                solve_time = time.time() - start_time
                results[solver_name][N].append(solve_time)
            except Exception as e:
                print(f"X", end='', flush=True)
                results[solver_name][N].append(np.nan)  # Mark failed runs
        print()  # New line after each horizon

# Save results to CSV
df_results = pd.DataFrame({
    'Solver': [name for name, _ in available_solvers for N in horizons for _ in range(num_experiments)],
    'Horizon': [N for name, _ in available_solvers for N in horizons for _ in range(num_experiments)],
    'SolveTime': [t for name, _ in available_solvers for N in horizons for t in results[name][N]]
})
df_results.to_csv('solver_benchmark_all.csv', index=False)

# Plotting results
plt.figure(figsize=(15, 10))
for idx, (solver_name, _) in enumerate(available_solvers, 1):
    plt.subplot(4, 5, idx)
    valid_data = [(N, time) for N in horizons 
                 if not all(np.isnan(t) for t in results[solver_name][N])]
    
    if valid_data:
        N_values, _ = zip(*valid_data)
        plt.boxplot([results[solver_name][N] for N in N_values], positions=N_values)
        plt.title(f"{solver_name}")
    else:
        plt.text(0.5, 0.5, "No valid data", ha='center')
    
    plt.xlabel('Horizon (N)')
    plt.ylabel('Time (s)')
    plt.grid(True)
plt.tight_layout()
plt.savefig('solver_comparison_grid.png')
plt.show()

# Average time comparison plot
plt.figure(figsize=(12, 8))
for solver_name, _ in available_solvers:
    avg_times = []
    for N in horizons:
        times = [t for t in results[solver_name][N] if not np.isnan(t)]
        avg_times.append(np.mean(times) if times else np.nan)
    
    if not all(np.isnan(t) for t in avg_times):
        plt.plot(horizons, avg_times, '-', label=solver_name)

plt.xlabel('Prediction Horizon (N)')
plt.ylabel('Average Solve Time (s)')
plt.title('QP Solver Benchmark Comparison')
plt.legend(bbox_to_anchor=(1.05, 1), loc='upper left')
plt.grid(True)
plt.tight_layout()
plt.savefig('solver_comparison_avg.png')
plt.show()