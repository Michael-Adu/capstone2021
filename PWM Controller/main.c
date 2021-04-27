#include "main.h"

int main()
{
	initialize();
	Send_String(buff);
	int start = micro;
	while(1)
	{
		sprintf(buff,"Set Speed : %d\n",speed);
		sprintf(value,"RPM Value = %d",rpm_val);
	}
}

void initialize()
{
	pinset(PTB0,0);
	SysTick->LOAD = (20971520u/1000u)-1 ;  //configure for every milli sec restart.
  SysTick->CTRL |= SysTick_CTRL_CLKSOURCE_Msk | SysTick_CTRL_ENABLE_Msk |(SysTick_CTRL_TICKINT_Msk);
	//pit_initialize();
	init_lcd();
	init_tpm(0);
	init_UART0();
	Q_Init(&TxQ);
	Q_Init(&RxQ);
	rxChar='s';
}
void SysTick_Handler(void)
{
	micro++;
	millis++;
	Hallsense();
	if (millis-millis_end>0)
	{
		millis=0;
		Send_String(buff);
		Send_String(value);
	}
	
	lcd_display(value,1);
	doTxRx_task();
}

void UART0_IRQHandler(void) {
	//Uart Receive character handler
	uint8_t ch;
	
	if (UART0->S1 & (UART_S1_OR_MASK |UART_S1_NF_MASK |
		UART_S1_FE_MASK | UART_S1_PF_MASK)) {
			// clear the error flags
			UART0->S1 |= UART0_S1_OR_MASK | UART0_S1_NF_MASK |
									UART0_S1_FE_MASK | UART0_S1_PF_MASK;
			// read the data register to clear RDRF
			ch = UART0->D;
	}
	if (UART0->S1 & UART0_S1_RDRF_MASK) {
		// received a character
		ch = UART0->D;
		rxChar=ch;		//to enable me take some action
		if (!Q_Full(&RxQ)) {
			Q_Enqueue(&RxQ, ch);
		} else {
			// error - queue full, discard character
		}
	}
	if ( (UART0->C2 & UART0_C2_TIE_MASK) && // transmitter interrupt enabled
			(UART0->S1 & UART0_S1_TDRE_MASK) ) { // tx buffer empty
		// can send another character
		if (!Q_Empty(&TxQ)) {
			UART0->D = Q_Dequeue(&TxQ);
		} else {
			// queue is empty so disable transmitter interrupt
			UART0->C2 &= ~UART0_C2_TIE_MASK;
		}
	}
}

void Send_String(uint8_t * str) {
	// enqueue string
	while (*str != '\0') { // copy characters up to null terminator
		while (Q_Full(&TxQ))
			; // wait for space to open up
		Q_Enqueue(&TxQ, *str);
		str++;
	}
	// start transmitter if it isn't already running
	if (!(UART0->C2 & UART0_C2_TIE_MASK)) {
		UART0->D = Q_Dequeue(&TxQ);
		UART0->C2 |= UART0_C2_TIE(1);
	}
}

void TPM2_IRQHandler(){
	//motor control calling
	TPM2->SC |= TPM_SC_TOF_MASK ; //clear the interrupt
	motor_ctrl();
	
}

void motor_ctrl(void)
{
	static int tpmval=0;
	switch (rxChar)
		{
		case 'h':
			//Half Speed
			speed=50;
			tpmval=(52428)/(100/speed);
			break;
		case 'f':
			//Full Speed
			speed=100;
			tpmval=(52428)/(100/speed);
			break;
		case 'i':
			//Increase Speed
			speed=speed+10;
			tpmval+=52428/10;
			rxChar='p';
			break;
		case 'd':
			//Decreases Speed
			speed=speed-10;
			tpmval-=(52428)/10;
			rxChar='p';
			break;
		case 's':
			speed=0;
			tpmval=(52428)/speed;
				break;
		default:
			break;
		}
		if (speed==0)
		{
			tpmval=(52428)/speed;
		}
		TPM2->CONTROLS[0].CnV=tpmval;
}
void speed_ctrl(int speed)
{
	static int tpmval=0;
	if (speed==0)
		{
			tpmval=0;
		}
	else
		{
			tpmval+=(52428)/speed;
		}
	
	TPM2->CONTROLS[0].CnV=tpmval;
}

void doTxRx_task(void)
{	
	uint8_t buffer[80], c, * bp;
	if (Q_Size(&RxQ) == 0)
		return;	//nothing received. Exit
	//lightLED();
	//echo character sent:
	c = Q_Dequeue(&RxQ);
	sprintf((char *) buffer, "Data sent %c", c);
	// enqueue string
	bp = buffer;
	while (*bp != '\0') 
	{	//enqueue full string
		while (Q_Full(&TxQ)) ; // wait if buffer full
		Q_Enqueue(&TxQ, *bp);
		bp++;
	}
	// start transmitter if it isn't already running
	if (!(UART0->C2 & UART0_C2_TIE_MASK)) 
	{
		UART0->C2 |= UART0_C2_TIE(1);
	}
}

void Hallsense (void)
{
	if (HALL){;}
	else
		{
			hall_count++;
		}
	if (hall_count>=hall_thresh)
		{
			int end = micro;
			time_passed = ((end - start) / 100);
			rpm_val = (hall_count / time_passed)*60;
			hall_count = 0;
			start = micro;
		}
		//delay(1);
}
