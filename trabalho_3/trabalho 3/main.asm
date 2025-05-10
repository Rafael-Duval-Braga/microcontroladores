;============================================================
; PWM com Timer1 - Modo 14 (Fast PWM, TOP = ICR1)
; Dois canais PWM: OC1A e OC1B
; Atualização do duty cycle via ADC0 e ADC1
;============================================================

.cseg
.org 0x00
    rjmp RESET          ; Vetor de Reset
.org 0x002A
    rjmp ADC_ISR        ; Vetor da Interrupção do ADC

;------------------------------------------------------------
; Rotina Principal
;------------------------------------------------------------
RESET:
    ; Configura PB1 (OC1A) e PB2 (OC1B) como saídas
    LDI     R16, 0b00000110      ; PB1 e PB2 como saída
    OUT     DDRB, R16

    ;--------------------------------------------------------
    ; Configura Timer1 - Fast PWM, modo 14
    ;--------------------------------------------------------
    LDI     R16, 0b10100010      ; COM1A1=1, COM1B1=1, WGM11=1
    STS     TCCR1A, R16

    LDI     R16, 0b00011001      ; WGM13=1, WGM12=1, CS10=1 (prescaler = 1)
    STS     TCCR1B, R16

    ; TOP = 1023 (10 bits)
    LDI     R16, LOW(1023)
    STS     ICR1L, R16
    LDI     R16, HIGH(1023)
    STS     ICR1H, R16

    ; Duty inicial = 0 para ambos os canais
    CLR     R16
    STS     OCR1AL, R16
    STS     OCR1AH, R16
    STS     OCR1BL, R16
    STS     OCR1BH, R16

    ;--------------------------------------------------------
    ; Configura ADC para canal 0 inicialmente
    ;--------------------------------------------------------
    LDI     R16, 0b01000000      ; REFS0=1 (AVcc), MUX=0000 (ADC0)
    STS     ADMUX, R16

    LDI     R16, 0b11101111      ; ADEN=1, ADSC=1, ADATE=1, ADIE=1, prescaler=128
    STS     ADCSRA, R16

    CLR     R16
    STS     ADCSRB, R16          ; Trigger = Free Running

    ; Flag de canal
    CLR     R17                  ; R17 = 0 ? ADC0 (OC1A), R17 = 1 ? ADC1 (OC1B)

    SEI                         ; Habilita interrupções globais

LOOP:
    RJMP LOOP

;------------------------------------------------------------
; Interrupção do ADC - Alterna entre ADC0 e ADC1
;------------------------------------------------------------
ADC_ISR:
    ; Lê valor do ADC
    LDS     R18, ADCL
    LDS     R19, ADCH

    ; Verifica canal atual
    CPI     R17, 0
    BREQ    CANAL0

CANAL1:
    ; Atualiza OCR1B com valor lido (canal 1 ? OC1B)
    STS     OCR1BL, R18
    STS     OCR1BH, R19

    ; Troca para canal 0
    CLR     R17
    LDI     R16, 0b01000000      ; MUX = 0000 (ADC0)
    STS     ADMUX, R16
    RJMP    FIM_ISR

CANAL0:
    ; Atualiza OCR1A com valor lido (canal 0 ? OC1A)
    STS     OCR1AL, R18
    STS     OCR1AH, R19

    ; Troca para canal 1
    LDI     R17, 1
    LDI     R16, 0b01000001      ; MUX = 0001 (ADC1)
    STS     ADMUX, R16

FIM_ISR:
    RETI
