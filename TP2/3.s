//3) * Escribir un programa que muestre en pantalla las letras del abecedario, sin espacios, intercalando mayúsculas y
//minúsculas (AaBb…), sin incluir texto en la memoria de datos del programa. Tener en cuenta que el código de “A” es 41H,
//el de “a” es 61H y que el resto de los códigos son correlativos según el abecedario.
ORG 1000h
MIN DB 061h
MAX DB 041h

ORG 2000h        
LOOP: CMP MIN,7bh
      JZ FIN
      MOV BX,OFFSET MAX
      MOV AL,1
      INT 7
      MOV BX,OFFSET MIN 
      MOV AL, 1
      INT 7
      INC MIN
      INC MAX
      JMP LOOP
FIN: INT 0
END