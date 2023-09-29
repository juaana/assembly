;a) * Escribir un programa que imprime “INGENIERIA E INFORMATICA” en la impresora a través del
;HAND-SHAKE. La comunicación se establece por consulta de estado (polling). ¿Qué diferencias
;encuentra con el ejercicio 2b?
HAND_DATO    EQU 40H
HAND_ESTADO  EQU 41H

ORG 1000H
MENSAJE DB "INGENIERIA E INFORMATICA"
FIN DB ?

ORG 2000H
; Configuro el Handshake para el polling
IN AL, HAND_ESTADO ; Tomo estado actual
AND AL, 07FH ; 7FH = 01111111
OUT HAND_ESTADO, AL ; Estado = 0xxxxxxx

; Recorremos el mensaje y lo enviamos caracter
; a caracter hacia la impresora
MOV BX, OFFSET MENSAJE ; Para recorrer el mensaje
POLL: IN AL, HAND_ESTADO ; Tomo el estado actual
    AND AL, 1 ; Chequeo el primer bit
    JNZ POLL ; Mientras sea 1 sigo en el loop
    MOV AL, [BX] ; Tomo el caracter
    OUT HAND_DATO, AL ; Lo envio al registro de datos
    INC BX ; Avanzo a la siguiente posicion
    CMP BX, OFFSET FIN ; Chequeo si llegue al final
    JNZ POLL
INT 0
END