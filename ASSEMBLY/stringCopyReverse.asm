data segment
    db 16 dup(0)
data ends

code segment
start:
     mov ax,0F000H
     mov ds,ax
     mov si,0ffffH
     
     mov ax,data
     mov es,data
     mov di,15
         
     mov cx,16
     std 
     rep movsb

mov ax,4c00h
int 21h

code ends
end start