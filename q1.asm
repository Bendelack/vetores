# Faça um programa que possua um vetor (apelide de A) que armazene 6 números inteiros. O programa deve executar os seguintes passos:

# a) Atribua os seguintes valores a esse vetor: 1, 0, 5, -2, -5, 7.
# b) Armazene em uma variável inteira (simples) a soma entre os valores das posições A[0], A[1] e A[5] do vetor e mostre na tela esta soma.
# c) Modifique o vetor na posição 4, atribuindo a esta posição o valor 100.
# d) Mostre na tela cada valor do vetor A, um em cada linha. 0 4 8 12 16 20
.text
main: 	lui $8, 0x1001
	addi $9, $0, 0
	addi $10, $0, 6

loop: 	beq $9, $10, fimLer
	addi $2, $0, 5
	syscall
	sw $2, 0($8)
	addi $8, $8, 4
	addi $9, $9, 1
	j loop
	
fimLer: lui $8, 0x1001
	addi $11, $0, 0 # soma
	lw $12, 0($8)
	add $11, $11, $12

	lw $12, 4($8)
	add $11, $11, $12
	
	lw $12, 20($8)
	add $11, $11, $12
	
	addi $13, $0, 100 #fazoL
	
	sw $13, 16($8)
	
	# imprimir soma
	add $4, $0, $11
	addi $2, $0, 1
	syscall
	
	addi $4, $0, '\n'
        addi $2, $0, 11
        syscall
	
	addi $9, $0, 0
	
imp: 	beq $9, $10, fimPr
	lw $4, 0($8)

	addi $2, $0, 1
	syscall
	addi $8, $8, 4
	addi $9, $9, 1
	
	addi $4, $0, '\n'
        addi $2, $0, 11
        syscall
	j imp

fimPr:	addi $2, $0, 10
	syscall
