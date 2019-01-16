   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
2795                     ; 34 void ADC_Init(void)
2795                     ; 35 {
2797                     	switch	.text
2798  0000               _ADC_Init:
2802                     ; 36 	ADC_CR1 |= 0X01; //打开ADC
2804  0000 72105401      	bset	_ADC_CR1,#0
2805                     ; 37 	ADC_CR1 |= 0X72; //配置连续转换，配置时钟18分频
2807  0004 c65401        	ld	a,_ADC_CR1
2808  0007 aa72          	or	a,#114
2809  0009 c75401        	ld	_ADC_CR1,a
2810                     ; 38 	ADC_CSR |= 0X09;//选中通道3
2812  000c c65400        	ld	a,_ADC_CSR
2813  000f aa09          	or	a,#9
2814  0011 c75400        	ld	_ADC_CSR,a
2815                     ; 39 	ADC_CR2 |= 0X08;//右对齐
2817  0014 72165402      	bset	_ADC_CR2,#3
2818                     ; 40 	ADC_CR1 |= 0X01; //启动ADC
2820  0018 72105401      	bset	_ADC_CR1,#0
2821                     ; 41 }
2824  001c 81            	ret
2860                     ; 43 u16 ADC_GetVal(void)
2860                     ; 44 {
2861                     	switch	.text
2862  001d               _ADC_GetVal:
2864  001d 89            	pushw	x
2865       00000002      OFST:	set	2
2868                     ; 45 	u16 temp=0;
2870  001e 5f            	clrw	x
2871  001f 1f01          	ldw	(OFST-1,sp),x
2872                     ; 46 	temp = (u16)(ADC_DRH);
2874  0021 c65404        	ld	a,_ADC_DRH
2875  0024 5f            	clrw	x
2876  0025 97            	ld	xl,a
2877  0026 1f01          	ldw	(OFST-1,sp),x
2878                     ; 47 	temp <<= 8;
2880  0028 7b02          	ld	a,(OFST+0,sp)
2881  002a 6b01          	ld	(OFST-1,sp),a
2882  002c 0f02          	clr	(OFST+0,sp)
2883                     ; 48 	temp |= (u16)(ADC_DRL);
2885  002e c65405        	ld	a,_ADC_DRL
2886  0031 5f            	clrw	x
2887  0032 97            	ld	xl,a
2888  0033 01            	rrwa	x,a
2889  0034 1a02          	or	a,(OFST+0,sp)
2890  0036 01            	rrwa	x,a
2891  0037 1a01          	or	a,(OFST-1,sp)
2892  0039 01            	rrwa	x,a
2893  003a 1f01          	ldw	(OFST-1,sp),x
2894                     ; 49 	return temp;
2896  003c 1e01          	ldw	x,(OFST-1,sp)
2899  003e 5b02          	addw	sp,#2
2900  0040 81            	ret
2913                     	xdef	_ADC_GetVal
2914                     	xdef	_ADC_Init
2933                     	end
