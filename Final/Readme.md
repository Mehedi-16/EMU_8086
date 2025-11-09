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
Write a program to print a String

```
.MODEL SMALL
.STACK 100H

.DATA
    MSG DB 'Hello, World!$'   ; String to print (terminated with $ for DOS interrupt)

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    LEA DX, MSG      ; Load address of string into DX
    MOV AH, 9        ; DOS function: print string
    INT 21H          ; Call DOS interrupt

    MOV AH, 4CH      ; Exit program
    INT 21H
MAIN ENDP
END MAIN
```
