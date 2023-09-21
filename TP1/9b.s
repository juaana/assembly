;9b) Usando la subrutina ROTARIZQ del ejercicio anterior, escriba una subrutina ROTARIZQ_N que realice N
;rotaciones a la izquierda de un byte. La forma de pasaje de parámetros es la misma, pero se agrega el parámetro N
;que se recibe por valor y registro. Por ejemplo, al rotar a la izquierda 2 veces el byte 10010100, se obtiene el byte
;01010010.
ORG 1000H 
BT DB 10010001b      
N DB 2

ORG 3000H
ROTARIZQ: 
MOV BX, AX
MOV AX, [BX]
CONDICION: CMP CL, 0
JZ FIN
SUMA: ADD AL, AL 
      JC HAYCARRY
      DEC CL
      JMP CONDICION


HAYCARRY: ADD AX, 00000001
DEC CL
JMP CONDICION

FIN: MOV BT, AL 
RET 

ORG 2000H
MOV AX, OFFSET BT 
MOV CL, N
CALL ROTARIZQ
HLT
END
