;6c) Llamando a una subrutina MUL, pasando los parámetros por referencia desde el programa principal a través de
;registros, y devolviendo el resultado a través de un registro por valor.
ORG 1000H
NUM1 DW 2
NUM2 DW 3
RES DW ?

ORG 3000H 
MULT: MOV DX, 0 
MOV CX, BX 
MOV BX, AX
MOV AX, [BX]
MOV BX, CX 
LOOP: ADD DX, [BX] 
DEC AX 
JNZ LOOP 
RET 

ORG 2000H
MOV AX, OFFSET NUM1
MOV BX, OFFSET NUM2
CALL MULT 
MOV RES, DX 
HLT 
END