#include "timers.h"

static inline void systickset(void)
{
	SysTick->LOAD = (20971520u/1u)-1 ;  //configure for every milli sec restart.
  SysTick->CTRL |= SysTick_CTRL_CLKSOURCE_Msk | SysTick_CTRL_ENABLE_Msk |(SysTick_CTRL_TICKINT_Msk);
}