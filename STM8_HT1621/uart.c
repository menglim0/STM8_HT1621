
/*************** (C) COPYRIGHT  EW������ ***************************************
 * �ļ���  ��uart.c
 * ����    �����ڵ����ļ�   
 * ʵ��ƽ̨��EW STM8������ V1
 * ��汾  ��V2.1.0
 * ����    ��EW  QQ��307298507
 * ����΢�ţ�eworld2013
 * �޸�ʱ�䣺2013-07-20
*******************************************************************************/

/* ����ϵͳͷ�ļ� */

/* �����Զ���ͷ�ļ� */
#include "uart.h"

/* �Զ��������� */

/* �Զ���� */

/* �Զ������ */

/*ʵ�ֺ�������*/


/*******************************************************************************
 * ����: Uart_Init
 * ����: UART2��ʼ������
 * �β�: ��
 * ����: ��
 * ˵��: �� 
 ******************************************************************************/
void  UART2_Init(void)
{
    UART2_CR1=0x00;
    UART2_CR2=0x00;
    UART2_CR3=0x00;
    UART2_BRR2 = 0x01;
    UART2_BRR1 = 0x01;     //115200������
    UART2_CR2 = 0x2c;     //��������  �������� �����ж�ʹ��
}

void  UART2_Send(u8 dat)
{
    while((UART2_SR & 0x80)==0x00);
    UART2_DR = dat;
}


/*******************************************************************************
 * ����: UART2_SendString
 * ����: UART2����len���ַ�
 * �β�: data -> ָ��Ҫ���͵��ַ���
 *       len -> Ҫ���͵��ֽ���
 * ����: ��
 * ˵��: �� 
 ******************************************************************************/
void UART2_SendString(u8* Data)
{
	u16 i=0;
	//for(; i < len; i++)
        while(Data[i]!='\0')
        {
           UART2_Send(Data[i]);	/* ѭ�����÷���һ���ַ����� */
           i++;
        }
		
}

/*******************************************************************************
 * ����: void putchar(char ch)
 * ����: ��ӡһ���ַ�
 * �β�: ��Ҫ������ַ�
 * ����: ��
 * ˵��: ��

 ******************************************************************************/
void putchar(char ch)		// print normal characters or '\n'
{	  
	if('\n' == ch)
	{
		UART2_Send('\r');
	}

	UART2_Send(ch);

}

/*******************************************************************************
 * ����: void printf_str(unsigned char *buffer)
 * ����: ��ӡ�ַ���
 * �β�: ��Ҫ��ӡ���ַ����׵�ַ
 * ����: ��
 * ˵��: ����   printf_str("this is a uart test");

 ******************************************************************************/
void printf_str(unsigned char *buffer)
{
	while (*buffer != '\0')
	{
	    putchar(*buffer++);
    }
}

/*******************************************************************************
 * ����: void putascbase(unsigned char ch)
 * ����: ���ַ�ת����ASIC���
 * �β�: ��Ҫ��ӡ���ַ�
 * ����: ��
 * ˵��: �����������16����55���ڴ��ڵ�������û����16������ʾ��
 					��ʱ����putascbase(0x55);

 ******************************************************************************/
void putascbase(unsigned char ch)
{
	 unsigned char i, j;//,k;
	 //for(k = 0; k<4 ;k++)
	 {
	     i = (ch>>4) & 0x0f;
	     j = ch & 0x0f;
	     if (i>9) i += 7;
	
	     if (j>9) j += 7;
	     putchar(i+0x30);
	     putchar(j+0x30);
     }

//	 printf("\n");
}

/*******************************************************************************
 * ����: void putasc(unsigned char ch)
 * ����: ���ַ�ת����ASIC���������
 * �β�: ��Ҫ��ӡ���ַ�
 * ����: ��
 * ˵��: ��

 ******************************************************************************/
void putasc(unsigned char ch)
{
	 putascbase(ch);
	 putchar(' ');
//	 printf("\n");
}

/*******************************************************************************
 * ����: void putascLong(unsigned long ch)
 * ����: ���һ��4�ֽڳ��ȵ��ַ�
 * �β�: ��Ҫ������ַ�
 * ����: ��
 * ˵��: ��

 ******************************************************************************/
void putascLong(unsigned long ch)
{
	 unsigned char i, j,k;
	 for(k = 0; k<4 ;k++)
	 {
	     i = (((u8 *)&ch)[k]>>4) & 0x0f;
	     j = ((u8 *)&ch)[k] & 0x0f;
	     if (i>9) i += 7;
	
	     if (j>9) j += 7;
	     putchar(i+0x30);
	     putchar(j+0x30);
     }
	 putchar(' ');

}
/*******************************************************************************
 * ����: void putascShort(unsigned short ch)
 * ����: ���һ��2�ֽڳ��ȵ��ַ�
 * �β�: ��Ҫ������ַ�
 * ����: ��
 * ˵��: �� 

 ******************************************************************************/
void putascShort(unsigned short ch)
{
	 putascbase(ch>>8);
	 putascbase(ch>>0);
	 putchar(' ');
//	 printf("\n");	 //*/
}
/*******************************************************************************
 * ����: void printf_array(unsigned char *buffer, unsigned short  cnt) 
 * ����: �������
 * �β�: �����׵�ַ������
 * ����: ��
 * ˵��: ���BUF[10]
 					printf_array(BUF,10);

 ******************************************************************************/
void printf_array(unsigned char *buffer, unsigned short  cnt) 
{
	u16 i;
	for(i=0; i< cnt; i++)
	{
		putasc(buffer[i]);
		if(((i+1)%16)==0)
		    putchar('\n');	 
	}
		  
}   //*/


/******************* (C) COPYRIGHT EW������ *****END OF FILE******************/