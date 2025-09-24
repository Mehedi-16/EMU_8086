```
;MOV AX,1234H
;MOV BX,5678H    
;XCHG AX,BX 
;HLT    

.model small
.stack 100h
.code 
main proc
     mov ah,1
     int 21h
     mov bl,al
     
     
     mov ah,1
     int 21h
     mov bh,al 
     
     
     xchg bl,bh
     
     mov ah,2
     mov dl,0Ah
     int 21h
     mov dl,0Dh
     int 21h
     
     mov ah,2
     mov dl,bl
     int 21h  
     
     mov ah,2
     mov dl,bh
     int 21h
     
     exit:
     mov ah,4ch
     int 21h
     main endp
end main
```
##  ব্যাখ্যা

---

### 🧱 Program Setup
```asm
.model small
```
🔸 *এই লাইন বলে যে প্রোগ্রামটা ছোট মেমোরি মডেল ব্যবহার করবে।*  
👉 Code, data, stack আলাদা segment এ থাকবে।

```asm
.stack 100h
```
🔸 *স্ট্যাকের জন্য 100h (মানে 256 byte) জায়গা রিজার্ভ করা হচ্ছে।*

```asm
.code 
main proc
```
🔸 *এখান থেকে মূল কোড শুরু হচ্ছে।*  
👉 `main proc` মানে main নামের procedure শুরু।

---

### 🎤 First Character Input
```asm
mov ah,1
```
🔸 *AH রেজিস্টারে 1 রাখছি, মানে DOS কে বলছি: “Keyboard থেকে input নাও”*

```asm
int 21h
```
🔸 *DOS interrupt 21h call করলাম—এটা input/output এর জন্য ব্যবহৃত হয়।*  
👉 এখন user যেই key press করবে, তার ASCII AL রেজিস্টারে চলে আসবে।

```asm
mov bl,al
```
🔸 *AL এ থাকা ASCII value BL রেজিস্টারে রাখছি।*  
👉 এটা first character ধরে রাখার জন্য।

---

### 🎤 Second Character Input
```asm
mov ah,1
int 21h
mov bh,al
```
🔸 *একইভাবে আবার AH=1 দিয়ে input নিচ্ছি।*  
👉 এবার second key press করলে তার ASCII AL এ আসবে, এবং BH তে save করলাম।

---

### 🔄 Swap the Characters
```asm
xchg bl,bh
```
🔸 *BL আর BH এর মান একে অপরের সাথে বিনিময় করলাম।*  
👉 এখন BL এ second character, BH তে first character।

---

### 📤 Newline Formatting
```asm
mov ah,2
mov dl,0Ah
int 21h
```
🔸 *AH=2 মানে output mode on করলাম।*  
👉 DL=0Ah মানে Line Feed (নতুন লাইনে যাওয়ার signal)।  
👉 `int 21h` দিয়ে LF print করলাম।

```asm
mov dl,0Dh
int 21h
```
🔸 *DL=0Dh মানে Carriage Return (cursor কে লাইনের শুরুতে ফেরত পাঠায়)।*  
👉 `int 21h` দিয়ে CR print করলাম।

---

### 📤 Show Swapped Characters
```asm
mov ah,2
mov dl,bl
int 21h
```
🔸 *BL এ যেটা আছে (second character), সেটা DL এ নিয়ে screen এ print করলাম।*

```asm
mov ah,2
mov dl,bh
int 21h
```
🔸 *BH এ যেটা আছে (first character), সেটা DL এ নিয়ে print করলাম।*  
👉 ফলে output হবে: **second character first, first character second**

---

### 🛑 Exit Program
```asm
mov ah,4ch
int 21h
```
🔸 *AH=4Ch মানে DOS কে বলছি: “Program শেষ, exit করো”*  
👉 `int 21h` দিয়ে graceful shutdown।

---

## 🧪 Example Input → Output
- Input: `A` then `B`  
- BL = `41h`, BH = `42h`  
- Swap → BL = `42h`, BH = `41h`  
- Output: `BA`

