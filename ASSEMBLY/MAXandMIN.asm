DATA  SEGMENT 
	VALUE  DB -31, 85, 29,67,69,77,112,100,82,67,-8,35,-60,66,11,105,117,56,-81 
	MAX  DB  0  ;[20]
	MIN   DB  0  ;[21]
DATA  ENDS 
ASSUME CS:CODE,DS:DATA
CODE SEGMENT 
START: 
    MOV AX,DATA
    MOV DS,AX
    MOV BX,0  
    MOV AL,[BX]
    MOV [20],AL
    MOV [21],AL
    MOV CX,20
  S:
    MOV AL,[BX]
    CMP AL,MAX
    JG MA 
    CMP AL,MIN  
    JL MI 
    JMP NEXT
 MA:
    MOV MAX,AL
    JMP NEXT
 MI:
    MOV MIN,AL
    JMP NEXT 
 
NEXT:
    INC BX
    LOOP S
      

    MOV AX,4C00H
    INT 21H
    
CODE ENDS 
END START