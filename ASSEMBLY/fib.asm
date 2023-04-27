DATA SEGMENT

    DW 1, 1, 18 DUP (0)
DATA ENDS
 
ASSUME DS:DATA

code segment    
start:
    mov AX,DATA
    mov DS,AX
    mov bx,4 
        
    mov cx,13h
s:    
    mov dx,0h
    add dx,[bx-4]
    add dx,[bx-2]
    mov [bx],dx
    inc bx 
    inc bx
    loop s
    
    mov ax,4c00h
    int 21h
code ends                    


end start