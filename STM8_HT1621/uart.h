/*************** (C) COPYRIGHT  EW������ ***************************************
 * �ļ���  ��uart.h
 * ����    �����ڵ����ļ�   
 * ʵ��ƽ̨��EW STM8������ V1
 * ��汾  ��V2.1.0
 * ����    ��EW  QQ��307298507
 * ����΢�ţ�eworld2013
 * �޸�ʱ�䣺2013-07-20
*******************************************************************************/
#ifndef __UART_H
#define __UART_H

/* ����ϵͳͷ�ļ� */

/* �����Զ���ͷ�ļ� */
#include "common.h"

/* �Զ����������� */


/* �Զ��峣����ͱ��ʽ�� */

/* �������ⲿʹ�õı��� */

/* �������ⲿʹ�õĺ��� */
//void  delay_ms(u8  ms);
void  UART2_Init(void);
void  UART2_Send(u8 dat);
void UART2_SendString(u8* Data);

void putchar(char ch);
void printf_str(unsigned char *buffer);
void putascbase(unsigned char ch);
void putasc(unsigned char ch);
void putascLong(unsigned long ch);
void putascShort(unsigned short ch);
void printf_array(unsigned char *buffer, unsigned short  cnt) ;

#endif