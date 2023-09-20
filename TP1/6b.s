;6b) Llamando a una subrutina MUL para efectuar la operación, pasando los parámetros por valor desde el programa
;principal a través de registros y devolviendo el resultado a través de un registro por valor.
ORG 1000H
NUM1 DW 2
NUM2 DW 3
RES DW ?

ORG 3000H 
MULT: MOV DX, 0 
LOOP: ADD DX, AX 
DEC BX 
JNZ LOOP 
RET 

ORG 2000H
MOV AX, NUM1
MOV BX, NUM2
CALL MULT 
MOV RES, DX 
HLT 
END