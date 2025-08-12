##  MacBook Air M1-এ MASM 8086 

### ধাপ ১: Rosetta 2 ইনস্টল করা
আপনার Mac M1 চিপে পুরনো Intel অ্যাপ চালাতে Rosetta দরকার। আপনি ইতিমধ্যে সফলভাবে ইনস্টল করেছেন:

```bash
softwareupdate --install-rosetta
```

এখন আপনি DOSBox চালাতে পারবেন।

---

### ধাপ ২: DOSBox ডাউনলোড ও ইনস্টল
1. এই লিংকে যান: [DOSBox Download](https://www.dosbox.com/download.php?main=1)
2. macOS এর জন্য DOSBox 0.74 ভার্সন ডাউনলোড করুন।
3. `.dmg` ফাইল খুলে **DOSBox.app** কে **Applications** ফোল্ডারে টেনে রাখুন।

---

### ধাপ ৩: MASM 8086 ফাইল ডাউনলোড
1. এই লিংক থেকে MASM ফাইল ডাউনলোড করুন:  
   🔗 [MASM 8086 ZIP](https://www.mediafire.com/file/mm7cjztce9efj4w/8086.zip)
2. `8086.zip` ফাইল unzip করে রাখুন `~/DOSBox/8086` ফোল্ডারে।

👉 Terminal-এ লিখে ফোল্ডার তৈরি করুন:
```bash
mkdir -p ~/DOSBox/8086
```

---

### ধাপ ৪: DOSBox চালু করে ফোল্ডার মাউন্ট করুন
DOSBox খুলে নিচের কমান্ডগুলো টাইপ করুন:
```
mount c ~/DOSBox/8086
c:
```

এতে আপনার MASM ফাইলগুলো `C:` drive হিসেবে DOSBox-এ দেখাবে।

---

### ধাপ ৫: ASM প্রোগ্রাম লিখুন, কম্পাইল করুন, চালান

#### 📄 প্রোগ্রাম লিখুন:
```
edit hello.asm
```

এই কোড লিখুন:
```asm
.model small
.stack 100h
.data
msg db 'Hello, MASM!', '$'
.code
main:
    mov ah, 09h
    lea dx, msg
    int 21h
    mov ah, 4Ch
    int 21h
end main
```
File > Save → File > Exit

#### ⚙️ কম্পাইল ও রান করুন:

step1: 
```mount c ~/DOSBox/8086
c:
```
step2:
```
masm hi.asm    (এখনে hi ফাইল name)
```
step3:
```
Object filename [HELLO.OBJ]: [Enter]
Source listing [HELLO.LST]: [Enter]
Cross-reference [HELLO.CRF]: [Enter]
```
সব জায়গায় শুধু Enter চাপুন

step4: 
এখন link করতে হবে 
```
link hi.obj  (এখনে hi ফাইল name)
```
---
step5:
```
EXE filename [HELLO.EXE]: [Enter]
Map filename [HELLO.MAP]: [Enter]
Library file: [Enter]
```
সব জায়গায় শুধু Enter চাপুন

step6: রান করুন 
```
hi     (শুধু ফাইলের নাম)
```
Enter চাপ দিলেই,output দেখতে পারবেন...


## Contact Me
- 📧 ইমেইল: mehedimamun604@gmail.com
- 🐙 GitHub: https://github.com/Mehedi-16
- 📱 WhatsApp: +8801310-990177
