#ifndef _LCD_H
#define _LCD_H

extern void lcd_initialize(void);
extern void lcd_write_instruc(unsigned char instruc);
extern void lcd_clear(void);
extern void print_bits(int num, int *arrayA);
extern void lcd_write_data(unsigned char c);
extern void lcd_init(void);
extern void lcd_goto(unsigned char column, unsigned char row);
extern void lcd_write_string(char *s);
extern void lcd_display(char *c, int row);
extern void init_lcd(void);

#endif