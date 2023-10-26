# Faça um programa que leia um vetor de 10 posições. Contar e escrever quantos
# valores pares ele possui.

.text
main: 	lui $8, 0x1001
	addi $9, $0, 0
	addi $10, $0, 10
	
ler: 	beq $9, $10, fimLer
	addi $2, $0, 5
	syscall
	sw $2, 0($8)
	addi $9, $9, 1
	addi $8, $8, 4
	j ler
	
fimLer: lui $8, 0x1001
	addi $9, $0, 0
	
imp: 	beq $9, $10, fim
	lw $11, 0($8) # armazena um valor do vetor no registrador 11
	
	addi $12, $0, 2
	div $11, $12
	mfhi $13 # resto da divisao por 2 

	bne $13, 0, inc

	add $4, $0, $11
	addi $2, $0, 1
	syscall
	addi $4, $0, ' '
	addi $2, $0, 11
	syscall

inc: 	addi $9, $9, 1 # incremento
	addi $8, $8, 4 # incremento
	j imp
	
fim:	addi $2, $0, 10
	syscall