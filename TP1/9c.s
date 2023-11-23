;c) Usando la subrutina ROTARIZQ_N del ejercicio anterior, escriba una subrutina ROTARDER_N que sea similar
;pero que realice N rotaciones hacia la derecha.
;Una rotación a derecha de N posiciones, para un byte con 8 bits, se obtiene rotando a la izquierda 8 - N posiciones. Por
;ejemplo, al rotar a la derecha 6 veces el byte 10010100 se obtiene el byte 01010010, que es equivalente a la rotación a
;la izquierda de 2 posiciones del ejemplo anterior.

ORG 1000H 
BT DB 10010100b      
N DB 2

ORG 3000H
ROTARDER: 
MOV BX, AX
MOV AX, [BX]
SUB DL, CL
MOV CL, DL
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
MOV DL, 8
CALL ROTARDER
HLT
END
