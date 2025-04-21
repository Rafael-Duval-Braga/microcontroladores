;Considere que a = 2356 e b=3628. Faça C = a+b. 
;Mostre C nas portas D e B. A parte alta em port
;D e a parte baixa na port B.

.dseg
A:  .byte 2
B:  .byte 2
C:  .byte 2

.cseg 

	ser r16
	out DDRD, r16
	out DDRB, r16

	;A = 2356 (0x0934)
	ldi r16, 0x34	;reg 16 <- (0x34) 
	sts A, r16		; parte baixa
	ldi r16, 0x09	;reg 16 <- (0x09) 
	sts A+1, r16	; parte alta

	;B = 3628 (0x0E2C)
	ldi r16, 0x2C	;reg 16 <- (0x2C) 
	sts B, r16		;parte baixa
	ldi r16, 0x0E	;reg 16 <- (0x0E) 
	sts B+1, r16	;parte alta

start:

	;soma A + B
	
	lds r18, A		;r18 <- A[lo]
	lds r19, A+1	;r19 <- A[hi]

	lds r20, B		;r20 <- B[lo]
	lds r21, B+1	;r21 <- B[hi]

	clc				; limpa carry

	add r18, r20	; soma parte baixa
	adc r19, r21	; soma parte alta + carry (IMPORTANTE)

	;guarda resultado em C
	sts C, r18		;C[lo] <- r18
	sts C+1, r19	;C[hi] <- r19

	;Mostra resultado nas portas
	out PORTB, r18	;parte baixa em PORTB
	out PORTD, r19	;parte alta em PORTD

	rjmp start
