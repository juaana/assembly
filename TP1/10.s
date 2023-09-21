;10) SWAP Escribir una subrutina SWAP que intercambie dos datos de 16 bits almacenados en memoria. Los
;parámetros deben ser pasados por referencia desde el programa principal a través de la pila.
;Para hacer este ejercicio, tener en cuenta que los parámetros que se pasan por la pila son las direcciones de memoria,
;por lo tanto para acceder a los datos a intercambiar se requieren accesos indirectos, además de los que ya se deben
;realizar para acceder a los parámetros de la pila.

ORG 1000H
VALOR1 DW 45
VALOR2 DW 46

ORG 3000H
SWAP: MOV BX, SP 

;LIFO: VALOR 2 SALE PRIMERO 
ADD BX, 2
MOV DX, BX
MOV AX, [BX]
MOV BX, AX 
MOV AX, [BX]

;DATOS VALOR 1
MOV BX, DX 
ADD BX, 2
MOV CX, [BX]
MOV BX, CX 
MOV CX, [BX]
;¿DIRECCIONES?
MOV BX, DX
MOV BX, [BX]
MOV [BX], CX

ADD DX, 2
MOV BX, DX
MOV BX, [BX]
MOV [BX], AX

RET


ORG 2000H
MOV AX, OFFSET VALOR1 
PUSH AX
MOV AX, OFFSET VALOR2
PUSH AX
CALL SWAP
HLT
END