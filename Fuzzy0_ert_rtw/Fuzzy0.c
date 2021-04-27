/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * File: Fuzzy0.c
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

#include "Fuzzy0.h"
#define NumBitsPerChar                 8U

/* Block signals and states (default storage) */
DW rtDW;

/* External inputs (root inport signals with default storage) */
ExtU rtU;

/* External outputs (root outports fed by signals with default storage) */
ExtY rtY;

/* Real-time model */
static RT_MODEL rtM_;
RT_MODEL *const rtM = &rtM_;

/* Forward declaration for local functions */
static real_T trimf(real_T x, const real_T params[3]);
static void trimf_o(const real_T x[101], const real_T params[3], real_T y[101]);
extern real_T rtInf;
extern real_T rtMinusInf;
extern real_T rtNaN;
extern real32_T rtInfF;
extern real32_T rtMinusInfF;
extern real32_T rtNaNF;
static void rt_InitInfAndNaN(size_t realSize);
static boolean_T rtIsInf(real_T value);
static boolean_T rtIsInfF(real32_T value);
static boolean_T rtIsNaN(real_T value);
static boolean_T rtIsNaNF(real32_T value);
typedef struct {
  struct {
    uint32_T wordH;
    uint32_T wordL;
  } words;
} BigEndianIEEEDouble;

typedef struct {
  struct {
    uint32_T wordL;
    uint32_T wordH;
  } words;
} LittleEndianIEEEDouble;

typedef struct {
  union {
    real32_T wordLreal;
    uint32_T wordLuint;
  } wordL;
} IEEESingle;

real_T rtInf;
real_T rtMinusInf;
real_T rtNaN;
real32_T rtInfF;
real32_T rtMinusInfF;
real32_T rtNaNF;
static real_T rtGetInf(void);
static real32_T rtGetInfF(void);
static real_T rtGetMinusInf(void);
static real32_T rtGetMinusInfF(void);
static real_T rtGetNaN(void);
static real32_T rtGetNaNF(void);

/*
 * Initialize the rtInf, rtMinusInf, and rtNaN needed by the
 * generated code. NaN is initialized as non-signaling. Assumes IEEE.
 */
static void rt_InitInfAndNaN(size_t realSize)
{
  (void) (realSize);
  rtNaN = rtGetNaN();
  rtNaNF = rtGetNaNF();
  rtInf = rtGetInf();
  rtInfF = rtGetInfF();
  rtMinusInf = rtGetMinusInf();
  rtMinusInfF = rtGetMinusInfF();
}

/* Test if value is infinite */
static boolean_T rtIsInf(real_T value)
{
  return (boolean_T)((value==rtInf || value==rtMinusInf) ? 1U : 0U);
}

/* Test if single-precision value is infinite */
static boolean_T rtIsInfF(real32_T value)
{
  return (boolean_T)(((value)==rtInfF || (value)==rtMinusInfF) ? 1U : 0U);
}

/* Test if value is not a number */
static boolean_T rtIsNaN(real_T value)
{
  boolean_T result = (boolean_T) 0;
  size_t bitsPerReal = sizeof(real_T) * (NumBitsPerChar);
  if (bitsPerReal == 32U) {
    result = rtIsNaNF((real32_T)value);
  } else {
    union {
      LittleEndianIEEEDouble bitVal;
      real_T fltVal;
    } tmpVal;

    tmpVal.fltVal = value;
    result = (boolean_T)((tmpVal.bitVal.words.wordH & 0x7FF00000) == 0x7FF00000 &&
                         ( (tmpVal.bitVal.words.wordH & 0x000FFFFF) != 0 ||
                          (tmpVal.bitVal.words.wordL != 0) ));
  }

  return result;
}

/* Test if single-precision value is not a number */
static boolean_T rtIsNaNF(real32_T value)
{
  IEEESingle tmp;
  tmp.wordL.wordLreal = value;
  return (boolean_T)( (tmp.wordL.wordLuint & 0x7F800000) == 0x7F800000 &&
                     (tmp.wordL.wordLuint & 0x007FFFFF) != 0 );
}

/*
 * Initialize rtInf needed by the generated code.
 * Inf is initialized as non-signaling. Assumes IEEE.
 */
static real_T rtGetInf(void)
{
  size_t bitsPerReal = sizeof(real_T) * (NumBitsPerChar);
  real_T inf = 0.0;
  if (bitsPerReal == 32U) {
    inf = rtGetInfF();
  } else {
    union {
      LittleEndianIEEEDouble bitVal;
      real_T fltVal;
    } tmpVal;

    tmpVal.bitVal.words.wordH = 0x7FF00000U;
    tmpVal.bitVal.words.wordL = 0x00000000U;
    inf = tmpVal.fltVal;
  }

  return inf;
}

/*
 * Initialize rtInfF needed by the generated code.
 * Inf is initialized as non-signaling. Assumes IEEE.
 */
static real32_T rtGetInfF(void)
{
  IEEESingle infF;
  infF.wordL.wordLuint = 0x7F800000U;
  return infF.wordL.wordLreal;
}

