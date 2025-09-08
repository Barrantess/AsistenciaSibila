
/*
 * Include Files
 *
 */
#if defined(MATLAB_MEX_FILE)
#include "tmwtypes.h"
#include "simstruc_types.h"
#else
#define SIMPLIFIED_RTWTYPES_COMPATIBILITY
#include "rtwtypes.h"
#undef SIMPLIFIED_RTWTYPES_COMPATIBILITY
#endif



/* %%%-SFUNWIZ_wrapper_includes_Changes_BEGIN --- EDIT HERE TO _END */
#include "cpg_workspace.h"
#include "cpg_solve.h"
static int i;
/* %%%-SFUNWIZ_wrapper_includes_Changes_END --- EDIT HERE TO _BEGIN */
#define u_width 2
#define u_1_width 2
#define y_width 2

/*
 * Create external references here.  
 *
 */
/* %%%-SFUNWIZ_wrapper_externs_Changes_BEGIN --- EDIT HERE TO _END */
/* extern double func(double a); */
/* %%%-SFUNWIZ_wrapper_externs_Changes_END --- EDIT HERE TO _BEGIN */

/*
 * Output function
 *
 */
extern void SCS_CC_Outputs_wrapper(const real_T *x0,
			const real_T *xref,
			real_T *u);

void SCS_CC_Outputs_wrapper(const real_T *x0,
			const real_T *xref,
			real_T *u)
{
/* %%%-SFUNWIZ_wrapper_Outputs_Changes_BEGIN --- EDIT HERE TO _END */
// Update initial states
   // Index, input
  cpg_update_initialState(0, x0[0]);
  cpg_update_initialState(1, x0[1]);

  // Update initial states
  // Index, input
  cpg_update_referenceState(0, xref[0]);
  cpg_update_referenceState(1, xref[1]);

   // Solve the problem instance
  cpg_solve();

   u[0]=CPG_Result.prim->controlAction[0];
   u[1]=CPG_Result.prim->controlAction[1];
/* %%%-SFUNWIZ_wrapper_Outputs_Changes_END --- EDIT HERE TO _BEGIN */
}


