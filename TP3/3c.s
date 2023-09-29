;* Escribir un programa que imprime “UNIVERSIDAD NACIONAL DE LA PLATA” en la impresora a
;través del HAND-SHAKE. La comunicación se establece por interrupciones emitidas desde el
;HAND-SHAKE cada vez que la impresora se desocupa.
EOI EQU 20H
IMR EQU 21H
INT2 EQU 26H
HAND_DATO    EQU 40H
HAND_ESTADO  EQU 41H

ORG 1000H
MENSAJE DB "UNIVERSIDAD NACIONAL DE LA PLATA"
FIN   DB ?

ORG 3000H
; Recorremos el mensaje y lo enviamos caracter
; a caracter hacia la impresora
IMPRIMIR: 
MOV AL, [BX] ; Tomo el caracter
OUT HAND_DATO, AL ; Lo envio al registro de datos
INC BX ; Avanzo a la siguiente posicion

; Chequeo si llegue al final del string
CMP BX, OFFSET FIN
JNZ CONTINUA

; En caso de que llegue aca significa que llegamos al final del string. Debemos desactivar las interrupciones por Handshake y por el PIC
IN AL, HAND_ESTADO ; Tomo estado actual
AND AL, 07FH ; 7FH = 01111111
OUT HAND_ESTADO, AL ; Estado = 0xxxxxxx

; NOTA: no hace falta las sentencias CLI y STI porque estamos haciendo esto antes de enviar el 20H al EOI, por lo que el PIC no nos va a interrumpir ya que sabe que seguimos atendiendo la interrupcion
MOV AL, 11111111b ; Todo deshabilitado!
OUT IMR, AL

; Aviso al PIC y vuelvo de la subrutina
CONTINUA: MOV AL, 20H
OUT EOI, AL
IRET

ORG 2000H
; Configuro el vector de interrupciones. ID = 9
MOV AX, IMPRIMIR
MOV BX, 36 ; 36 = 9 * 4
MOV [BX], AX

; Configuro PIC
CLI
MOV AL, 11111011b ; Solo Handshake habilitado
OUT IMR, AL

MOV AL, 9
OUT INT2, AL ; Mando el ID seleccionado al registro INT2

MOV BX, OFFSET MENSAJE ; Para recorrer el mensaje
STI

; Configuro el Handshake para interrupcion
IN AL, HAND_ESTADO ; Tomo estado actual
OR AL, 80H ; 80H = 10000000
OUT HAND_ESTADO, AL ; Estado = 1xxxxxxx

; Simulamos un programa en ejecucion para ver que puede interrumpirnos
POLL: 
IN AL, IMR
CMP AL, 11111111b
JNZ POLL

INT 0
END
