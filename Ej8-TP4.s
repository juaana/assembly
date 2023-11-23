#Escribir un programa que multiplique dos números enteros utilizando sumas repetidas (similar a Ejercicio 6 o 7 de la Práctica
#1). El programa debe estar optimizado para su ejecución con la opción Delay Slot habilitada.

.data
NUM1: .word 3
NUM2: .word 5
SUMA: .word 0

.code 
ld r1, NUM1(r0) #indice
ld r2, NUM2(r0) 
dadd r3, r0, r0 #=SUMA
beqz r1, FIN
beqz r2, FIN


loop: 
daddi r1,r1,-1
bnez r1, loop
dadd r3, r3, r2

sd r3, SUMA(r0)
FIN: halt