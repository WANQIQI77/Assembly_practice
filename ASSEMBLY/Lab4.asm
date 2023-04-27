assume cs:code
code segment
 mov ax,0h
 mov ds,ax
 mov bx,0200h

 mov dx,0h

 mov cx,40h
s: 
 mov ds:[bx],dl
 inc dx
 inc bx
 loop s

 mov ax,4c00h
 int 21h
code ends
end