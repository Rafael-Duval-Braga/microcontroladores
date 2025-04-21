; Faça B = A^2 + 2*A. A está em PORTD (entrada), B vai pra PORTB (saída)

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
	in r16, PIND		; Lê A da porta D
	sts A, r16			; Guarda A na memória

	mov r17, r16		; r17 = A
	add r17, r16		; r17 = 2*A

	mul r16, r16		; r1:r0 = A * A

	add r17, r0			; r17 = A^2 + 2*A (parte baixa da multiplicação)

	sts B, r17
	out PORTB, r17		; Mostra B na PORTB

	rjmp start
