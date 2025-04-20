// Faça um programa que configure a PORTB como entrada, e leia o valor de PORTB. Faça esse valor x 5 e mostre em PORTD.

start:
    ldi	r16, 0 ; zera o reg

	sts	DDRB, r16 ; DDRB <- 0000 0000

	; PORTD é output DDRD = 1111 1111
	ser r16			; r16 <- 1111 1111
	sts	DDRD, r16		//configura port d como saída
	out PORTB, r16
		
loop:
	lds r16, PINB	; PINB saos os pinos de entrada de PORTB
	ldi r17, 5		; r17 <- 5

	mul r16, r17	; r1:r0 <- r16 * r17

	sts PORTD, r0	; PORTD sao os pinos pra saida | r0 eh a saida padrao das multiplicacoes
	jmp loop
