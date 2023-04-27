CODESG SEGMENT
    ASSUME CS:CODESG
START:
    MOV  AX, 2000H
    MOV  SS, AX
    MOV  SP, 0
    ADD  SP, 10
    POP  AX
    POP  BX    
   
    MOV  AX, 12H
    MOV  BX, 34H
   
    PUSH AX
    PUSH BX
    POP  AX
    POP  BX

    MOV  AX, 4C00H
    INT  21H
CODESG ENDS
END START