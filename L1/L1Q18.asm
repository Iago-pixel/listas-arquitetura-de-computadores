.text
main:	addi $2, $0, 5
	syscall
	add $8, $0, $2
	
	addi $2, $0, 5
	syscall
	
	sub $9, $8, $2
	srl $9, $9, 31
	mul $11, $8, $9
	sub $9, $2, $8
	srl $9, $9, 31
	mul $10, $2, $9
	add $4, $10, $11
	addi $2, $0, 1
	syscall