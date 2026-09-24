.text
main:	addi $2, $0, 5
	syscall
	add $8, $0, $2
	
	addi $2, $0, 5
	syscall
	add $9, $0, $2
	
	slt $10, $8, $9
	bne $10, $0, maior9
		add $4, $0, $8
		sub $11, $8, $9
		j fim
	maior9:	add $4, $0, $9
		sub $11, $9, $8
	fim:	addi $2, $0, 1
		syscall
		
		addi $4, $0, '\n'
		addi $2, $0, 11
		syscall
		
		add $4, $0, $11
		addi $2, $0, 1
		syscall
		
		addi $2, $0, 10
		syscall