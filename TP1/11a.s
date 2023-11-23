;11a) Escriba la subrutina DIV que calcule el resultado de la división entre 2 números positivos. Dichos números deben
;pasarse por valor desde el programa principal a la subrutina a través de la pila. El resultado debe devolverse también
;a través de la pila por valor.

ORG 1000H
num1 DB 6H
num2 DB 3H

ORG 3000H
resto: MOV AL, 0 ; inicializo el resto en 0
  MOV DH, 0 ; inicializo el cociente de la división
DIV:  CMP CH, 0 ; CH tiene NUM2
  JZ FIN
  CMP CL, 0 ; CL tiene NUM1
  JZ FIN
 SUB CL, CH
  INC DH ; sumo al cociente
  JMP DIV

FIN: RET
ORG 2000H
MOV CL, num1
MOV CH, num2
CALL resto
HLT
END