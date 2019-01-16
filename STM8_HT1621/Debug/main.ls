   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
2821                     ; 9 void  delay_ms(u16  ms)
2821                     ; 10 {
2823                     	switch	.text
2824  0000               _delay_ms:
2826  0000 89            	pushw	x
2827  0001 89            	pushw	x
2828       00000002      OFST:	set	2
2831  0002 2014          	jra	L5102
2832  0004               L3102:
2833                     ; 14         for(i=4;i!=0;i--)
2835  0004 a604          	ld	a,#4
2836  0006 6b01          	ld	(OFST-1,sp),a
2837  0008               L1202:
2838                     ; 15           for(j=100;j!=0;j--);
2840  0008 a664          	ld	a,#100
2841  000a 6b02          	ld	(OFST+0,sp),a
2842  000c               L7202:
2846  000c 0a02          	dec	(OFST+0,sp)
2849  000e 0d02          	tnz	(OFST+0,sp)
2850  0010 26fa          	jrne	L7202
2851                     ; 14         for(i=4;i!=0;i--)
2853  0012 0a01          	dec	(OFST-1,sp)
2856  0014 0d01          	tnz	(OFST-1,sp)
2857  0016 26f0          	jrne	L1202
2858  0018               L5102:
2859                     ; 12     while(ms--)
2861  0018 1e03          	ldw	x,(OFST+1,sp)
2862  001a 1d0001        	subw	x,#1
2863  001d 1f03          	ldw	(OFST+1,sp),x
2864  001f 1c0001        	addw	x,#1
2865  0022 a30000        	cpw	x,#0
2866  0025 26dd          	jrne	L3102
2867                     ; 17 }
2870  0027 5b04          	addw	sp,#4
2871  0029 81            	ret
2901                     ; 19 main()
2901                     ; 20 {
2902                     	switch	.text
2903  002a               _main:
2907                     ; 21 	_asm("sim");
2910  002a 9b            sim
2912                     ; 22 	UART2_Init();
2914  002b cd0000        	call	_UART2_Init
2916                     ; 23 	_asm("rim");
2919  002e 9a            rim
2921                     ; 24 		UART2_Send(0x55);
2923  002f a655          	ld	a,#85
2924  0031 cd0000        	call	_UART2_Send
2926                     ; 25 		UART2_Send(0xaa);	
2928  0034 a6aa          	ld	a,#170
2929  0036 cd0000        	call	_UART2_Send
2931                     ; 26 		ADC_Init();
2933  0039 cd0000        	call	_ADC_Init
2935  003c               L5402:
2936                     ; 30 		delay_ms(2000);
2938  003c ae07d0        	ldw	x,#2000
2939  003f adbf          	call	_delay_ms
2941                     ; 31 		printf_str("\nadc=:");
2943  0041 ae0000        	ldw	x,#L1502
2944  0044 cd0000        	call	_printf_str
2946                     ; 32 		putascShort(ADC_GetVal());
2948  0047 cd0000        	call	_ADC_GetVal
2950  004a cd0000        	call	_putascShort
2953  004d 20ed          	jra	L5402
2966                     	xdef	_main
2967                     	xref	_ADC_GetVal
2968                     	xref	_ADC_Init
2969                     	xdef	_delay_ms
2970                     	xref	_putascShort
2971                     	xref	_printf_str
2972                     	xref	_UART2_Send
2973                     	xref	_UART2_Init
2974                     .const:	section	.text
2975  0000               L1502:
2976  0000 0a6164633d3a  	dc.b	10,97,100,99,61,58,0
2996                     	end
