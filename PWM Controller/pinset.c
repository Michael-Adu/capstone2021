//Pinsetup Library
#include "MKL25Z4.h"
#define MASK(X) (1UL<<X)

void pinset(int PINEN, char pn, int input);
void portenable(char x);
void pinstart(int PINEN, char pn, int input);
void pinstate(int PINEN, char pn, int state);
void pintoggle(int PINEN, char pn);
void delay(int n);

void pinset(int PINEN, char pn, int input)
{
	portenable(pn);
	pinstart(PINEN,pn,input);
}

void portenable(char x)
{
	switch(x)
	{
		case 'A':
			SIM->SCGC5 |= MASK(9);
			break;
		case 'B':
			SIM->SCGC5 |= MASK(10) ;
			break;
		case 'C':
			SIM->SCGC5 |= MASK(11) ;
		case 'D':
			SIM->SCGC5 |= MASK(12) ;
		case 'E':
			SIM->SCGC5 |= MASK(13) ;
		default:
			break;
	}
}

void pinstart(int PINEN, char pn, int input)
{
	switch(pn)
	{
		case 'A':
			PORTA ->PCR[PINEN] &= ~PORT_PCR_MUX_MASK;
			PORTA ->PCR[PINEN] |= MASK(8);
		
			if (input==1)
			{
				PTA->PDDR |= MASK(PINEN);
			}
			else
			{
				PTA->PDDR &= ~ MASK(PINEN);
			}
			break;
		case 'B':
			PORTB ->PCR[PINEN] &= ~PORT_PCR_MUX_MASK;
			PORTB ->PCR[PINEN] |= MASK(8);
			if (input==1)
			{
				PTB->PDDR |= MASK(PINEN);
			}
			else
			{
				PTB->PDDR &= ~ MASK(PINEN);
			}
			break;
		case 'C':
			PORTC ->PCR[PINEN] &= ~PORT_PCR_MUX_MASK;
			PORTC ->PCR[PINEN] |= MASK(8);
			if (input==1)
			{
				PTC->PDDR |= MASK(PINEN);
			}
			else
			{
				PTC->PDDR &= ~ MASK(PINEN);
			}
			break;
		case 'D':
			PORTD ->PCR[PINEN] &= ~PORT_PCR_MUX_MASK;
			PORTD ->PCR[PINEN] |= MASK(8);
			if (input==1)
			{
				PTD->PDDR |= MASK(PINEN);
			}
			else
			{
				PTD->PDDR &= ~ MASK(PINEN);
			}
			break;
		case 'E':
			PORTE ->PCR[PINEN] &= ~PORT_PCR_MUX_MASK;
			PORTE ->PCR[PINEN] |= MASK(8);
			if (input==1)
			{
				PTE->PDDR |= MASK(PINEN);
			}
			else
			{
				PTE->PDDR &= ~ MASK(PINEN);
			}
			break;
					
	}
	
}

void pinstate(int PINEN, char pn, int state)
{
	switch(pn)
	{
		case 'A':
			if (state==(1))
			{
				PTA->PSOR|=MASK(PINEN);
			}
			else
			{
				PTA->PCOR|=MASK(PINEN);
			}
			break;
		case 'B':
			if (state==(1))
			{
				PTB->PSOR|=MASK(PINEN);
			}
			else
			{
				PTB->PCOR|=MASK(PINEN);
			}
			break;
		case 'C':
			if (state==(1))
			{
				PTC->PSOR|=MASK(PINEN);
			}
			else
			{
				PTC->PCOR|=MASK(PINEN);
			}
			break;
		case 'D':
			if (state==(1))
			{
				PTD->PSOR|=MASK(PINEN);
			}
			else
			{
				PTD->PCOR|=MASK(PINEN);
			}
			break;
		case 'E':
			if (state==(1))
			{
				PTE->PSOR|=MASK(PINEN);
			}
			else
			{
				PTE->PCOR|=MASK(PINEN);
			}
			break;
			
			default:
				break;
	}
	
}

void pintoggle(int PINEN, char pn)
{
	switch(pn)
	{
		case 'A':
			PTA->PTOR|=MASK(PINEN);
			break;
		case 'B':
			PTB->PTOR|=MASK(PINEN);
			break;
		case 'C':
			PTC->PTOR|=MASK(PINEN);
			break;
		case 'D':
			PTD->PTOR|=MASK(PINEN);
			break;
		case 'E':
			PTE->PTOR|=MASK(PINEN);
			break;
		default:
			break;
	}		
}
void delay(int n){
	for (int j=0; j<n; j++)
		//for (int i=0; i<0x180000; i++);
		for (int i=0; i<0x48000; i++);
}