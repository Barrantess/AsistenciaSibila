import cvxpy as cp
import numpy as np
from cvxpygen import cpg

# Parámetros
fcr = 5000
T = 1/(2*fcr)
L = 2.5e-3

# Variables
u = cp.Variable(2,name='controlAction')
x0 = cp.Parameter(2, name='initialState')
xref = cp.Parameter(2, name='referenceState')

# Matrices de estado
A = np.array([[1, 0],
              [0, 1]])
B = np.array([[-T/L, 0],
              [0, -T/L]])

# Matrices de coste
Q = np.array([[1, 0], 
              [0, 1]])

R = np.array([[1e-3, 0],
              [0, 1e-3]])

# Función de coste
stateSpace = A @ x0 + B @ u  

cost = cp.quad_form(stateSpace-xref, Q) + cp.quad_form(u, R)

# Problema
problem = cp.Problem(cp.Minimize(cost))

# Generar código C
cpg.generate_code(problem, code_dir='OSQP_CC', solver='OSQP', wrapper=False)
"""
x0.value = np.array([0, 0])    # estado inicial igual en ambos ejes
xref.value = np.array([0, 0])  # referencia igual en ambos ejes

# Resolver
problem.solve(solver=cp.OSQP)

# Mostrar resultados
print("u* =", u.value)
print("cost =", problem.value)
"""
