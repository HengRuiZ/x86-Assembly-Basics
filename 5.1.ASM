 CODE SEGMENT
 ASSUME CS:CODE
 CS0 EQU 3000H
 MY8255_A EQU CS0+00H ;8255 的A 口地址
 MY8255_B EQU CS0+01H ;8255 的B 口地址
 MY8255_C EQU CS0+02H ;8255 的C 口地址
 MY8255_MODE EQU CS0+03H ;8255 的控制寄存器地址
 START:MOV DX,MY8255_MODE
 MOV AL,10000010B
 OUT DX,AL
 LOOP1:MOV DX,MY8255_B
 IN AL,DX
 MOV DX,MY8255_A
 OUT DX,AL
 JMP LOOP1
 CODE ENDS
 END START