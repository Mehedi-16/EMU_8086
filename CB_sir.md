
```
; Program: Evaluate expression and print result
; Expression: (3X^2 + 2X - 5) / (2X^2 - 1)   for X = 0Eh

.MODEL SMALL
.STACK 100H

.DATA
    X       DW 0EH          ; X = 14 (decimal)
    NUM1    DW ?
    NUM2    DW ?
    RESULT  DW ?            ; Final division result
    MSG1    DB 'Result = $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; --- Compute X^2 ---
    MOV AX, X
    MOV BX, X
    MUL BX              ; AX = X * X = X^2
    MOV [2008H], AX     ; store X^2 in memory

    ; --- Compute 3X^2 ---
    MOV BX, 3
    MUL BX              ; AX = X^2 * 3 = 3X^2
    MOV [2002H], AX     ; store 3X^2

    ; --- Compute 3X^2 + 2X - 5 ---
    MOV AX, X
    MOV BX, 2
    MUL BX              ; AX = 2*X
    MOV BX, AX
    ADD BX, [2002H]     ; BX = 3X^2 + 2X
    SUB BX, 5           ; BX = 3X^2 + 2X - 5
    MOV NUM1, BX        ; Store numerator

    ; --- Compute 2X^2 - 1 ---
    MOV AX, [2008H]     ; AX = X^2
    MOV DX, 2
    MUL DX              ; AX = 2*X^2
    SUB AX, 1           ; AX = 2X^2 - 1
    MOV NUM2, AX        ; Store denominator

    ; --- Perform Division ---
    MOV AX, NUM1
    MOV DX, 0           ; clear upper word
    DIV NUM2            ; AX = NUM1 / NUM2
    MOV RESULT, AX

    ; --- Print message ---
    LEA DX, MSG1
    MOV AH, 09H
    INT 21H

    ; --- Print result in decimal ---
    MOV AX, RESULT
    CALL PRINT_NUM

    ; Exit to DOS
    MOV AH, 4CH
    INT 21H
MAIN ENDP

; ----------------------------------------
; Procedure: PRINT_NUM
; Prints the number in AX (decimal)
; ----------------------------------------
PRINT_NUM PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX

    XOR CX, CX          ; digit counter
    MOV BX, 10

NEXT_DIGIT:
    XOR DX, DX
    DIV BX              ; AX   10 ? quotient in AX, remainder in DX
    PUSH DX             ; push remainder
    INC CX
    TEST AX, AX
    JNZ NEXT_DIGIT

PRINT_LOOP:
    POP DX
    ADD DL, '0'         ; convert to ASCII
    MOV AH, 02H
    INT 21H
    LOOP PRINT_LOOP

    POP DX
    POP CX
    POP BX
    POP AX
    RET
PRINT_NUM ENDP

END MAIN

```
