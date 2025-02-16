DATA SEGMENT

PORTA EQU 00H
PORTB EQU 02H
PORTC EQU 04H
PORT_CON EQU 06H ; Control port address for 8255

DATA ENDS

CODE SEGMENT

START:

    MOV AX, DATA
    MOV DS, AX

    ; Initialize 8255 PPI
    MOV DX, PORT_CON
    MOV AL, 10010000B ; Set ports A, B, and C as output in mode 0
    OUT DX, AL

    JMP XX ; Jump to start the LED control sequence

XX:

    ; Traffic light sequence example

    ; Turn on PC0 (LED 1)
    MOV AL, 00000001B
    MOV DX, PORTC
    OUT DX, AL

    ; Delay
    MOV CX, 0FFFFH
delay_loop1:
    LOOP delay_loop1

    ; Turn off PC0
    MOV AL, 00000000B
    OUT DX, AL

    ; Turn on PC4 (LED 2)
    MOV AL, 00010000B
    OUT DX, AL

    ; Delay
    MOV CX, 0FFFFH
delay_loop2:
    LOOP delay_loop2

    ; Turn off PC4
    MOV AL, 00000000B
    OUT DX, AL

    ; Turn on PC7 (LED 3)
    MOV AL, 10000000B
    OUT DX, AL

    ; Delay
    MOV CX, 0FFFFH
delay_loop3:
    LOOP delay_loop3

    ; Turn off PC7
    MOV AL, 00000000B
    OUT DX, AL

    JMP XX ; Repeat the sequence

CODE ENDS

END START
