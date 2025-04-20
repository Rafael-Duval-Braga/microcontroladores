//Faça um programa que leia um valor em PORTB e PORTC e mostre B-C na PORTD.


; Replace with your application code
start:
    


	clr r16

	out DDRB, r16
	out DDRC, r16

	ser r16

	out DDRD, r16

	out PORTB, r16
	out PORTC, r16

loop:

	in r16, PINB
	in r17, PINC

	sub r16, r17

	out PORTD, r16

	rjmp loop

