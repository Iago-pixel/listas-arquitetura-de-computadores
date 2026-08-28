.text
main:	addi $2, $0, 5
	syscall
	addi $8, $2, 29
	
	addi $9, $0, 3
	sub $10, $2, $9
	sub $11, $9, $2
	srl $10, $10, 31
	srl $11, $11, 31
	add $12, $10, $11
	addi $13, $0, 19
	mul $14, $13, $12
	add $4, $8, $14
	
	addi $2, $0, 11
	syscall
	