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

### 1️⃣ Subtract two 8‑bit BCD numbers
```asm
.MODEL SMALL
.STACK 100H
.DATA
    NUM1 DB 25H
    NUM2 DB 12H
    RESULT DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AL, NUM1
    SUB AL, NUM2
    DAA             ; Decimal Adjust after Subtraction
    MOV RESULT, AL

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
```

---

### 2️⃣ Multiply two 16‑bit numbers
```asm
.MODEL SMALL
.STACK 100H
.DATA
    NUM1 DW 1234H
    NUM2 DW 0020H
    RESULT DD ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AX, NUM1
    MOV BX, NUM2
    MUL BX          ; AX * BX → DX:AX
    MOV RESULT, AX
    MOV RESULT+2, DX

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
```

---

### 3️⃣ Subtract two 16‑bit numbers (with/without borrow)
```asm
.MODEL SMALL
.STACK 100H
.DATA
    NUM1 DW 3456H
    NUM2 DW 1234H
    RESULT DW ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AX, NUM1
    SUB AX, NUM2    ; simple subtraction
    MOV RESULT, AX

    ; with borrow example
    SBB AX, NUM2    ; subtract with borrow

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
```

---

### 4️⃣ Add two 8‑bit BCD numbers
```asm
.MODEL SMALL
.STACK 100H
.DATA
    NUM1 DB 25H
    NUM2 DB 15H
    RESULT DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AL, NUM1
    ADD AL, NUM2
    DAA             ; Decimal Adjust after Addition
    MOV RESULT, AL

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
```

---

### 5️⃣ Binary → Decimal Conversion (simple loop)
```asm
.MODEL SMALL
.STACK 100H
.DATA
    BINNUM DB 25
    DECIMAL DB 3 DUP(?)

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AL, BINNUM
    MOV CX, 0
    MOV BX, 10

CONVERT:
    XOR DX, DX
    DIV BX          ; AL ÷ 10 → Quotient in AL, Remainder in AH
    PUSH DX
    INC CX
    CMP AL, 0
    JNE CONVERT

    ; digits now on stack

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
```

---

### 6️⃣ Factorial of a number
```asm
.MODEL SMALL
.STACK 100H
.DATA
    NUM DB 05
    FACT DW 1

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CL, NUM
    MOV AX, 1

FACTORIAL:
    MUL CL
    LOOP FACTORIAL

    MOV FACT, AX

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
```

---

### 7️⃣ Decimal → Binary Conversion
```asm
.MODEL SMALL
.STACK 100H
.DATA
    DECNUM DB 25
    BINNUM DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AL, DECNUM
    MOV BINNUM, AL   ; already binary in AL

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
```

---

### 8️⃣ Add two 16‑bit numbers
```asm
.MODEL SMALL
.STACK 100H
.DATA
    NUM1 DW 1234H
    NUM2 DW 5678H
    RESULT DW ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AX, NUM1
    ADD AX, NUM2
    MOV RESULT, AX

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
```

---

