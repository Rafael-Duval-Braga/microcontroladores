; Trabalho01.asm
; NOME: Rafael Duval Braga
; OBJETIVO:
; Implementar um teclado matricial.
; Multiplicar por 10 (matrícula terminada em 9 → 9+1=10)
; Mostrar em 2 displays de 7 segmentos.
;

start:
	ser r16
	out DDRD, r16		; portD saída dezenas
	out DDRB, r16		; portB saída unidades

	ldi r16, 0b11110000
	out PORTC, r16		; pull-up em PC4-PC7

	ldi r20, 0b1110000	; colunas high
	ldi r21, 0b0001111	; linhas low

	out DDRC, r21		; PC0-PC3 (linhas) como saída, PC4-PC6 (colunas) como entrada
	out PORTC, r20		; ativa pull-up nas colunas

loop:
	out DDRC, r21
	out PORTC, r20

	in r16, PINC
	com r16

	out DDRC, r20
	out PORTC, r21
	in r17, PINC
	com r17

	sbrc r16, 4
	jmp coluna4
	sbrc r16, 5
	jmp coluna5
	sbrc r16, 6
	jmp coluna6
	jmp loop

coluna4:
	ldi r18, 0x01
	jmp testelinha
coluna5:
	ldi r18, 0x02
	jmp testelinha
coluna6:
	ldi r18, 0x04
	jmp testelinha

testelinha:
	sbrc r17, 0
	jmp linha0
	sbrc r17, 1
	jmp linha1
	sbrc r17, 2
	jmp linha2
	sbrc r17, 3
	jmp linha3
	jmp loop

linha0:
	ldi r19, 0x01
	jmp fim
linha1:
	ldi r19, 0x02
	jmp fim
linha2:
	ldi r19, 0x04
	jmp fim
linha3:
	ldi r19, 0x08
	jmp fim

fim:
	lsl r18
	lsl r18
	lsl r18
	lsl r18
	or r18, r19

	cpi r18, 0b00010100
	breq tecla1
	cpi r18, 0b00100100
	breq tecla2
	cpi r18, 0b01000100
	breq tecla3
	cpi r18, 0b00010010
	breq tecla4
	cpi r18, 0b00100010
	breq tecla5
	cpi r18, 0b01000010
	breq tecla6
	cpi r18, 0b00010001
	breq tecla7
	cpi r18, 0b00100001
	breq tecla8
	cpi r18, 0b01000001
	breq tecla9
	cpi r18, 0b00101000
	breq tecla0
	cpi r18, 0b00011000
	breq tecladot
	cpi r18, 0b01001000
	breq teclae
	jmp loop

tecla1: ldi r22, 1  ; valor
	jmp mult
tecla2: ldi r22, 2
	jmp mult
tecla3: ldi r22, 3
	jmp mult
tecla4: ldi r22, 4
	jmp mult
tecla5: ldi r22, 5
	jmp mult
tecla6: ldi r22, 6
	jmp mult
tecla7: ldi r22, 7
	jmp mult
tecla8: ldi r22, 8
	jmp mult
tecla9: ldi r22, 9
	jmp mult
tecla0: ldi r22, 0
	jmp mult
tecladot:
	ldi r22, 0
	jmp displaydot1
teclae:
	ldi r22, 0
	jmp displaydot2

; ===== Multiplicação por 10 (n × 10 = n×8 + n×2) =====
mult:
	mov r23, r22    ; salva valor original
	lsl r22         ; r22 × 2
	mov r24, r22    ; guarda resultado parcial (×2)
	mov r22, r23    ; restaura
	lsl r22         ; ×2
	lsl r22         ; ×4
	lsl r22         ; ×8
	add r22, r24    ; ×8 + ×2 = ×10

; ===== Conversão p/ display 7 segmentos =====
displayit:
	clr r23
testedezena:
	cpi r22, 10
	brlo skipdezena
	subi r22, 10
	inc r23
	jmp testedezena

skipdezena:
; dezenas → PORTD (r25), unidades → PORTB (r24)

testeportD:
	cpi r23, 0
	breq display0d
	cpi r23, 1
	breq display1d
	cpi r23, 2
	breq display2d
	cpi r23, 3
	breq display3d
	cpi r23, 4
	breq display4d
	cpi r23, 5
	breq display5d
	cpi r23, 6
	breq display6d
	cpi r23, 7
	breq display7d
	cpi r23, 8
	breq display8d
	cpi r23, 9
	breq display9d

displaydot1:
	ldi r25, 0b10000000
	ldi r24, 0x00
	jmp print
displaydot2:
	ldi r24, 0b10000000
	ldi r25, 0x00
	jmp print

display0d: ldi r25, 0b00111111
	jmp testeportB
display1d: ldi r25, 0b00000110
	jmp testeportB
display2d: ldi r25, 0b01011011
	jmp testeportB
display3d: ldi r25, 0b01001111
	jmp testeportB
display4d: ldi r25, 0b01100110
	jmp testeportB
display5d: ldi r25, 0b01101101
	jmp testeportB
display6d: ldi r25, 0b01111101
	jmp testeportB
display7d: ldi r25, 0b00000111
	jmp testeportB
display8d: ldi r25, 0b01111111
	jmp testeportB
display9d: ldi r25, 0b01101111
	jmp testeportB

testeportB:
	cpi r22, 0
	breq display0b
	cpi r22, 1
	breq display1b
	cpi r22, 2
	breq display2b
	cpi r22, 3
	breq display3b
	cpi r22, 4
	breq display4b
	cpi r22, 5
	breq display5b
	cpi r22, 6
	breq display6b
	cpi r22, 7
	breq display7b
	cpi r22, 8
	breq display8b
	cpi r22, 9
	breq display9b

display0b: ldi r24, 0b00111111
	jmp print
display1b: ldi r24, 0b00000110
	jmp print
display2b: ldi r24, 0b01011011
	jmp print
display3b: ldi r24, 0b01001111
	jmp print
display4b: ldi r24, 0b01100110
	jmp print
display5b: ldi r24, 0b01101101
	jmp print
display6b: ldi r24, 0b01111101
	jmp print
display7b: ldi r24, 0b00000111
	jmp print
display8b: ldi r24, 0b01111111
	jmp print
display9b: ldi r24, 0b01101111
	jmp print

print:
	out PORTD, r25
	out PORTB, r24
	jmp loop
