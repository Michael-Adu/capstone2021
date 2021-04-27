#ifndef _PINSET_H
#define _PINSET_H

void pinset(int PINEN, char pn, int input);
void pinstate(int PINEN, char pn, int state);
void pintoggle(int PINEN, char pn);
void delay(int n);

#endif