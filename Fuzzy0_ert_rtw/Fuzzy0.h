/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * File: Fuzzy0.h
 *
 * Code generated for Simulink model 'Fuzzy0'.
 *
 * Model version                  : 1.16
 * Simulink Coder version         : 9.4 (R2020b) 29-Jul-2020
 * C/C++ source code generated on : Sat Apr 24 14:36:00 2021
 *
 * Target selection: ert.tlc
 * Embedded hardware selection: ARM Compatible->ARM Cortex
 * Code generation objectives:
 *    1. Execution efficiency
 *    2. RAM efficiency
 * Validation result: Not run
 */

#ifndef RTW_HEADER_Fuzzy0_h_
#define RTW_HEADER_Fuzzy0_h_
#include "rtwtypes.h"
#include <stddef.h>
#include <stddef.h>
#ifndef Fuzzy0_COMMON_INCLUDES_
#define Fuzzy0_COMMON_INCLUDES_
#include "rtwtypes.h"
#include "rtw_continuous.h"
#include "rtw_solver.h"
#endif                                 /* Fuzzy0_COMMON_INCLUDES_ */

#include "MW_target_hardware_resources.h"

/* Model Code Variants */

/* Macros for accessing real-time model data structure */
#ifndef rtmGetErrorStatus
#define rtmGetErrorStatus(rtm)         ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
#define rtmSetErrorStatus(rtm, val)    ((rtm)->errorStatus = (val))
#endif

#define Fuzzy0_M                       (rtM)

/* Forward declaration for rtModel */
typedef struct tag_RTM RT_MODEL;

#ifndef DEFINED_TYPEDEF_FOR_struct_6K1iC1tFCoi5utqxR1avEH_
#define DEFINED_TYPEDEF_FOR_struct_6K1iC1tFCoi5utqxR1avEH_

typedef struct {
  uint8_T SimulinkDiagnostic;
  uint8_T Model[29];
  uint8_T Block[53];
  uint8_T OutOfRangeInputValue;
  uint8_T NoRuleFired;
  uint8_T EmptyOutputFuzzySet;
} struct_6K1iC1tFCoi5utqxR1avEH;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_RCP1oovUDF2zF6C9vcJmtG_
#define DEFINED_TYPEDEF_FOR_struct_RCP1oovUDF2zF6C9vcJmtG_

typedef struct {
  uint8_T type[5];
  int32_T origTypeLength;
  real_T params[3];
  int32_T origParamLength;
} struct_RCP1oovUDF2zF6C9vcJmtG;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_xaJpTrGDqNmvd5vaYMDkGD_
#define DEFINED_TYPEDEF_FOR_struct_xaJpTrGDqNmvd5vaYMDkGD_

typedef struct {
  struct_RCP1oovUDF2zF6C9vcJmtG mf[7];
  int32_T origNumMF;
} struct_xaJpTrGDqNmvd5vaYMDkGD;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_MTMNYB1dsge5Wb9gY6jSr_
#define DEFINED_TYPEDEF_FOR_struct_MTMNYB1dsge5Wb9gY6jSr_

typedef struct {
  uint8_T type[7];
  uint8_T andMethod[3];
  uint8_T orMethod[3];
  uint8_T defuzzMethod[8];
  uint8_T impMethod[3];
  uint8_T aggMethod[3];
  real_T inputRange[2];
  real_T outputRange[2];
  struct_xaJpTrGDqNmvd5vaYMDkGD inputMF;
  struct_xaJpTrGDqNmvd5vaYMDkGD outputMF;
  real_T antecedent[8];
  real_T consequent[8];
  real_T connection[8];
  real_T weight[8];
  int32_T numSamples;
  int32_T numInputs;
  int32_T numOutputs;
  int32_T numRules;
  int32_T numInputMFs;
  int32_T numCumInputMFs;
  int32_T numOutputMFs;
  int32_T numCumOutputMFs;
  real_T outputSamplePoints[101];
  int32_T orrSize[2];
  int32_T aggSize[2];
  int32_T irrSize[2];
  int32_T rfsSize[2];
  int32_T sumSize[2];
  int32_T inputFuzzySetType;
} struct_MTMNYB1dsge5Wb9gY6jSr;

