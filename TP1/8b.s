;b) Escribir una subrutina CONTAR_MIN que cuente el número de letras minúsculas de la ‘a’ a la ‘z’ de una cadena de
;caracteres terminada en cero almacenada en la memoria. La cadena se pasa a la subrutina por referencia vía registro,
;y el resultado se retorna por valor también a través de un registro.
;Ejemplo: CONTAR_MIN de ‘aBcDE1#!’ debe retornar 2.

ORG 1000H 
CAR DB "aBcDeE1#!"
DB 00H 
RES DW ?

ORG 3000H
CONTAR_MIN: MOV DX, 0
LOOP: MOV AH, [BX]
    CMP AH, 00H 
    JZ FIN 

    CMP AH, 61H
    JZ INCREMENTAR
    CMP AH, 62H
    JZ INCREMENTAR
    CMP AH, 63H
    JZ INCREMENTAR
    CMP AH, 64H
    JZ INCREMENTAR
    CMP AH, 65H
    JZ INCREMENTAR
    CMP AH, 66H
    JZ INCREMENTAR
    CMP AH, 67H
    JZ INCREMENTAR
    CMP AH, 68H
    JZ INCREMENTAR
    CMP AH, 69H
    JZ INCREMENTAR
    CMP AH, 6AH
    JZ INCREMENTAR
    CMP AH, 6BH
    JZ INCREMENTAR
    CMP AH, 6CH
    JZ INCREMENTAR
    CMP AH, 6DH
    JZ INCREMENTAR
    CMP AH, 6EH
    JZ INCREMENTAR
    CMP AH, 6FH
    JZ INCREMENTAR
    CMP AH, 70H
    JZ INCREMENTAR
    CMP AH, 71H
    JZ INCREMENTAR
    CMP AH, 72H
    JZ INCREMENTAR
    CMP AH, 73H
    JZ INCREMENTAR
    CMP AH, 74H
    JZ INCREMENTAR
    CMP AH, 75H
    JZ INCREMENTAR
    CMP AH, 76H
    JZ INCREMENTAR
    CMP AH, 77H
    JZ INCREMENTAR
    CMP AH, 78H
    JZ INCREMENTAR
    CMP AH, 79H
    JZ INCREMENTAR
    CMP AH, 7AH
    JZ INCREMENTAR

MAYUSCULA: INC BX
           JMP LOOP
           FIN: RET 

INCREMENTAR: INC DX 
             INC BX 
             JMP LOOP

ORG 2000H
MOV BX, OFFSET CAR 
CALL CONTAR_MIN 
MOV RES, DX 
HLT 
END 