;2) Escribir un programa que muestre en pantalla todos los caracteres disponibles en el simulador VonSim, comenzando con
;el caracter cuyo código es el número 01H.
        ORG 1000h
LETRA DB 01h

        ORG 2000h
LOOP:CMP LETRA,0FFh
      JZ FIN
      MOV BX,OFFSET LETRA
      MOV AL,1
      INT 7
      INC LETRA
      JMP LOOP
FIN: INT 0
END
