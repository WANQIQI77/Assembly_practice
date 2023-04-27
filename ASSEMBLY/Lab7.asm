assume cs: codesg 
data segment 
    db '1975','1976','1977','1978','1979','1980','1981','1982','1983','1984' 
    db '1985','1986','1987','1988','1989','1990','1991','1992','1993','1994' 
    db '1995' 
    ; 以上是表示 21 年的 21 个字符串 
    
    dd 16, 22, 382, 1356, 2390, 8000, 16000, 24486, 50065, 97479
    dd 140417, 197514, 345980, 590827, 803530, 1183000, 1843000, 2759000, 3753000, 4649000
    dd 5937000 
    ; 以上是表示 21 年公司总收入的 21 dword 型数据
    
    dw 3, 7, 9, 13, 28, 38, 130, 220, 476, 778
    dw 1001, 1442, 2258, 2793, 4037, 5635, 8226, 1542, 14430, 15257 
    dw 17800 
    ;以上是表示 21 年公司雇员人数的 21 word 型数据
    
data ends 
table segment 
    db 21 dup ('year summ ne ?? ')     ; 用字符表示对应格式及其字节数
table ends 
code segment
start:   
    mov ax,table
    mov ds,ax
    mov bx,0
    
    mov ax,data
    mov es,ax    
    
    mov si,0
    mov di,0
    mov cx,21
    s:
    ;年份\总收入：四字节，存两次   
    mov ax,es:[si]
    mov [bx],ax ;年份
    mov ax,es:[si+84]
    mov [bx+5],ax;总收入
    add si,2
    mov ax,es:[si]
    mov [bx+2],ax
    mov ax,es:[si+84]
    mov [bx+7],ax
    
    
    ;雇员人数
    mov ax,es:[di+168]
    mov [bx+10],ax
    
    
    ;求人均收入
    mov ax,es:[si+82]
    mov dx,es:[si+84]
    div word ptr es:[di+168]
    mov [bx+13],ax 
    
    add si,2
    add di,2
    add bx,10h
    loop s
    
    mov ax,4c00h
    int 21h
code ends
end start