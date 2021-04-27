#include "uart.h"
#define OSR 15		//over sample rate (like a pre-scaler)
#define BAUD_RATE  	9600	//my communication rate on BT
#define SYS_CLOCK	20971520u	//

#define RX	1		//PTA1
#define TX	2		//PTA2

static inline void init_UART0pin(void);
void init_UART0(void)
{
	init_UART0pin();
	SIM->SOPT2 |= SIM_SOPT2_UART0SRC(1);
	// clock gate UART0
	SIM->SCGC4 |= SIM_SCGC4_UART0_MASK;		//clock gate UART0
	//compute set baud rate (SBR), choosing baud rate of 9600 for BT
	uint8_t sbr = (uint16_t)((SYS_CLOCK)/((OSR+1) *BAUD_RATE ));	//default OSR is 15, 	sbr=136.5 if SYS_CLOCK =20971520u
	//UART0->BDH |=((sbr>>8) & 0x1F);	//generic. set only bottom 5 bits
	UART0->BDH =0;			//0x0 for this calculation, other fields are default 0. 
	UART0->BDL=sbr;			//0x88 for this calculation
	// Rx Interrupt enabled, Tx & RX enable
	UART0->C2  |= UART_C2_RIE_MASK | UART_C2_TE_MASK | UART_C2_RE_MASK;
	//note: default is 8N1 if uart0->C1=0

	NVIC_SetPriority(UART0_IRQn, 3);
	NVIC_ClearPendingIRQ(UART0_IRQn);
	NVIC_EnableIRQ(UART0_IRQn);
	
}

static inline void init_UART0pin(void) 
{
	SIM->SCGC5 |= SIM_SCGC5_PORTA(1);
	PORTA->PCR[RX] &= ~PORT_PCR_MUX_MASK;  	//clear mux
	PORTA->PCR[RX] |=  PORT_PCR_MUX(2); 	//set for UART0 RX
	PORTA->PCR[TX] &= ~PORT_PCR_MUX_MASK;	//clear
	PORTA->PCR[TX] |=  PORT_PCR_MUX(2); 	//set for UART0 TX
}

