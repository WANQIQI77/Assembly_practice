; �������飨12��3��4��334��5���Ѿ������data����
data segment
    arr dw 12, 3, 4, 334, 5
    len equ ($ - arr) / 2 ; �������鳤��
data ends

code segment
    assume cs:code, ds:data
start:
    mov ax, data ; �����ݶε�ַ���ص�ax��
    mov ds, ax ; �����ݶε�ַ���ݸ�ds�Ĵ���
    mov bx, offset arr ; �������׵�ַ���ص�bx��
    mov cx, len ; �����鳤�ȼ��ص�cx��
    dec cx ; ��һ����Ϊֻ��Ҫ�Ƚ�n-1��
outer_loop: ; ���ѭ����ÿ�ν��������Ƶ����
    push cx ; �������ѭ������
    mov cx, len ; �����鳤�ȼ��ص�cx��
    dec cx ; ��һ����Ϊÿ��ֻ��Ҫ�Ƚ�n-1����
    mov si, 0 ; ��������������
inner_loop: ; �ڲ�ѭ����ÿ�αȽ����ڵ���������������λ��
    mov ax, [bx + si] ; ����һ�������ص�ax��
    cmp ax, [bx + si + 2] ; �Ƚϵ�һ�����͵ڶ���������Ϊ�������ͣ�����ƫ������2��
    jg swap ; �����һ�������ڵڶ�����������ת����������
    next: ; �������Ҫ�������ͼ�����һ�����ıȽ�
        add si, 2 ; ������������2����Ϊ�������ͣ�
        loop inner_loop ; ѭ���ڲ���룬ֱ��cxΪ��
        pop cx ; �ָ����ѭ������
        loop outer_loop ; ѭ�������룬ֱ��cxΪ��
        mov ah, 4ch ; ׼����������
        int 21h ; ����ϵͳ�ж�

swap: ; ������������λ��
    xchg ax, [bx + si + 2] ; ����ax�͵ڶ�������ֵ
    xchg ax, [bx + si] ; ����ax�͵�һ������ֵ���൱�ڽ�������������
    jmp next ; ��ת����һ�����ıȽ�

code ends

end start