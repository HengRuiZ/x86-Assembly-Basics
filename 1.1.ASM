DATA SEGMENT
  SS1 DW 1234H
  SS2 DW 0EA32H
  SS3 DD 12345678H
  DD1 DB 0 
  DD2 DW ? 
  DD3 DW ? 
DATA ENDS
CODE SEGMENT
  ASSUME CS:CODE,DS:DATA
  START:MOV AX,DATA
  MOV DS,AX
  MOV AX,SS1;YIDONG SS1 DAO AX
  MOV DD1,AL;YIDONG AL DAO DD1,JI SS1 DIZIJIE DAO DD1
  LEA SI,SS2;YIDONG SS2
  LEA DI,DD2
  MOV AX,[SI]
  MOV [DI],AX;SS2 YIDONG WANCHENG
  MOV SI,OFFSET SS3;YIDONG SS3
  MOV DI,OFFSET DD3
  MOV AX,[SI]
  MOV DD3,AX
  INC SI
  INC DI
  MOV AX,[SI]
  MOV [DI],AX;SS3 YIDONG WANCHENG
  MOV AX,4C00H ;����ϵͳ
  INT 21H
  CODE ENDS
  END START