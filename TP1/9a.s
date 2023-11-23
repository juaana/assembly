;a) Escribir una subrutina ROTARIZQ que haga una rotación hacia la izquierda de los bits de un byte almacenado en la
;memoria. Dicho byte debe pasarse por valor desde el programa principal a la subrutina a través de registros y por
;referencia. No hay valor de retorno, sino que se modifica directamente la memoria.
ORG 1000H 
BT DB 00010001b

ORG 3000H
ROTARIZQ: 
MOV BX, AX
MOV AX, [BX]
ADD AL, AL 
JC HAYCARRY
MOV BT, AL 
RET

HAYCARRY: ADD AX, 00000001
MOV BT, AL
RET 
ORG 2000H
MOV AX, OFFSET BT 
CALL ROTARIZQ
HLT
END