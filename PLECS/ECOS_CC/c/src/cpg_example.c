#include "DllHeader.h"
#include "cpg_workspace.h"
#include "cpg_solve.h"




static int i;

DLLEXPORT void plecsSetSizes(struct SimulationSizes* aSizes)
{
   aSizes->numInputs = 4;
   aSizes->numOutputs = 2;
   aSizes->numStates = 0;
   aSizes->numParameters = 0; //number of user parameters passed in
}


//This function is automatically called at the beginning of the simulation
DLLEXPORT void plecsStart(struct SimulationState* aState)
{
 
		
}


//This function is automatically called every sample time
//output is written to DLL output port after the output delay
DLLEXPORT void plecsOutput(struct SimulationState* aState)
{
   // Update initial states
   // Index, input
  cpg_update_initialState(0, aState->inputs[0]);
  cpg_update_initialState(1, aState->inputs[1]);

  // Update initial states
  // Index, input
  cpg_update_referenceState(0, aState->inputs[2]);
  cpg_update_referenceState(1, aState->inputs[3]);

   // Solve the problem instance
  cpg_solve();

   aState->outputs[0]=CPG_Result.prim->controlAction[0];
   aState->outputs[1]=CPG_Result.prim->controlAction[1];

  
      
  
}

