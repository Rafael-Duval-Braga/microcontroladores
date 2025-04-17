

;Faça um programa que configure a PORTB como entrada, e leia o valor de PORTB.
;Faça esse valor + 15 e mostre em PORTD.

; Replace with your application code
start:

	ldi		r16, 0 //zera o registrador 16
	sts		DDRB, r16	//configura port b como entrada

	ldi		r16, 1 //r16 = 1
	sts		DDRD, r16 //configura port b como entrada


loop:

	;ler porta b

	lds r16, PINB   //r16 <- PORT B

	ldi r17, 15

	add r16, r17	//r16 <- r16 + 15

	sts PORTD, r16	//PORTD <- PORT A + 15


