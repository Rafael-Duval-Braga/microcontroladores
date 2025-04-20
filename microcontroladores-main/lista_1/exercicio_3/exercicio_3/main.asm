; Programa que l� dois valores de PORTB e PORTC e mostra a soma em PORTD

start:
	; Limpa os registradores usados
	clr r16
	clr r17

	; Configura PORTB e PORTC como entrada
	out DDRB, r16
	out DDRC, r16

	; Configura PORTD como sa�da
	ser r18          ; r18 = 0xFF
	out DDRD, r18

	; Ativa pull-ups em PORTB e PORTC
	out PORTB, r18
	out PORTC, r18

loop:
	; L� os valores de entrada
	in r16, PINB
	in r17, PINC

	; Soma os valores lidos
	add r16, r17

	; Mostra o resultado da soma em PORTD
	out PORTD, r16

	; Loop infinito
	rjmp loop
