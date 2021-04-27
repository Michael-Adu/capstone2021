#include "MKL25Z4.h"
#include "pinset.h"

#define MASK(X) (1UL<<X)

#define RS 3,'D'
#define EN 2,'D' 
#define D0 0,'D'
#define D1 5,'D'
#define D2 13,'A'
#define D3 9,'C'
#define D4 8,'C'
#define D5 5,'A'
#define D6 4,'A'
#define D7 12,'A'


void lcd_initialize(void);
void lcd_write_instruc(unsigned char instruc);
void lcd_clear(void);
void print_bits(int num, int *arrayA);
void lcd_write_data(unsigned char c);
void lcd_init(void);
void lcd_goto(unsigned char column, unsigned char row);
void lcd_write_string(char *s);
void lcd_display(char *c, int row);
void init_lcd(void);

void lcd_display(char *c, int row)
{
	lcd_goto(0,row);
	lcd_write_string(c);
}

void init_lcd(void)
{
	lcd_initialize();
	lcd_init();
	lcd_clear();
}

void lcd_initialize(void)
{
	pinset(RS,1);
	pinset(EN,1);
	pinset(D0,1);
	pinset(D1,1);
	pinset(D2,1);
	pinset(D3,1);
	pinset(D4,1);
	pinset(D5,1);
	pinset(D6,1);
	pinset(D7,1);
}

void lcd_write_instruc(unsigned char instruc)
{
	pinstate(RS,0);
	pinstate(EN,0);
	
	int is[8]={0};
	print_bits(instruc,is);
		
	pinstate(D7,is[7]);
	pinstate(D6,is[6]);
	pinstate(D5,is[5]);
	pinstate(D4,is[4]);
	pinstate(D3,is[3]);
	pinstate(D2,is[2]);
	pinstate(D1,is[1]);
	pinstate(D0,is[0]);
	
	pinstate(EN,1);
	pinstate(EN,0);
}

void lcd_write_data(unsigned char c)
{
	pinstate(RS,1);
	pinstate(EN,0);
	
	int is[8]={0};
	print_bits(c,is);
	
	pinstate(D7,is[7]);
	pinstate(D6,is[6]);
	pinstate(D5,is[5]);
	pinstate(D4,is[4]);
	pinstate(D3,is[3]);
	pinstate(D2,is[2]);
	pinstate(D1,is[1]);
	pinstate(D0,is[0]);
	
	pinstate(EN,1);
	pinstate(EN,0);
	
}
void lcd_clear(void)
{
	lcd_write_instruc(0x01);
	lcd_write_instruc(0x02);
}

void lcd_init(void)
{
    	lcd_write_instruc(0x06);        //Increment mode for the cursor
    	lcd_write_instruc(0x0C);        //The display on, the cursor off
    	lcd_write_instruc(0x38);        //An 8-bit data bus, two-line display
}

void lcd_goto(unsigned char column, unsigned char row)
	{

	if(row==0)
	lcd_write_instruc(0x80 + column);
	if(row==1)
	lcd_write_instruc(0xC0+ column);
	}

void lcd_write_string(char *s)
	{
	while(*s != 0)
	{
	lcd_write_data(*s);
	s++;
	}

	}
void print_bits(int num, int *arrayA)
{
    for (int i=7;i>-1;i--)
    {
        if (num&MASK(i))
        {
            arrayA[i]=1;
        }
        else
        {
            arrayA[i]=0;   
        }
    }
}