/*
 * Initialize rtMinusInf needed by the generated code.
 * Inf is initialized as non-signaling. Assumes IEEE.
 */
static real_T rtGetMinusInf(void)
{
  size_t bitsPerReal = sizeof(real_T) * (NumBitsPerChar);
  real_T minf = 0.0;
  if (bitsPerReal == 32U) {
    minf = rtGetMinusInfF();
  } else {
    union {
      LittleEndianIEEEDouble bitVal;
      real_T fltVal;
    } tmpVal;

    tmpVal.bitVal.words.wordH = 0xFFF00000U;
    tmpVal.bitVal.words.wordL = 0x00000000U;
    minf = tmpVal.fltVal;
  }

  return minf;
}

/*
 * Initialize rtMinusInfF needed by the generated code.
 * Inf is initialized as non-signaling. Assumes IEEE.
 */
static real32_T rtGetMinusInfF(void)
{
  IEEESingle minfF;
  minfF.wordL.wordLuint = 0xFF800000U;
  return minfF.wordL.wordLreal;
}

/*
 * Initialize rtNaN needed by the generated code.
 * NaN is initialized as non-signaling. Assumes IEEE.
 */
static real_T rtGetNaN(void)
{
  size_t bitsPerReal = sizeof(real_T) * (NumBitsPerChar);
  real_T nan = 0.0;
  if (bitsPerReal == 32U) {
    nan = rtGetNaNF();
  } else {
    union {
      LittleEndianIEEEDouble bitVal;
      real_T fltVal;
    } tmpVal;

    tmpVal.bitVal.words.wordH = 0xFFF80000U;
    tmpVal.bitVal.words.wordL = 0x00000000U;
    nan = tmpVal.fltVal;
  }

  return nan;
}

/*
 * Initialize rtNaNF needed by the generated code.
 * NaN is initialized as non-signaling. Assumes IEEE.
 */
static real32_T rtGetNaNF(void)
{
  IEEESingle nanF = { { 0 } };

  nanF.wordL.wordLuint = 0xFFC00000U;
  return nanF.wordL.wordLreal;
}

/* Function for MATLAB Function: '<S2>/Evaluate Rule Antecedents' */
static real_T trimf(real_T x, const real_T params[3])
{
  real_T y;
  y = 0.0;
  if ((params[0] != params[1]) && (params[0] < x) && (x < params[1])) {
    y = 1.0 / (params[1] - params[0]) * (x - params[0]);
  }

  if ((params[1] != params[2]) && (params[1] < x) && (x < params[2])) {
    y = 1.0 / (params[2] - params[1]) * (params[2] - x);
  }

  if (x == params[1]) {
    y = 1.0;
  }

  return y;
}

/* Function for MATLAB Function: '<S2>/Evaluate Rule Consequents' */
static void trimf_o(const real_T x[101], const real_T params[3], real_T y[101])
{
  real_T a;
  real_T b;
  real_T c;
  real_T x_0;
  int32_T i;
  a = params[0];
  b = params[1];
  c = params[2];
  for (i = 0; i < 101; i++) {
    x_0 = x[i];
    y[i] = 0.0;
    if ((a != b) && (a < x_0) && (x_0 < b)) {
      y[i] = 1.0 / (b - a) * (x_0 - a);
    }

    if ((b != c) && (b < x_0) && (x_0 < c)) {
      y[i] = 1.0 / (c - b) * (c - x_0);
    }

    if (x_0 == b) {
      y[i] = 1.0;
    }
  }
}

