MOV DX, 34H  
MOV BX, 99H   

MOV AL,DL
ADD AL,BL

DAA
 
MOV CL,AL
                 
MOV AL,00H  
ADC AL,AL

DAA
  
MOV CH,AL 


HLT