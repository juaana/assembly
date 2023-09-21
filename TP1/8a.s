;8) Subrutinas para realizar operaciones con cadenas de caracteres
;a) Escribir una subrutina LONGITUD que cuente el número de caracteres de una cadena de caracteres terminada en
;cero (00H) almacenada en la memoria. La cadena se pasa a la subrutina por referencia vía registro, y el resultado se
;retorna por valor también a través de un registro.
;Ejemplo: la longitud de ‘abcd’00h es 4 (el 00h final no cuenta)

ORG 1000H 
CAR DB "EXCCELENTE"
DB 00h

ORG 3000H
LONGITUD : MOV DX, 0 ; counter
LOOP: MOV AH, [BX]
CMP AH, 00H 
JZ FIN 
INC BX 
JMP LOOP 
FIN: RET 

ORG 2000H
MOV BX, OFFSET CAR 
CALL LONGITUD 
HLT 
END 