/* Model step function */
void Fuzzy0_step(void)
{
  static const real_T c[3] = { 56.6596194503171, 100.0, 125.0 };

  static const real_T c_0[3] = { 67.0928329809725, 100.422832980973,
    125.422832980973 };

  static const real_T d[3] = { 33.33, 50.0, 125.0 };

  static const real_T d_0[3] = { 33.33, 66.67, 100.0 };

  static const real_T e[3] = { 0.0, 33.33, 66.67 };

  static const real_T f[3] = { -66.67, -33.33, 0.0 };

  static const real_T f_0[3] = { -66.67, -33.33, 7.105E-15 };

  static const real_T g[3] = { -100.0, -66.67, -33.33 };

  static const real_T h[3] = { -137.5, -100.0, -66.67 };

  static const real_T h_0[3] = { -133.3, -100.0, -66.67 };

  static const int8_T b[8] = { 1, 1, 2, 3, 4, 5, 6, 7 };

  static const int8_T b_0[8] = { 1, 2, 2, 3, 4, 5, 6, 7 };

  real_T rtb_aggregatedOutputs;
  real_T x_idx_0;
  int32_T i;
  int32_T sampleID;

  /* Outputs for Atomic SubSystem: '<S1>/Fuzzy Logic  Controller' */
  /* MATLAB Function: '<S2>/Evaluate Rule Antecedents' incorporates:
   *  Inport: '<Root>/in'
   */
  rtDW.sumAntecedentOutputs = 0.0;
  rtDW.inputMFCache[0] = trimf(rtU.in, h);
  rtDW.inputMFCache[1] = trimf(rtU.in, g);
  rtDW.inputMFCache[2] = trimf(rtU.in, f);
  rtDW.dv7[0] = -33.33;
  rtDW.dv7[1] = 0.0;
  rtDW.dv7[2] = 33.33;
  rtDW.inputMFCache[3] = trimf(rtU.in, rtDW.dv7);
  rtDW.inputMFCache[4] = trimf(rtU.in, e);
  rtDW.inputMFCache[5] = trimf(rtU.in, d);
  rtDW.inputMFCache[6] = trimf(rtU.in, c);
  for (i = 0; i < 8; i++) {
    rtDW.area = rtDW.inputMFCache[b[i] - 1];
    if (!(1.0 > rtDW.area)) {
      rtDW.area = 1.0;
    }

    rtDW.sumAntecedentOutputs += rtDW.area;
    rtDW.antecedentOutputs[i] = rtDW.area;
  }

  /* MATLAB Function: '<S2>/Evaluate Rule Consequents' incorporates:
   *  Constant: '<S2>/Output Sample Points'
   */
  trimf_o(rtConstP.OutputSamplePoints_Value, h_0, rtDW.dv);
  trimf_o(rtConstP.OutputSamplePoints_Value, g, rtDW.dv1);
  trimf_o(rtConstP.OutputSamplePoints_Value, f_0, rtDW.dv2);
  rtDW.dv7[0] = -33.33;
  rtDW.dv7[1] = 0.0;
  rtDW.dv7[2] = 33.33;
  trimf_o(rtConstP.OutputSamplePoints_Value, rtDW.dv7, rtDW.dv3);
  trimf_o(rtConstP.OutputSamplePoints_Value, e, rtDW.dv4);
  trimf_o(rtConstP.OutputSamplePoints_Value, d_0, rtDW.dv5);
  trimf_o(rtConstP.OutputSamplePoints_Value, c_0, rtDW.dv6);
  for (i = 0; i < 101; i++) {
    rtDW.aggregatedOutputs[i] = 0.0;
    rtDW.outputMFCache[7 * i] = rtDW.dv[i];
    rtDW.outputMFCache[7 * i + 1] = rtDW.dv1[i];
    rtDW.outputMFCache[7 * i + 2] = rtDW.dv2[i];
    rtDW.outputMFCache[7 * i + 3] = rtDW.dv3[i];
    rtDW.outputMFCache[7 * i + 4] = rtDW.dv4[i];
    rtDW.outputMFCache[7 * i + 5] = rtDW.dv5[i];
    rtDW.outputMFCache[7 * i + 6] = rtDW.dv6[i];
  }

  for (i = 0; i < 8; i++) {
    for (sampleID = 0; sampleID < 101; sampleID++) {
      rtb_aggregatedOutputs = rtDW.aggregatedOutputs[sampleID];
      x_idx_0 = rtDW.outputMFCache[(7 * sampleID + b_0[i]) - 1];
      rtDW.area = rtDW.antecedentOutputs[i];
      if ((!(x_idx_0 > rtDW.area)) && (!rtIsNaN(x_idx_0))) {
        rtDW.area = x_idx_0;
      }

      if (rtb_aggregatedOutputs < rtDW.area) {
        rtb_aggregatedOutputs = rtDW.area;
      }

      rtDW.aggregatedOutputs[sampleID] = rtb_aggregatedOutputs;
    }
  }

  /* End of MATLAB Function: '<S2>/Evaluate Rule Consequents' */

  /* MATLAB Function: '<S2>/Defuzzify Outputs' incorporates:
   *  Constant: '<S2>/Output Sample Points'
   *  MATLAB Function: '<S2>/Evaluate Rule Antecedents'
   */
  if (rtDW.sumAntecedentOutputs == 0.0) {
    /* Outport: '<Root>/out' */
    rtY.out = 0.0;
  } else {
    rtDW.sumAntecedentOutputs = 0.0;
    rtDW.area = 0.0;
    for (i = 0; i < 101; i++) {
      rtDW.area += rtDW.aggregatedOutputs[i];
    }

    if (rtDW.area == 0.0) {
      /* Outport: '<Root>/out' */
      rtY.out = 0.0;
    } else {
      for (i = 0; i < 101; i++) {
        rtDW.sumAntecedentOutputs += rtConstP.OutputSamplePoints_Value[i] *
          rtDW.aggregatedOutputs[i];
      }

      /* Outport: '<Root>/out' incorporates:
       *  Constant: '<S2>/Output Sample Points'
       */
      rtY.out = 1.0 / rtDW.area * rtDW.sumAntecedentOutputs;
    }
  }

  /* End of MATLAB Function: '<S2>/Defuzzify Outputs' */
  /* End of Outputs for SubSystem: '<S1>/Fuzzy Logic  Controller' */
}

/* Model initialize function */
void Fuzzy0_initialize(void)
{
  /* Registration code */

  /* initialize non-finites */
  rt_InitInfAndNaN(sizeof(real_T));
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
