;根据以下定义的数据段，编写完整的程序，求出数据缓冲区 VAL 中的 12 个 数据的平均值，并将平均值的结果存放在 AVG 单元中。
DATA  SEGMENT
 	VAL  DB  34H ,0A7H , 99H , 56H , 0FBH , 0D8H , 89H, 21H, 4 DUP (0BAH)
 	NUM=$ - VAL
	AVG DB 0
DATA  ENDS

ASSUME CS:CODE,DS:DATA
CODE SEGMENT
    START:
    MOV AX,DATA
    MOV DS,AX
    MOV BX,0
    
    MOV CX,NUM
    XOR AX,AX
 S:
    ADD AL,[BX]
    ADC AH,00H
    INC BX
    LOOP S
    
    MOV BL,NUM
    DIV BL
    MOV AVG,AL
    
    
    MOV AX,4C00H
    INT 21H
    
    
CODE ENDS
END START
