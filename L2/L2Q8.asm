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
	
	addi $12, $0, 13
	slt $11, $9, $12
	beq $11, $0, fim
	
	addi $12, $0, 0
	slt $11, $12, $9
	beq $11, $0, fim
	
	addi $12, $0, 0
	slt $11, $12, $8
	beq $11, $0, fim
	
	addi $12, $0, 32
	slt $11, $8, $12
	beq $11, $0, fim
	
	addi $12, $0, 31
	
	addi $13, $0, 4
	beq $9, $13, mesde30dias
	addi $13, $0, 6
	beq $9, $13, mesde30dias
	addi $13, $0, 9
	beq $9, $13, mesde30dias
	addi $13, $0, 11
	beq $9, $13, mesde30dias
		j mesde31dias
		mesde30dias:
		slt $11, $9, $12
		beq $11, $0, fim
		mesde31dias: 
	