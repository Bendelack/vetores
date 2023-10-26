# Faça um programa que leia um vetor com 10 posições. Em seguida deverá ser
# impresso o maior e o menor elemento do vetor.
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
	lw $11, 0($8)
	add $12, $0, $11 # menor
	add $13, $0, $11 # maior
	addi $9, $0, 0
	addi $8, $8, 4
	
each:	beq $9, $10, imp
	lw $11, 0($8)
	
	bgt $12, $11, nMnor # pula for maior
	add $12, $0, $11
	j inc
	
nMnor: 	blt $13, $11, inc # pula se for menor
	add $13, $0, $11
	
inc:	addi $8, $8, 4
	addi $9, $9, 1
	j each
	
imp:	add $4, $0, $12
	addi $2, $0, 1
	syscall
	
	add $4, $0, ' '
	addi $2, $0, 11
	syscall
	
	add $4, $0, $13
	addi $2, $0, 1
	syscall
	
	addi $2, $0, 10
	syscall