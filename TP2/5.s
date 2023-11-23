;5) Modificar el programa anterior agregando una subrutina llamada ES_NUM que verifique si el caracter ingresado es
;realmente un número. De no serlo, el programa debe mostrar el mensaje “CARACTER NO VALIDO”. La subrutina debe
;recibir el código del caracter por referencia desde el programa principal y debe devolver vía registro el valor 0FFH en caso
;de tratarse de un número o el valor 00H en caso contrario. Tener en cuenta que el código del “0” es 30H y el del “9” es
;39H.

ORG 1000H
MSJ DB "INGRESE UN NUMERO:"
MSJDOS DB "CARACTER NO VALIDO"
FIN DB ?
DIG DB 30H

ORG 1500H
NUM DB ?

ORG 3000H
ES_NUM: CMP DL, DIG
JZ ES
CMP DIG, 39H
JZ NOES
INC DIG 
JMP ES_NUM

NOES: MOV DX, 00H 
RET
ES: MOV DX, 00FH
RET

ORG 2000H
MOV BX, OFFSET MSJ
MOV AL, OFFSET MSJDOS-OFFSET MSJ
INT 7
MOV BX, OFFSET NUM
INT 6
MOV DL, [BX]
CALL ES_NUM
  CMP DX, 00FH
  JZ SIGUE
CMP DX, 00H
    JZ NOSIGUE
    
SIGUE: MOV AL, 1
     JMP IMP   

NOSIGUE: MOV BX, OFFSET MSJDOS
MOV AL, OFFSET FIN - OFFSET MSJDOS
JMP IMP

IMP: INT 7      
MOV CL, NUM
INT 0
END