.text
main:	addi $9, $0, 10	# max
	addi $10, $0, 3	# mul
	
formul3:beq $8, $9, fimformul3 # loop
	add $4, $0, $10
	addi $2, $0, 1
	syscall # imprime multiplo
	addi $10, $0, 3 # prox mul
	addi $8, $0, 1 # contador
	j formul3
fimformul3:
	addi $2, $0, 10
	syscall
	
	