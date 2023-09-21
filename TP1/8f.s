;f) Escriba la subrutina REEMPLAZAR_CAR que reciba dos caracteres (ORIGINAL y REEMPLAZO) por valor a
;través de la pila, y una cadena terminada en cero también a través de la pila. La subrutina debe reemplazar el
;carácter ORIGINAL por el carácter REEMPLAZO.
ORG 1000H

CAR DB "abbcde!"
db 0
CARBUSC DB 'b'
CARCAMB DB 'a'

ORG 3000H

REEMPLAZAR_CAR:
    MOV BX, SP
    ADD BX, 2
    MOV DL, [BX] 
    MOV DH, 0 ; DH a cero
    
    ADD BX, 2
    MOV CL, [BX] 
    MOV CH, 0 ; CH a cero

    ADD BX, 2 
    MOV AX, [BX] ; Cargar el byte de la cadena en AX
    MOV BX, AX
LOOP: MOV AX, [BX]
    CMP AL, 0    
    JZ FIN
    CMP AL, CL
    JZ CAMBIAR
    
   
    
NO_CAMBIAR:
    INC BX        ; Moverse al siguiente byte de la cadena
    JMP LOOP

CAMBIAR: 
    MOV [BX], DL
    INC BX
    JMP LOOP

FIN: RET

ORG 2000H

MOV AX, OFFSET CAR
PUSH AX
MOV CL, CARBUSC 
PUSH CX
MOV DL, CARCAMB
PUSH DX
CALL REEMPLAZAR_CAR
HLT
END
