DATA SEGMENT
    DB 'Welcome to masm!'
    DB 16 DUP(0)
DATA ENDS

CODE SEGMENT
START: 
    MOV AX,DATA
    MOV DS,AX
    MOV ES,AX
    
    MOV SI,0
    MOV DI,16
    MOV CX,16
    cld
    rep movsb

MOV AX,4C00H
INT 21H


CODE ENDS
END START
