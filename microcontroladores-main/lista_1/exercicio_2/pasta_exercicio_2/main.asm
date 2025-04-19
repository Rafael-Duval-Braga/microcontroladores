//Faça um programa que configure a PORTB como entrada,
//e leia o valor de PORTB. Faça esse valor x 5 e mostre em PORTD.



start:
    

	ldi	r16, 0			//zera o reg 16
	sts	DDRB, r16		//configura port b como entrada

	ldi	r16, 1			//reg 16 recebe 1
	sts	DDRD, r16		//configura port d como saída

loop:

	lds r16, PINB		//reg 16 recebe o valor de entrada
	ldi r17, 5			//reg 17 recebe o valor de multiplicacao

	mul r16, r17		//reg 0 <- reg 16 * 5

	sts PORTD, r0		//port d <- reg 16 * 5

	jmp loop			//reinicia o loop