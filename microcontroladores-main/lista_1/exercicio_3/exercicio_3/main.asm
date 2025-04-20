; Programa que lê dois valores de PORTB e PORTC e mostra a soma em PORTD

start:
	; Limpa os registradores usados
	clr r16

	; Configura PORTB e PORTC como entrada
	out DDRB, r16
	out DDRC, r16

	; Configura PORTD como saída
	ser r17          ; r17 = 0xFF
	out DDRD, r17

	; Ativa pull-ups em PORTB e PORTC
	out PORTB, r16
	out PORTC, r16

loop:
	; Lê os valores de entrada
	in r16, PINB
	in r17, PINC

	; Soma os valores lidos
	add r16, r17

	; Mostra o resultado da soma em PORTD
	out PORTD, r16

	; Loop infinito
	rjmp loop
