/*************** (C) COPYRIGHT  EW工作室 ***************************************
 * 文件名  ：uart.h
 * 描述    ：串口调试文件   
 * 实验平台：EW STM8开发板 V1
 * 库版本  ：V2.1.0
 * 作者    ：EW  QQ：307298507
 * 公众微信：eworld2013
 * 修改时间：2013-07-20
*******************************************************************************/
#ifndef __UART_H
#define __UART_H

/* 包含系统头文件 */

/* 包含自定义头文件 */
#include "common.h"

/* 自定义数据类型 */


/* 自定义常量宏和表达式宏 */

/* 声明给外部使用的变量 */

/* 声明给外部使用的函数 */
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