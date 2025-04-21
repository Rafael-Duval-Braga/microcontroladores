; Faça B = A - 100. A está em PORTD (entrada), B vai pra PORTB (saída)

.dseg
A:  .byte 1
B:  .byte 1

.cseg

	clr r16
	out DDRD, r16		; PORTD como entrada

	ser r16
	out DDRB, r16		; PORTB como saída

	out PORTD, r16		; Ativa pull-up em PORTD

start:
	in r16, PIND		; r16 <- A
	sts A, r16			; Guarda A

	ldi r17, 100		; r17 <- 100
	sub r16, r17		; r16 <- A - 100

	sts B, r16			; Guarda B
	out PORTB, r16		; Mostra B na PORTB

	rjmp start








