#include "MKL25Z4.h"
#include "stdio.h"
#include "pindef.h"
#include "pinset.h"
#include "pwm.h"
#include "queue.h"
#include "uart.h"
#include "timers.h"
#include "lcddisp.h"

volatile char rxChar;
extern void doTxRx_task(void);
extern void pit_initialize(void);
extern void Send_String(uint8_t * str);
Q_T TxQ, RxQ;

int speed=0;
int micro=0;
int millis=0;
int millis_end=1000;
int start = 0;
int time_passed=0;
int rpm_val=0;
int hall_thresh = 20;
int hall_count = 0;
int current_speed=0;

#define HALLSENSORPIN 0
#define HALL PTB->PDIR & MASK(HALLSENSORPIN)
#define MASK(X) (1UL<<X)

void initialize();
void motor_ctrl();
void speed_ctrl(int speed);
uint8_t buff[30]="Start";
uint8_t value[30]="0";
void Hallsense (void);