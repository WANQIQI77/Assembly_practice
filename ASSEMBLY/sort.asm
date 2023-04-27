; 假设数组（12，3，4，334，5）已经存放在data段中
data segment
    arr dw 12, 3, 4, 334, 5
    len equ ($ - arr) / 2 ; 计算数组长度
data ends

code segment
    assume cs:code, ds:data
start:
    mov ax, data ; 将数据段地址加载到ax中
    mov ds, ax ; 将数据段地址传递给ds寄存器
    mov bx, offset arr ; 将数组首地址加载到bx中
    mov cx, len ; 将数组长度加载到cx中
    dec cx ; 减一，因为只需要比较n-1次
outer_loop: ; 外层循环，每次将最大的数移到最后
    push cx ; 保存外层循环次数
    mov cx, len ; 将数组长度加载到cx中
    dec cx ; 减一，因为每次只需要比较n-1对数
    mov si, 0 ; 将数组索引置零
inner_loop: ; 内层循环，每次比较相邻的两个数，并交换位置
    mov ax, [bx + si] ; 将第一个数加载到ax中
    cmp ax, [bx + si + 2] ; 比较第一个数和第二个数（因为是字类型，所以偏移量加2）
    jg swap ; 如果第一个数大于第二个数，就跳转到交换代码
    next: ; 如果不需要交换，就继续下一对数的比较
        add si, 2 ; 将数组索引加2（因为是字类型）
        loop inner_loop ; 循环内层代码，直到cx为零
        pop cx ; 恢复外层循环次数
        loop outer_loop ; 循环外层代码，直到cx为零
        mov ah, 4ch ; 准备结束程序
        int 21h ; 调用系统中断

swap: ; 交换两个数的位置
    xchg ax, [bx + si + 2] ; 交换ax和第二个数的值
    xchg ax, [bx + si] ; 交换ax和第一个数的值（相当于交换了两个数）
    jmp next ; 跳转到下一对数的比较

code ends

end start