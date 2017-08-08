DATA SEGMENT
    MSG1 DB 'LENGTH:','$'
    SHEX DB '0123456789ABCDEF$'
    MAXLEN EQU 200H
;�˴��������ݶδ���  
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE,DS:DATA
START:
    MOV AX,DATA
    MOV DS,AX
    mov ax,0
    mov bl,24H
    mov di, offset MSG1
    ;ѭ���Ƚ��ַ����е�ÿ���ַ�������ͳ��ֵ����AX��
MYLOOP:
    cmp byte ptr[di], bl
    jz EXIT
    inc di
    inc ax
    jmp MYLOOP
EXIT:
    push ax
    ;��ʾ��ʾ����
    mov	dx,offset MSG1
    mov	ah,9h
    int	21h

    pop ax
    call printlen

    mov ah,4ch
    int 21h

;��ӡ�����ȣ����ȱ�����AX��
printlen proc near
    mov cx,4
PRINTLOOP:
    rol ax,1
    rol ax,1
    rol ax,1
    rol ax,1
    push ax
    mov dl,al
    and dl,0FH
    mov bx, offset SHEX
    add bl,dl
    mov dl, byte ptr [bx]
    mov ah,2
    int 21h
    pop ax
    loop PRINTLOOP
    ret
printlen endp

CODE ENDS

END START
