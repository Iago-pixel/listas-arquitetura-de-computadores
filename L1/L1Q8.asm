.text
main:	addi $2, $0, 5
	syscall
	add $8, $0, $2
	addi $2, $0, 5
	syscall
	add $9, $0, $2
	addi $2, $0, 5
	syscall
	add $10, $0, $2
	
	mul $8, $8, 3600
	mul $9, $9, 60
	
	add $4, $8, $9
	add $4, $4, $10
	addi $2, $0, 1
	syscall