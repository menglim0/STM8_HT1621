/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */
 
#include "common.h"
#include "adc.h"

void  delay_ms(u16  ms)
{
    u8  i,j;
    while(ms--)
    {
        for(i=4;i!=0;i--)
          for(j=100;j!=0;j--);
    }
}

main()
{
	_asm("sim");
	UART2_Init();
	_asm("rim");
		UART2_Send(0x55);
		UART2_Send(0xaa);	
		ADC_Init();
	while (1)
  {

		delay_ms(2000);
		printf_str("\nadc=:");
		putascShort(ADC_GetVal());

  }
}