#endif

/* Block signals and states (default storage) for system '<Root>' */
typedef struct {
  real_T outputMFCache[707];
  real_T aggregatedOutputs[101];       /* '<S2>/Evaluate Rule Consequents' */
  real_T dv[101];
  real_T dv1[101];
  real_T dv2[101];
  real_T dv3[101];
  real_T dv4[101];
  real_T dv5[101];
  real_T dv6[101];
  real_T antecedentOutputs[8];         /* '<S2>/Evaluate Rule Antecedents' */
  real_T inputMFCache[7];
  real_T dv7[3];
  real_T sumAntecedentOutputs;
  real_T area;
} DW;

/* Constant parameters (default storage) */
typedef struct {
  /* Expression: fis.outputSamplePoints
   * Referenced by: '<S2>/Output Sample Points'
   */
  real_T OutputSamplePoints_Value[101];
} ConstP;

/* External inputs (root inport signals with default storage) */
typedef struct {
  real_T in;                           /* '<Root>/in' */
} ExtU;

/* External outputs (root outports fed by signals with default storage) */
typedef struct {
  real_T out;                          /* '<Root>/out' */
} ExtY;

/* Real-time Model Data Structure */
struct tag_RTM {
  const char_T *errorStatus;
};

/* Block signals and states (default storage) */
extern DW rtDW;

/* External inputs (root inport signals with default storage) */
extern ExtU rtU;

/* External outputs (root outports fed by signals with default storage) */
extern ExtY rtY;

/* Constant parameters (default storage) */
extern const ConstP rtConstP;

/* Model entry point functions */
extern void Fuzzy0_initialize(void);
extern void Fuzzy0_step(void);

/* Real-time Model object */
extern RT_MODEL *const rtM;
extern volatile boolean_T stopRequested;
extern volatile boolean_T runModel;

/*-
 * These blocks were eliminated from the model due to optimizations:
 *
 * Block '<S2>/InputConversion' : Eliminate redundant data type conversion
 */

/*-
 * The generated code includes comments that allow you to trace directly
 * back to the appropriate location in the model.  The basic format
 * is <system>/block_name, where system is the system number (uniquely
 * assigned by Simulink) and block_name is the name of the block.
 *
 * Note that this particular code originates from a subsystem build,
 * and has its own system numbers different from the parent model.
 * Refer to the system hierarchy for this subsystem below, and use the
 * MATLAB hilite_system command to trace the generated code back
 * to the parent model.  For example,
 *
 * hilite_system('Attempt2/Controller/Fuzzy Logic Controller')    - opens subsystem Attempt2/Controller/Fuzzy Logic Controller
 * hilite_system('Attempt2/Controller/Fuzzy Logic Controller/Kp') - opens and selects block Kp
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : 'Attempt2/Controller'
 * '<S1>'   : 'Attempt2/Controller/Fuzzy Logic Controller'
 * '<S2>'   : 'Attempt2/Controller/Fuzzy Logic Controller/Fuzzy Logic  Controller'
 * '<S3>'   : 'Attempt2/Controller/Fuzzy Logic Controller/Fuzzy Logic  Controller/Defuzzify Outputs'
 * '<S4>'   : 'Attempt2/Controller/Fuzzy Logic Controller/Fuzzy Logic  Controller/Evaluate Rule Antecedents'
 * '<S5>'   : 'Attempt2/Controller/Fuzzy Logic Controller/Fuzzy Logic  Controller/Evaluate Rule Consequents'
 */
#endif                                 /* RTW_HEADER_Fuzzy0_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
