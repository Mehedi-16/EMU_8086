## 🔍 Full Code Breakdown

---

### 🔧 Initialization
```asm
INCLUDE "EMU8086.INC"
```
🔹 EMU8086 এর built-in macro/function গুলা use করার জন্য include করা হয়েছে।

```asm
.MODEL SMALL
.STACK 200H
.DATA
.CODE  
MAIN PROC
```
🔹 Small memory model  
🔹 Stack size: 200h = 512 bytes  
🔹 MAIN procedure শুরু

---

### 🧠 Register Setup
```asm
mov bl,12
```
🔹 BL রেজিস্টারে `12` (decimal) রাখা হচ্ছে  
👉 Binary: `00001100`

```asm
MOV CX,8
```
🔹 Loop counter CX = 8  
👉 কারণ 8-bit register BL এর প্রতিটা bit check করবো

---

### 🔁 Loop Start
```asm
START:
    RCL BL ,1
```
🔹 **RCL = Rotate through Carry Left**  
👉 BL এর bit গুলা rotate হয় left দিকে, carry flag এর সাথে  
👉 Carry flag এ current bit ঢুকে পড়ে

---

### 🧪 Check Carry
```asm
JC PRINT_ONE
```
🔹 **JC = Jump if Carry**  
👉 যদি carry flag 1 হয়, তাহলে `PRINT_ONE` label এ jump করো  
👉 মানে current bit = 1

---

### 🖨️ Print '0' if no carry
```asm
MOV AH,2
MOV DL,'0' 
INT 21H 
JMP LAST 
```
🔹 Carry না থাকলে `'0'` print করো  
👉 AH=2 → output mode  
👉 DL='0' → character to print  
👉 INT 21h → print  
👉 তারপর `LAST` label এ jump করে loop continue

---

### 🖨️ Print '1' if carry
```asm
PRINT_ONE:  
    MOV AH,2
    MOV DL,'1' 
    INT 21H 
```
🔹 Carry থাকলে `'1'` print করো  
👉 Same logic, শুধু DL='1'

---

### 🔁 Loop Continue
```asm
lAST:
    LOOP START
```
🔹 CX কমে 1 হয়  
👉 যতক্ষণ CX ≠ 0, ততক্ষণ loop চলবে  
👉 প্রতি iteration এ BL rotate হবে, carry check হবে, output হবে

---

### 🛑 Program Exit
```asm
MOV AH,4CH
INT 21H
```
🔹 Program শেষ  
👉 AH=4Ch → exit signal  
👉 INT 21h → DOS interrupt

---

## 🧪 Result পাবে কিভাবে?

### ✅ Step-by-Step:

1. **BL = 12** → Binary: `00001100`
2. **CX = 8** → 8 বার loop চলবে
3. প্রতি বার:
   - BL rotate হবে
   - MSB carry তে যাবে
   - Carry check করে `'0'` বা `'1'` print হবে

### 📤 Final Output:
```
00001100
```
➡️ এটা BL এর binary representation  
➡️ Rotate করে carry check করে print করা হয়েছে

---

## 🖥️ Run করলে কী দেখবে?

Screen-e output:
```
00001100
```

👉 এটা left-to-right print হলেও, internally rotate করে carry flag check করে বের করা হয়েছে।

---

## 🔍 Bonus: BL এর Binary Breakdown

| Iteration | BL (Before) | CF (Carry) | Printed |
|-----------|-------------|------------|---------|
| 1         | 00001100    | 0          | 0       |
| 2         | 00011000    | 0          | 0       |
| 3         | 00110000    | 0          | 0       |
| 4         | 01100000    | 0          | 0       |
| 5         | 11000000    | 1          | 1       |
| 6         | 10000000    | 1          | 1       |
| 7         | 00000000    | 0          | 0       |
| 8         | 00000000    | 0          | 0       |

---

