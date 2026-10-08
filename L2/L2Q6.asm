.text
main:	addi $2, $0, 5
	syscall
	add $8, $0, $2
	
	addi $2, $0, 5
	syscall
	add $9, $0, $2
	
	addi $10, $0, 65
	slt $11, $8, $10
	not $11, $11	# pelo menos 65 anos -> $11 CONDIÇÃO 1
	
	addi $10, $0, 40
	slt $12, $9, $10
	not $12, $12	# trabalhou pelo menos 40 anos -> $12 CONDIÇÃO 2
	
	addi $10, $0, 65
	slt $13, $8, $10
	not $13, $13	# pelo menos 60 anos -> $13 e...
	
	addi $10, $0, 35
	slt $14, $10, $9	# trabalhou mais de 35
	
	and $15, $13, $14	# pelo menos 60 anos E trabalhou mais de 35 -> $15 CONDIÇÃO 3
	
	