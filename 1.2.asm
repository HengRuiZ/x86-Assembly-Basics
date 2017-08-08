DATA SEGMENT
  NUMBER EQU 6
  BUFFER1 DB 12H,0E2H,33H,43H,12H
  BUFFER2 DB 22H,0A2H,55H,0F2H,3FH
  RESULT DB NUMBER DUP(?)
  DATA ENDS
  CODE SEGMENT
  ASSUME CS:CODE,DS:DATA
  START:　 MOV AX,DATA 
  MOV DS,AX
  MOV CX,NUMBER-1
  MOV SI,OFFSET BUFFER1 ;被加数指针
  MOV DI,OFFSET BUFFER2 ;加数指针
  LEA BX,RESULT ;和指针
  XOR AX,AX ;清CF标志
  NEXT: MOV AL,[SI]
  ADC AL,[DI] ;带进位相加
  MOV BYTE PTR [BX],AL ;保存部分和
  INC SI ;变动指针
  INC DI
  INC BX
  LOOP NEXT ;循环控制
  ADC AH,0 ;最高1位进位
  MOV BYTE PTR [BX],AH
  MOV AX,4C00H ;返回系统
  INT 21H
  CODE ENDS
  END START
