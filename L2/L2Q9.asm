.text
main:	# dia atual = $8/$9/$10; dia seguinte = $11/$12/$13; dia anterior = $14/$15/$16
	addi $2, $0, 5
	syscall
	add $8, $0, $2
	
	addi $2, $0, 5
	syscall
	add $9, $0, $2
	
	addi $2, $0, 5
	syscall
	add $10, $0, $2
	
	add $11, $0, $8
	add $12, $0, $9
	add $13, $0, $10
	
	addi $11, $0, 28
	slt $12, $8, $11
	beq $12, $0, talvezultimodia
		 addi $11, $8, 1
		 j diaanterior
		 talvezultimodia:
		 addi $14, $0, 31
		 bne $8, $14, naoe30nem31
		 addi $14, $0, 30
		 bne $8, $14, naoe30nem31
		 	addi $14, $0, 12
		 	beq $10, $14, dezembro1
		 		addi $11, $0, 1
		 		addi $12, $9, 1
		 		j diaanterior
		 		dezembro1:
		 		addi $11, $0, 1
		 		addi $12, $0, 1
		 		addi $13, $10, 1
		 		j diaanterior
		 	naoe30nem31:
		 	addi $14, $0, 2
		 	beq $9, $14, fevereiro1
		 		addi $11, $8, 1
		 		j diaanterior
		 		fevereiro1:
		 		addi $14, $0, 29
		 		bne $8, $14, dia28
		 			addi $11, $0, 1
		 			addi $12, $0, 3
		 			j diaanterior
		 			dia28:
		 			addi $14, $0, 4
		 			div $10, $14
		 			mfhi $14
		 			beq $14, $0, divpor41
		 				addi $11, $0, 1
		 				addi $12, $0, 3
		 				j diaanterior
		 				divpor41:
		 				addi $14, $0, 100
		 				div $10, $14
		 				mfhi $14
		 				beq $14, $0, div1001
		 					addi $11, $0, 29
		 					j diaanterior
		 					div1001:
		 					addi $14, $0, 400
		 					div $10, $14
		 					mfhi $14
		 					beq $14, $0, div4001
		 						addi $8, $0, 1
		 						addi $9, $0, 3
		 						j diaanterior
		 						div4001:
		 						addi $8, $0, 29
	diaanterior:
	add $14, $0, $8
	add $15, $0, $9
	add $16, $0, $10
	
	addi $17, $0, 1
	beq $8, $17, ehdia1
		addi $14, $8, -1
		j fim
		ehdia1:
		bne $9, $17, naoehjanero
			addi $14, $0, 31
			addi $15, $0, 12
			addi $16, $10, -1
			j fim
			naoehjanero:
			addi $17, $0, 2
			beq $9, $17, fevereiro
			addi $17, $0, 4
			beq $9, $17, abril
			addi $17, $0, 6
			beq $9, $17, junho
			addi $17, $0, 8
			beq $9, $17, agosto
			addi $17, $0, 9
			beq $9, $17, setembro
			addi $17, $0, 11
			beq $9, $17, novembro
			
			addi $17, $0, 3
			beq $9, $17, marco
				addi $14, $0, 30
				addi $15, $9, -1
				j fim
				fevereiro:
				abril:
				junho:
				agosto:
				setembro:
				novembro:
				addi $14, $0, 31
				addi $15, $9, -1
				j fim
				marco:
				addi $17, $0, 4
				div $10, $17
				mfhi $17
				beq $17, $0, div4
					addi $14, $0, 28
					addi $15, $9, 2
					j fim
					div4:
					addi $17, $0, 100
					div $10, $17
					mfhi $17
					beq $17, $0, div100
						addi $14, $0, 29
						addi $15, $9, 2
						j fim
						div100:
						addi $17, $0, 400
						div $10, $17
						mfhi $17
						beq $17, $0, div400
							addi $14, $0, 28
							addi $15, $9, 2
							j fim
							div400:
							addi $14, $0, 29
							addi $15, $9, 2
	fim:
	add $4, $0, $11
	addi $2, $0, 1
	syscall
	addi $4, $0, '/'
	addi $2, $0, 11
	syscall
	add $4, $0, $12
	addi $2, $0, 1
	syscall
	addi $4, $0, '/'
	addi $2, $0, 11
	syscall
	add $4, $0, $13
	addi $2, $0, 1
	syscall
	addi $4, $0, '\n'
	addi $2, $0, 11
	syscall
	
	add $4, $0, $14
	addi $2, $0, 1
	syscall
	addi $4, $0, '/'
	addi $2, $0, 11
	syscall
	add $4, $0, $15
	addi $2, $0, 1
	syscall
	addi $4, $0, '/'
	addi $2, $0, 11
	syscall
	add $4, $0, $16
	addi $2, $0, 1
	syscall
	addi $4, $0, '\n'
	addi $2, $0, 11
	syscall
	
	addi $2, $0, 10
	syscall
	