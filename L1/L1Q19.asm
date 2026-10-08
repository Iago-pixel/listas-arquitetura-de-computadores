.text
main:	addi $2, $0, 5
	syscall
	
	addi $8, $0, 7
	sub $8, $8, $2
	srl $8, $8, 31
	add $8, $8, $2
	andi $8, $8, 1
	addi $4, $8, 30
	addi $2, $0, 1
	syscall