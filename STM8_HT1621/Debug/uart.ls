   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
2797                     ; 33 void  UART2_Init(void)
2797                     ; 34 {
2799                     	switch	.text
2800  0000               _UART2_Init:
2804                     ; 35     UART2_CR1=0x00;
2806  0000 725f5244      	clr	_UART2_CR1
2807                     ; 36     UART2_CR2=0x00;
2809  0004 725f5245      	clr	_UART2_CR2
2810                     ; 37     UART2_CR3=0x00;
2812  0008 725f5246      	clr	_UART2_CR3
2813                     ; 38     UART2_BRR2 = 0x01;
2815  000c 35015243      	mov	_UART2_BRR2,#1
2816                     ; 39     UART2_BRR1 = 0x01;     //115200波特率
2818  0010 35015242      	mov	_UART2_BRR1,#1
2819                     ; 40     UART2_CR2 = 0x2c;     //允许发送  允许接收 接收中断使能
2821  0014 352c5245      	mov	_UART2_CR2,#44
2822                     ; 41 }
2825  0018 81            	ret
2861                     ; 43 void  UART2_Send(u8 dat)
2861                     ; 44 {
2862                     	switch	.text
2863  0019               _UART2_Send:
2865  0019 88            	push	a
2866       00000000      OFST:	set	0
2869  001a               L5102:
2870                     ; 45     while((UART2_SR & 0x80)==0x00);
2872  001a c65240        	ld	a,_UART2_SR
2873  001d a580          	bcp	a,#128
2874  001f 27f9          	jreq	L5102
2875                     ; 46     UART2_DR = dat;
2877  0021 7b01          	ld	a,(OFST+1,sp)
2878  0023 c75241        	ld	_UART2_DR,a
2879                     ; 47 }
2882  0026 84            	pop	a
2883  0027 81            	ret
2928                     ; 58 void UART2_SendString(u8* Data)
2928                     ; 59 {
2929                     	switch	.text
2930  0028               _UART2_SendString:
2932  0028 89            	pushw	x
2933  0029 89            	pushw	x
2934       00000002      OFST:	set	2
2937                     ; 60 	u16 i=0;
2939  002a 5f            	clrw	x
2940  002b 1f01          	ldw	(OFST-1,sp),x
2942  002d 200f          	jra	L7402
2943  002f               L3402:
2944                     ; 64            UART2_Send(Data[i]);	/* 循环调用发送一个字符函数 */
2946  002f 1e03          	ldw	x,(OFST+1,sp)
2947  0031 72fb01        	addw	x,(OFST-1,sp)
2948  0034 f6            	ld	a,(x)
2949  0035 ade2          	call	_UART2_Send
2951                     ; 65            i++;
2953  0037 1e01          	ldw	x,(OFST-1,sp)
2954  0039 1c0001        	addw	x,#1
2955  003c 1f01          	ldw	(OFST-1,sp),x
2956  003e               L7402:
2957                     ; 62         while(Data[i]!='\0')
2959  003e 1e03          	ldw	x,(OFST+1,sp)
2960  0040 72fb01        	addw	x,(OFST-1,sp)
2961  0043 7d            	tnz	(x)
2962  0044 26e9          	jrne	L3402
2963                     ; 68 }
2966  0046 5b04          	addw	sp,#4
2967  0048 81            	ret
3002                     ; 78 void putchar(char ch)		// print normal characters or '\n'
3002                     ; 79 {	  
3003                     	switch	.text
3004  0049               _putchar:
3006  0049 88            	push	a
3007       00000000      OFST:	set	0
3010                     ; 80 	if('\n' == ch)
3012  004a a10a          	cp	a,#10
3013  004c 2604          	jrne	L1702
3014                     ; 82 		UART2_Send('\r');
3016  004e a60d          	ld	a,#13
3017  0050 adc7          	call	_UART2_Send
3019  0052               L1702:
3020                     ; 85 	UART2_Send(ch);
3022  0052 7b01          	ld	a,(OFST+1,sp)
3023  0054 adc3          	call	_UART2_Send
3025                     ; 87 }
3028  0056 84            	pop	a
3029  0057 81            	ret
3065                     ; 97 void printf_str(unsigned char *buffer)
3065                     ; 98 {
3066                     	switch	.text
3067  0058               _printf_str:
3069  0058 89            	pushw	x
3070       00000000      OFST:	set	0
3073  0059 200d          	jra	L3112
3074  005b               L1112:
3075                     ; 101 	    putchar(*buffer++);
3077  005b 1e01          	ldw	x,(OFST+1,sp)
3078  005d 1c0001        	addw	x,#1
3079  0060 1f01          	ldw	(OFST+1,sp),x
3080  0062 1d0001        	subw	x,#1
3081  0065 f6            	ld	a,(x)
3082  0066 ade1          	call	_putchar
3084  0068               L3112:
3085                     ; 99 	while (*buffer != '\0')
3087  0068 1e01          	ldw	x,(OFST+1,sp)
3088  006a 7d            	tnz	(x)
3089  006b 26ee          	jrne	L1112
3090                     ; 103 }
3093  006d 85            	popw	x
3094  006e 81            	ret
3147                     ; 114 void putascbase(unsigned char ch)
3147                     ; 115 {
3148                     	switch	.text
3149  006f               _putascbase:
3151  006f 88            	push	a
3152  0070 89            	pushw	x
3153       00000002      OFST:	set	2
3156                     ; 119 	     i = (ch>>4) & 0x0f;
3158  0071 4e            	swap	a
3159  0072 a40f          	and	a,#15
3160  0074 a40f          	and	a,#15
3161  0076 6b01          	ld	(OFST-1,sp),a
3162                     ; 120 	     j = ch & 0x0f;
3164  0078 7b03          	ld	a,(OFST+1,sp)
3165  007a a40f          	and	a,#15
3166  007c 6b02          	ld	(OFST+0,sp),a
3167                     ; 121 	     if (i>9) i += 7;
3169  007e 7b01          	ld	a,(OFST-1,sp)
3170  0080 a10a          	cp	a,#10
3171  0082 2506          	jrult	L5412
3174  0084 7b01          	ld	a,(OFST-1,sp)
3175  0086 ab07          	add	a,#7
3176  0088 6b01          	ld	(OFST-1,sp),a
3177  008a               L5412:
3178                     ; 123 	     if (j>9) j += 7;
3180  008a 7b02          	ld	a,(OFST+0,sp)
3181  008c a10a          	cp	a,#10
3182  008e 2506          	jrult	L7412
3185  0090 7b02          	ld	a,(OFST+0,sp)
3186  0092 ab07          	add	a,#7
3187  0094 6b02          	ld	(OFST+0,sp),a
3188  0096               L7412:
3189                     ; 124 	     putchar(i+0x30);
3191  0096 7b01          	ld	a,(OFST-1,sp)
3192  0098 ab30          	add	a,#48
3193  009a adad          	call	_putchar
3195                     ; 125 	     putchar(j+0x30);
3197  009c 7b02          	ld	a,(OFST+0,sp)
3198  009e ab30          	add	a,#48
3199  00a0 ada7          	call	_putchar
3201                     ; 129 }
3204  00a2 5b03          	addw	sp,#3
3205  00a4 81            	ret
3241                     ; 139 void putasc(unsigned char ch)
3241                     ; 140 {
3242                     	switch	.text
3243  00a5               _putasc:
3247                     ; 141 	 putascbase(ch);
3249  00a5 adc8          	call	_putascbase
3251                     ; 142 	 putchar(' ');
3253  00a7 a620          	ld	a,#32
3254  00a9 ad9e          	call	_putchar
3256                     ; 144 }
3259  00ab 81            	ret
3321                     ; 154 void putascLong(unsigned long ch)
3321                     ; 155 {
3322                     	switch	.text
3323  00ac               _putascLong:
3325  00ac 5203          	subw	sp,#3
3326       00000003      OFST:	set	3
3329                     ; 157 	 for(k = 0; k<4 ;k++)
3331  00ae 0f03          	clr	(OFST+0,sp)
3332  00b0               L1222:
3333                     ; 159 	     i = (((u8 *)&ch)[k]>>4) & 0x0f;
3335  00b0 96            	ldw	x,sp
3336  00b1 1c0006        	addw	x,#OFST+3
3337  00b4 9f            	ld	a,xl
3338  00b5 5e            	swapw	x
3339  00b6 1b03          	add	a,(OFST+0,sp)
3340  00b8 2401          	jrnc	L42
3341  00ba 5c            	incw	x
3342  00bb               L42:
3343  00bb 02            	rlwa	x,a
3344  00bc f6            	ld	a,(x)
3345  00bd 4e            	swap	a
3346  00be a40f          	and	a,#15
3347  00c0 a40f          	and	a,#15
3348  00c2 6b01          	ld	(OFST-2,sp),a
3349                     ; 160 	     j = ((u8 *)&ch)[k] & 0x0f;
3351  00c4 96            	ldw	x,sp
3352  00c5 1c0006        	addw	x,#OFST+3
3353  00c8 9f            	ld	a,xl
3354  00c9 5e            	swapw	x
3355  00ca 1b03          	add	a,(OFST+0,sp)
3356  00cc 2401          	jrnc	L62
3357  00ce 5c            	incw	x
3358  00cf               L62:
3359  00cf 02            	rlwa	x,a
3360  00d0 f6            	ld	a,(x)
3361  00d1 a40f          	and	a,#15
3362  00d3 6b02          	ld	(OFST-1,sp),a
3363                     ; 161 	     if (i>9) i += 7;
3365  00d5 7b01          	ld	a,(OFST-2,sp)
3366  00d7 a10a          	cp	a,#10
3367  00d9 2506          	jrult	L7222
3370  00db 7b01          	ld	a,(OFST-2,sp)
3371  00dd ab07          	add	a,#7
3372  00df 6b01          	ld	(OFST-2,sp),a
3373  00e1               L7222:
3374                     ; 163 	     if (j>9) j += 7;
3376  00e1 7b02          	ld	a,(OFST-1,sp)
3377  00e3 a10a          	cp	a,#10
3378  00e5 2506          	jrult	L1322
3381  00e7 7b02          	ld	a,(OFST-1,sp)
3382  00e9 ab07          	add	a,#7
3383  00eb 6b02          	ld	(OFST-1,sp),a
3384  00ed               L1322:
3385                     ; 164 	     putchar(i+0x30);
3387  00ed 7b01          	ld	a,(OFST-2,sp)
3388  00ef ab30          	add	a,#48
3389  00f1 cd0049        	call	_putchar
3391                     ; 165 	     putchar(j+0x30);
3393  00f4 7b02          	ld	a,(OFST-1,sp)
3394  00f6 ab30          	add	a,#48
3395  00f8 cd0049        	call	_putchar
3397                     ; 157 	 for(k = 0; k<4 ;k++)
3399  00fb 0c03          	inc	(OFST+0,sp)
3402  00fd 7b03          	ld	a,(OFST+0,sp)
3403  00ff a104          	cp	a,#4
3404  0101 25ad          	jrult	L1222
3405                     ; 167 	 putchar(' ');
3407  0103 a620          	ld	a,#32
3408  0105 cd0049        	call	_putchar
3410                     ; 169 }
3413  0108 5b03          	addw	sp,#3
3414  010a 81            	ret
3450                     ; 178 void putascShort(unsigned short ch)
3450                     ; 179 {
3451                     	switch	.text
3452  010b               _putascShort:
3454  010b 89            	pushw	x
3455       00000000      OFST:	set	0
3458                     ; 180 	 putascbase(ch>>8);
3460  010c 9e            	ld	a,xh
3461  010d cd006f        	call	_putascbase
3463                     ; 181 	 putascbase(ch>>0);
3465  0110 7b02          	ld	a,(OFST+2,sp)
3466  0112 cd006f        	call	_putascbase
3468                     ; 182 	 putchar(' ');
3470  0115 a620          	ld	a,#32
3471  0117 cd0049        	call	_putchar
3473                     ; 184 }
3476  011a 85            	popw	x
3477  011b 81            	ret
3532                     ; 194 void printf_array(unsigned char *buffer, unsigned short  cnt) 
3532                     ; 195 {
3533                     	switch	.text
3534  011c               _printf_array:
3536  011c 89            	pushw	x
3537  011d 89            	pushw	x
3538       00000002      OFST:	set	2
3541                     ; 197 	for(i=0; i< cnt; i++)
3543  011e 5f            	clrw	x
3544  011f 1f01          	ldw	(OFST-1,sp),x
3546  0121 201d          	jra	L3032
3547  0123               L7722:
3548                     ; 199 		putasc(buffer[i]);
3550  0123 1e03          	ldw	x,(OFST+1,sp)
3551  0125 72fb01        	addw	x,(OFST-1,sp)
3552  0128 f6            	ld	a,(x)
3553  0129 cd00a5        	call	_putasc
3555                     ; 200 		if(((i+1)%16)==0)
3557  012c 1e01          	ldw	x,(OFST-1,sp)
3558  012e 5c            	incw	x
3559  012f 01            	rrwa	x,a
3560  0130 a50f          	bcp	a,#15
3561  0132 2605          	jrne	L7032
3562                     ; 201 		    putchar('\n');	 
3564  0134 a60a          	ld	a,#10
3565  0136 cd0049        	call	_putchar
3567  0139               L7032:
3568                     ; 197 	for(i=0; i< cnt; i++)
3570  0139 1e01          	ldw	x,(OFST-1,sp)
3571  013b 1c0001        	addw	x,#1
3572  013e 1f01          	ldw	(OFST-1,sp),x
3573  0140               L3032:
3576  0140 1e01          	ldw	x,(OFST-1,sp)
3577  0142 1307          	cpw	x,(OFST+5,sp)
3578  0144 25dd          	jrult	L7722
3579                     ; 204 }   //*/
3582  0146 5b04          	addw	sp,#4
3583  0148 81            	ret
3596                     	xdef	_printf_array
3597                     	xdef	_putascShort
3598                     	xdef	_putascLong
3599                     	xdef	_putasc
3600                     	xdef	_putascbase
3601                     	xdef	_printf_str
3602                     	xdef	_putchar
3603                     	xdef	_UART2_SendString
3604                     	xdef	_UART2_Send
3605                     	xdef	_UART2_Init
3624                     	end
