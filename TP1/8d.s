ORG 1000H
CAR DB "aAb"
 DB 0
RES DW ?

ORG 4000H
ES_VOCAL: MOV AL, 0FFH
CMP AH, 41H ;A
JZ FIN
CMP AH, 45H ;E
JZ FIN
CMP AH, 49H ;I
JZ FIN
CMP AH, 4FH ;O
JZ FIN
CMP AH, 55H ;U
JZ FIN
CMP AH, 61H ;a
JZ FIN
CMP AH, 65H ;e
JZ FIN
CMP AH, 69H ;i
JZ FIN
CMP AH, 6FH ;o
JZ FIN
CMP AH, 75H ;u
JZ FIN
MOV AL, 00H
FIN: RET

ORG 3000H
VOCALES: MOV CX, 0 
LOOP: MOV AH, [BX] 
CMP AH, 0 
JZ fin_vocales ; si es 0 es el fin de la cadena 
CALL ES_VOCAL; si no es 0 llamo a la subrutina ES_VOCAL
CMP AL, 0FFH ; cuando retorna, comparo AL con 00FH
JNZ NOES ; si comparo y no es 0FFH (o sea que no es vocal, voy a NOES)
INC CX ; si es 0FFH incremento el contador de vocales

NOES: INC BX ; si no es vocal sigo a la siguiente letra 
JMP LOOP

fin_vocales: RET; fin de las vocales

ORG 2000h
MOV BX, offset CAR
CALL VOCALES
MOV RES, CX
HLT
END