.text
main:	addi $2, $0, 5
	syscall
	
	slt $10, $0, $2
	bne $10, $0, positivo
		mul $4, $2, $2
		j fim
	positivo:
		addi $8, $8, 2
		mul $4, $2, $8
	fim:	addi $2, $0, 1
		syscall
		
		addi $2, $0, 10
		syscall