.text
main:	addi $2, $0, 5
	syscall
	add $8, $0, $2
	addi $2, $0, 5
	syscall
	mul $4, $2, $8
	addi $2, $0, 1
	syscall