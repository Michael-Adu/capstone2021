/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * File: ert_main.c
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
#include "rtwtypes.h"

volatile int IsrOverrun = 0;
static boolean_T OverrunFlag = 0;
void rt_OneStep(void)
{
  /* Check for overrun. Protect OverrunFlag against preemption */
  if (OverrunFlag++) {
    IsrOverrun = 1;
    OverrunFlag--;
    return;
  }

  __enable_irq();
  Fuzzy0_step();

  /* Get model outputs here */
  __disable_irq();
  OverrunFlag--;
}

volatile boolean_T stopRequested;
volatile boolean_T runModel;
int main(void)
{
  float modelBaseRate = 0.001;
  float systemClock = 48;

  /* Initialize variables */
  stopRequested = false;
  runModel = false;
  BoardInit();
  rtmSetErrorStatus(rtM, 0);
  Fuzzy0_initialize();

#ifdef EXT_MODE

  wait_ms(1000);

#endif

  (void) systemClock;
  ARMCM_SysTick_Config(modelBaseRate);
  runModel =
    rtmGetErrorStatus(rtM) == (NULL);
  __enable_irq();
  while (runModel) {
    stopRequested = !(
                      rtmGetErrorStatus(rtM) == (NULL));
    runModel = !(stopRequested);
  }

  /* Disable rt_OneStep() here */
#ifdef EXT_MODE

  wait_ms(1000);

#endif

  (void) systemClock;
  return 0;
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
