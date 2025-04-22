
;Coloque um botão na porta B0 e um led em porta B1.
;se o botão estiver pressionado, ligue o led. 
;caso contrário, apague-o.

start:
    ; -------- Configuração --------

    ldi r16, 0b11111110      ; DDRB <- 11111110 ? PB0 = entrada, PB1 = saída
    out DDRB, r16

    ldi r16, 0b00000001      ; Habilita pull-up interno em PB0
    out PORTB, r16

loop:
    in r17, PINB             ; Lê estado dos pinos de entrada

    sbrs r17, 0              ; Se o bit 0 (PB0) for zero (botão pressionado)
    rjmp liga_led

    ; Caso contrário (botão solto)
    ldi r18, 0x00            ; Apaga LED
    out PORTB, r18
    rjmp loop

liga_led:
    ldi r18, (1 << PB1)      ; Liga o LED em PB1
    out PORTB, r18
    rjmp loop
