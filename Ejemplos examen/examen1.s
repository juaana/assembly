;3. Escribir un programa para MSX88 que deberá utilizar las luces de la siguiente forma. Leer caracteres continuamente en un lazo, y según el carácter leído realizar las siguientes funciones:
; a. Si el carácter es “w” (ASCII 119), sumar 1 al byte que indica qué luces se prenden y apagan (Ej: de 01000101 a 01000110) 
;b. Si el carácter es “s” (ASCII 115), invertir el byte que indica qué luces se prenden y apagan (Ej: de 01000101 a 10111010) 
;c. Si el carácter es “q” (ASCII 113), mostrar el mensaje “Fin del programa.” y finalizar el mismo. 
;d. Si el carácter no es ninguno de los anteriores, mostrar el mensaje “Comando inválido” 
;Las funciones ”a”, “b”, “c” y “d” deben implementarse utilizando subrutinas. (8 ptos)

PB EQU 31H
CB EQU 33H


ORG 1000H
LEIDO DB ?
MENSAJE1 DB "FIN DE PROGRAMA"
FIN1 DB ?
MENSAJE2 DB "COMANDO INVALIDO"
FIN2 DB ?



ORG 3000H
ES_W: ADD AL,01H
  OUT PB, AL
  RET

ES_S: 
NOT AL
OUT PB, AL
RET


ES_Q: MOV BX, OFFSET MENSAJE1
  MOV AL, OFFSET FIN1-OFFSET MENSAJE1
  INT 7 
  RET

NO_ES: MOV BX, OFFSET MENSAJE2
  MOV AL, OFFSET FIN2-OFFSET MENSAJE2
  INT 7
  RET

ORG 2000H

MOV AL, 0 
OUT CB, AL ; CONFIGURO CB A 0 PARA QUE TODOS SEAN DE SALIDA

MOV AL,01010101B
OUT PB, AL    


  MOV BX, OFFSET LEIDO
  INT 6
  CMP LEIDO, 119 
  JZ W
  CMP LEIDO, 115
  JZ S
  CMP LEIDO, 113
  JZ Q
  JMP NO
  
  W: CALL ES_W
  JMP FIN
  S: CALL ES_S
  JMP FIN
  Q: CALL ES_Q
  JMP FIN

  NO: CALL NO_ES


FIN: INT 0
END