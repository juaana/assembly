;e) Escriba la subrutina CONTAR_CAR que cuenta la cantidad de veces que aparece un carácter dado en una cadena
;terminada en cero. El carácter a buscar se debe pasar por valor mientras que la cadena a analizar por referencia,
;ambos a través de la pila.
;Ejemplo: CONTAR_CAR de ‘abbcde!’ y ‘b’ debe retornar 2, mientras que CONTAR_CAR de ‘abbcde!’ y ‘z’
;debe retornar 0.

ORG 1000H

CAR DB "abbcde!"
db 0
CARBUSC DB 'b'

ORG 3000H

CONTAR_CAR:
    MOV DX, 0
    MOV BX, SP
    ADD BX, 2
    MOV CL, [BX] 
    ADD BX, 2
    MOV CH, 0 ; CH a cero


    MOV AX, [BX] ; Cargar el byte de la cadena en AX
    MOV BX, AX
  LOOP:  MOV AX, [BX]
    CMP AL, 0    
    JZ FIN
    CMP AL, CL
    JZ INCREMENTO
    
   
    
NO_INCREMENT:
    INC BX        ; Moverse al siguiente byte de la cadena
    JMP LOOP

INCREMENTO: 
    INC BX
    INC DX
    JMP LOOP

FIN: RET

ORG 2000H

MOV AX, OFFSET CAR
PUSH AX
MOV CL, CARBUSC 
PUSH CX
CALL CONTAR_CAR

HLT
END