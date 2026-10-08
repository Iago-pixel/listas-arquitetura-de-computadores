.text
main:	addi $2, $0, 5
	syscall
	
	addi $8, $0, 4
	div $2, $8
	mfhi $9
	beq $9, $0, divisivel4
		addi $10, $0, 0
		j fimdivisivel4
		divisivel4:
		addi $8, $0, 100
		div $2, $8
		mfhi $9
		beq $9, $0, divisivel100
			addi $10, $0, 1
			j fimdivisivel4
			divisivel100:
			addi $8, $0, 400
			div $2, $8
			mfhi $9
			beq $9, $0, divisivel400
				addi $10, $0, 0
				j fimdivisivel4
				divisivel400:
				addi $10, $0, 1
		fimdivisivel4:
	beq $10, $0, nao
		j fimnao
		nao:
		addi $4, $0, 'n'
		addi $2, $0, 11
		syscall
		addi $4, $0, 'ã'
		addi $2, $0, 11
		syscall
		addi $4, $0, 'o'
		addi $2, $0, 11
		syscall
		addi $4, $0, ' '
		addi $2, $0, 11
		syscall
		fimnao:
	addi $4, $0, 'é'
	addi $2, $0, 11
	syscall
	addi $4, $0, ' '
	addi $2, $0, 11
	syscall
	addi $4, $0, 'b'
	addi $2, $0, 11
	syscall
	addi $4, $0, 'i'
	addi $2, $0, 11
	syscall
	addi $4, $0, 's'
	addi $2, $0, 11
	syscall
	addi $4, $0, 's'
	addi $2, $0, 11
	syscall
	addi $4, $0, 'e'
	addi $2, $0, 11
	syscall
	addi $4, $0, 'x'
	addi $2, $0, 11
	syscall
	addi $4, $0, 't'
	addi $2, $0, 11
	syscall
	addi $4, $0, 'o'
	addi $2, $0, 11
	syscall