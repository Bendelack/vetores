# Fa�a um programa que leia um vetor de 8 posi��es e, em seguida, leia tamb�m dois
# valores X e Y quaisquer correspondentes a duas posi��es (�ndices) no vetor. Ao final
# seu programa dever� escrever a soma dos valores encontrados nas respectivas
# posi��es X e Y.

.text
main: 	lui $8, 0x1001
	addi $9, $0, 0
	addi $10, $0, 8
	addi $11, $0, 0 # soma

ler: 	beq $9, $10, fimLer
	addi $2, $0, 5
	syscall
	sw $2, 0($8)
	addi $9, $9, 1
	addi $8, $8, 4
	j ler

fimLer: lui $8, 0x1001
	addi $2, $0, 5 # primeiro numero
	syscall
	mul $12, $2, 4
	add $8, $8, $12
	lw $11, 0($8)

	lui $8, 0x1001
	addi $2, $0, 5 # segundo numero
	syscall
	mul $12, $2, 4
	add $8, $8, $12

	lw $13, 0($8)
	add $11, $11, $13

	addi $4, $11, 0
	addi $2, $0, 1
	syscall

	addi $2, $0, 10
	syscall