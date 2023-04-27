DATA SEGMENT

    DW 1, 1, 18 DUP (0)
DATA ENDS
ASSUME DS:DATA,CS:CODE
code segment
start:
	mov AX,DATA
	mov DS,AX
	mov bx,4 
		
	mov cx,18
s:	
    mov dx,0
    add dx,[bx-4]
    add dx,[bx-2]
    mov [bx],dx
    inc bx 
	INC bx
	loop s
	
	mov ax,4c00h
	int 21h
code ends
end start
