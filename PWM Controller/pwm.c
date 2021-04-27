#include "MKL25Z4.h"
#include "pinset.h"
#include "pindef.h"

void init_tpm(int cnv);
static inline void tpmpin(short PINEN, char pn); //Using TPMPIN code from above
void inputcap(unsigned long mod);

#define MASK(X)  (1<<X)

void init_tpm(int cnv)
	{
	tpmpin(PTB2);
		
	SIM->SCGC6 |=SIM_SCGC6_TPM2_MASK;	//*******TPM2 channel 0
	//Select clock source in SIM_SOPT
	SIM->SOPT2 |= SIM_SOPT2_TPMSRC(1);
	
	TPM2->MOD= 0xCCCD;

	TPM2_C0SC |= TPM_CnSC_MSB(1) | TPM_CnSC_ELSB(1);
		
	TPM2_C0SC |= TPM_CnSC_CHF_MASK;  //clear spurious interrupts

	TPM2->CONTROLS[0].CnV =cnv;

	TPM2->SC |= TPM_SC_PS(7) | TPM_SC_CMOD(1)|TPM_SC_CPWMS(0);
	
	TPM2->SC |=  TPM_SC_TOF_MASK| TPM_SC_TOIE_MASK  ;
	
	NVIC_ClearPendingIRQ(TPM2_IRQn);
	NVIC_SetPriority(TPM2_IRQn, 3);
	NVIC_EnableIRQ(TPM2_IRQn);

	}
	
static inline void tpmpin(short PINEN, char pn) 
{
	switch(pn) 
	{ 
		case 'A': 
			SIM->SCGC5 |=SIM_SCGC5_PORTA_MASK; 
			PORTA ->PCR[PINEN] &= ~PORT_PCR_MUX_MASK; 
			PORTA ->PCR[PINEN] |= PORT_PCR_MUX(3); 
			break; 
		case 'B': 
			SIM->SCGC5 |=SIM_SCGC5_PORTB_MASK; 
			PORTB ->PCR[PINEN] &= ~PORT_PCR_MUX_MASK; 
			PORTB ->PCR[PINEN] |= PORT_PCR_MUX(3); 
			break; 
		case 'C': 
			SIM->SCGC5 |=SIM_SCGC5_PORTC_MASK; 
			PORTC ->PCR[PINEN] &= ~PORT_PCR_MUX_MASK; 
			PORTC ->PCR[PINEN] |= PORT_PCR_MUX(3); 
			break; 
		case 'D': 
			SIM->SCGC5 |=SIM_SCGC5_PORTD_MASK; 
			PORTD ->PCR[PINEN] &= ~PORT_PCR_MUX_MASK;
			PORTD ->PCR[PINEN] |= PORT_PCR_MUX(4); 
			break; 
		case 'E': 
			SIM->SCGC5 |=SIM_SCGC5_PORTE_MASK; 
			PORTE ->PCR[PINEN] &= ~PORT_PCR_MUX_MASK; 
			PORTE ->PCR[PINEN] |= PORT_PCR_MUX(3);  
			break; 
	} 
}