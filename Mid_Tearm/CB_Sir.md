![IMAGE 2025-09-25 03:54:07](https://github.com/user-attachments/assets/dd66247c-1445-48a9-bcfc-7dd0aa380624)


code:
```
.MODEL SMALL
.STACK 100H
.DATA
    a DW 1234H
    b DW 1100H
.CODE
MAIN PROC
    ; Initialize data segment
    MOV AX, @DATA
    MOV DS, AX

    ; Load values and multiply
    MOV AX, a        ; AX = 1234H
    MOV BX, b        ; BX = 1100H
    MUL BX           ; AX × BX → result in DX:AX

    ; Store result parts
    MOV SI, AX       ; Lower 16 bits
    MOV BX, DX       ; Upper 16 bits

    MOV DH, 2        ; Loop twice: DX then AX

L1: MOV CH, 4        ; 4 hex digits per 16-bit part
    MOV CL, 4        ; Rotate by 4 bits

L2: ROL BX, CL       ; Rotate left by 4 bits
    MOV DL, BL       ; Copy to DL
    AND DL, 0FH      ; Mask to get last 4 bits

    CMP DL, 9
    JBE L4           ; If ≤9, it's 0–9
    ADD DL, 7        ; If >9, adjust for A–F

L4: ADD DL, 30H      ; Convert to ASCII
    MOV AH, 2
    INT 21H          ; Print character

    DEC CH
    JNZ L2           ; Repeat 4 times

    DEC DH
    CMP DH, 0
    MOV BX, SI       ; Load lower part for second round
    JNZ L1           ; Repeat for AX

    ; Exit program
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
```
