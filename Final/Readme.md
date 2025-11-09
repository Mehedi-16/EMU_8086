Write a program to exchange the value of AX and BX.

```
.MODEL SMALL
.STACK 100H

.DATA

.CODE
MAIN PROC
    MOV AX, 1234H
    MOV BX, 5678H

    MOV CX, AX
    MOV AX, BX
    MOV BX, CX

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN



```
