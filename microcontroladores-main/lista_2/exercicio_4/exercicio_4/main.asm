; piscar_led.asm

start:
    ldi r16, (1 << PB0)  ; r16 = 00000001
    out DDRB, r16        ; PB0 como saída

loop:
    ; Liga LED
    ldi r16, (1 << PB0)
    out PORTB, r16
    rcall delay

    ; Desliga LED
    ldi r16, 0x00
    out PORTB, r16
    rcall delay

    rjmp loop

; Delay simples (software)
delay:
    ldi r18, 0xFF
    ldi r19, 0xFF
d_loop:
    dec r19
    brne d_loop
    dec r18
    brne d_loop
    ret
