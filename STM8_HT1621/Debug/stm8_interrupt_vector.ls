   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
2794                     ; 14 @far @interrupt void NonHandledInterrupt (void)
2794                     ; 15 {
2795                     	switch	.text
2796  0000               f_NonHandledInterrupt:
2800                     ; 19 	return;
2803  0000 80            	iret
2829                     ; 22 @far @interrupt void NonHandledInterrupt_UART2RX (void)
2829                     ; 23 {
2830                     	switch	.text
2831  0001               f_NonHandledInterrupt_UART2RX:
2833  0001 3b0002        	push	c_x+2
2834  0004 be00          	ldw	x,c_x
2835  0006 89            	pushw	x
2836  0007 3b0002        	push	c_y+2
2837  000a be00          	ldw	x,c_y
2838  000c 89            	pushw	x
2841                     ; 27 	UART2_SR &= 0xdf;
2843  000d 721b5240      	bres	_UART2_SR,#5
2844                     ; 28 	UART2_Send(UART2_DR);
2846  0011 c65241        	ld	a,_UART2_DR
2847  0014 cd0000        	call	_UART2_Send
2849                     ; 29 	return;
2852  0017 85            	popw	x
2853  0018 bf00          	ldw	c_y,x
2854  001a 320002        	pop	c_y+2
2855  001d 85            	popw	x
2856  001e bf00          	ldw	c_x,x
2857  0020 320002        	pop	c_x+2
2858  0023 80            	iret
2860                     .const:	section	.text
2861  0000               __vectab:
2862  0000 82            	dc.b	130
2864  0001 00            	dc.b	page(__stext)
2865  0002 0000          	dc.w	__stext
2866  0004 82            	dc.b	130
2868  0005 00            	dc.b	page(f_NonHandledInterrupt)
2869  0006 0000          	dc.w	f_NonHandledInterrupt
2870  0008 82            	dc.b	130
2872  0009 00            	dc.b	page(f_NonHandledInterrupt)
2873  000a 0000          	dc.w	f_NonHandledInterrupt
2874  000c 82            	dc.b	130
2876  000d 00            	dc.b	page(f_NonHandledInterrupt)
2877  000e 0000          	dc.w	f_NonHandledInterrupt
2878  0010 82            	dc.b	130
2880  0011 00            	dc.b	page(f_NonHandledInterrupt)
2881  0012 0000          	dc.w	f_NonHandledInterrupt
2882  0014 82            	dc.b	130
2884  0015 00            	dc.b	page(f_NonHandledInterrupt)
2885  0016 0000          	dc.w	f_NonHandledInterrupt
2886  0018 82            	dc.b	130
2888  0019 00            	dc.b	page(f_NonHandledInterrupt)
2889  001a 0000          	dc.w	f_NonHandledInterrupt
2890  001c 82            	dc.b	130
2892  001d 00            	dc.b	page(f_NonHandledInterrupt)
2893  001e 0000          	dc.w	f_NonHandledInterrupt
2894  0020 82            	dc.b	130
2896  0021 00            	dc.b	page(f_NonHandledInterrupt)
2897  0022 0000          	dc.w	f_NonHandledInterrupt
2898  0024 82            	dc.b	130
2900  0025 00            	dc.b	page(f_NonHandledInterrupt)
2901  0026 0000          	dc.w	f_NonHandledInterrupt
2902  0028 82            	dc.b	130
2904  0029 00            	dc.b	page(f_NonHandledInterrupt)
2905  002a 0000          	dc.w	f_NonHandledInterrupt
2906  002c 82            	dc.b	130
2908  002d 00            	dc.b	page(f_NonHandledInterrupt)
2909  002e 0000          	dc.w	f_NonHandledInterrupt
2910  0030 82            	dc.b	130
2912  0031 00            	dc.b	page(f_NonHandledInterrupt)
2913  0032 0000          	dc.w	f_NonHandledInterrupt
2914  0034 82            	dc.b	130
2916  0035 00            	dc.b	page(f_NonHandledInterrupt)
2917  0036 0000          	dc.w	f_NonHandledInterrupt
2918  0038 82            	dc.b	130
2920  0039 00            	dc.b	page(f_NonHandledInterrupt)
2921  003a 0000          	dc.w	f_NonHandledInterrupt
2922  003c 82            	dc.b	130
2924  003d 00            	dc.b	page(f_NonHandledInterrupt)
2925  003e 0000          	dc.w	f_NonHandledInterrupt
2926  0040 82            	dc.b	130
2928  0041 00            	dc.b	page(f_NonHandledInterrupt)
2929  0042 0000          	dc.w	f_NonHandledInterrupt
2930  0044 82            	dc.b	130
2932  0045 00            	dc.b	page(f_NonHandledInterrupt)
2933  0046 0000          	dc.w	f_NonHandledInterrupt
2934  0048 82            	dc.b	130
2936  0049 00            	dc.b	page(f_NonHandledInterrupt)
2937  004a 0000          	dc.w	f_NonHandledInterrupt
2938  004c 82            	dc.b	130
2940  004d 00            	dc.b	page(f_NonHandledInterrupt)
2941  004e 0000          	dc.w	f_NonHandledInterrupt
2942  0050 82            	dc.b	130
2944  0051 00            	dc.b	page(f_NonHandledInterrupt)
2945  0052 0000          	dc.w	f_NonHandledInterrupt
2946  0054 82            	dc.b	130
2948  0055 00            	dc.b	page(f_NonHandledInterrupt)
2949  0056 0000          	dc.w	f_NonHandledInterrupt
2950  0058 82            	dc.b	130
2952  0059 00            	dc.b	page(f_NonHandledInterrupt)
2953  005a 0000          	dc.w	f_NonHandledInterrupt
2954  005c 82            	dc.b	130
2956  005d 01            	dc.b	page(f_NonHandledInterrupt_UART2RX)
2957  005e 0001          	dc.w	f_NonHandledInterrupt_UART2RX
2958  0060 82            	dc.b	130
2960  0061 00            	dc.b	page(f_NonHandledInterrupt)
2961  0062 0000          	dc.w	f_NonHandledInterrupt
2962  0064 82            	dc.b	130
2964  0065 00            	dc.b	page(f_NonHandledInterrupt)
2965  0066 0000          	dc.w	f_NonHandledInterrupt
2966  0068 82            	dc.b	130
2968  0069 00            	dc.b	page(f_NonHandledInterrupt)
2969  006a 0000          	dc.w	f_NonHandledInterrupt
2970  006c 82            	dc.b	130
2972  006d 00            	dc.b	page(f_NonHandledInterrupt)
2973  006e 0000          	dc.w	f_NonHandledInterrupt
2974  0070 82            	dc.b	130
2976  0071 00            	dc.b	page(f_NonHandledInterrupt)
2977  0072 0000          	dc.w	f_NonHandledInterrupt
2978  0074 82            	dc.b	130
2980  0075 00            	dc.b	page(f_NonHandledInterrupt)
2981  0076 0000          	dc.w	f_NonHandledInterrupt
2982  0078 82            	dc.b	130
2984  0079 00            	dc.b	page(f_NonHandledInterrupt)
2985  007a 0000          	dc.w	f_NonHandledInterrupt
2986  007c 82            	dc.b	130
2988  007d 00            	dc.b	page(f_NonHandledInterrupt)
2989  007e 0000          	dc.w	f_NonHandledInterrupt
3040                     	xdef	__vectab
3041                     	xref	__stext
3042                     	xdef	f_NonHandledInterrupt_UART2RX
3043                     	xdef	f_NonHandledInterrupt
3044                     	xref	_UART2_Send
3045                     	xref.b	c_x
3046                     	xref.b	c_y
3065                     	end
