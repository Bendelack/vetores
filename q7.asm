# Faça um programa que preencha um vetor com 10 números, calcule e mostre a
# quantidade de números negativos e a soma dos números positivos desse vetor.

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
	addi $11, $0, 0 # soma
	addi $12, $0, 0 # quantidade de negativos
	
comp:	beq $9, $10, fim
	lw $13, 0($8)
	
	blt $13, $0, ngt
	add $11, $11, $13
	j inc
	
ngt:	addi $12, $12, 1
	
inc:	addi $8, $8, 4
	addi $9, $9, 1
	j comp
	
fim:	add $4, $0, $11
	addi $2, $0, 1
	syscall
	
	add $4, $0, ' '
	addi $2, $0, 11
	syscall
	
	add $4, $0, $12
	addi $2, $0, 1
	syscall
	
	addi $2, $0, 10
	syscall