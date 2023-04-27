;对一组数据进行正数、负数、零的数量进行计数
DATA SEGMENT
    VAL    DB  7,98,-98,123,18,113,-45,66,-13,-122,0,-33,0,-99,0
    ZHENG  DB 0
    FU     DB 0
    LING   DB 0 
DATA ENDS
ASSUME CS:CODE,DS:DATA
CODE SEGMENT
START:
    MOV AX,DATA
    MOV DS,AX
    LEA BX,VAL 
    
    MOV AX,0
    MOV DX,0
    
    MOV CX,15
   s: 
    MOV AH,[BX]
    CMP AH,0
    JG  GREATER
    JL  LESS
    JE   EQUAL 
    JMP S0
  GREATER:
    INC AL
    JMP S0
  LESS:
    INC DH 
    JMP S0
  EQUAL:
    INC DL
    JMP S0
  S0:  
    INC BX   
    LOOP s
   
   MOV ZHENG,AL
   MOV FU,DH
   MOV LING,DL
   
   MOV AX,4C00H
   INT 21H 
    
CODE ENDS
END START