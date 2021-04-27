#ifndef QUEUES_H
#define QUEUES_H

#include <MKL25Z4.H>
#include <stdio.h>

#define Q_MAX_SIZE (256)


typedef struct {
  unsigned int Head; // Index of oldest data element
  unsigned int Tail; // Index of next free space
  unsigned int Size; // Number of elements in use
  uint8_t Data[Q_MAX_SIZE];
} volatile Q_T;


int Q_Empty(Q_T * q);
int Q_Full(Q_T * q);
int Q_Size(Q_T * q);
int Q_Enqueue(Q_T * q, uint8_t d);
uint8_t Q_Dequeue(Q_T * q);
void Q_Init(Q_T * q);


#endif
	