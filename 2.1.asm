DATAS SEGMENT
	TABLE DB 30H,31H,32H,33H,34H,35H,36H,37H,38H,39H,41H,42H,43H,44H,45H,46H
	BCD DB 0A6H
	ASC DW ?
    ;此处输入数据段代码  
DATAS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS
START:
    MOV AX,DATAS
    MOV DS,AX
    MOV AL,BCD
    MOV AH,AL
    MOV CL,4
    SHR AH,CL
    AND AL,0FH
    XLAT TABLE
    XCHG AH,AL
    XLAT TABLE
    MOV ASC,AX
    ;此处输入代码段代码
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START

