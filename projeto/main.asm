.text
main:	add $14, $0, $0		#$14 - move para direita
	lui $15, 0xffff		#$15 - verificar input teclado
	add $23, $0, $0		#$23 - contador
	looptela:
	lui $8, 0x1001		#$8 - valor da UG atual
	addi $9, $8, 0x8000	#$9 - comeco do cenario
	addi $18, $9, 0x36C00	#$18 - comeco do meta 
	add $10, $14, $9	#$10 - valor do dado grafico atual
	add $19, $14, $18	#$19 - valor atual do meta
	addi $11, $0, 64	#$11 - contador de linhas
	gerartela:
		addi $12, $0, 128	#$12 - contador de UG
		gerarlinha:
			lw $13, 0($19)
			bne $13, $0, temmonstro
				lw $13, 0($10)
				j desenharcelula
				temmonstro:
				addi $20, $0, 1
				bne $13, $20, desenharcelula
					addi $4, $0, 4
					jal moverparaesquerda
					lw $13, 0($10)
			desenharcelula:
			sw $13, 0($8)
			addi $8, $8, 4
			addi $10, $10, 4
			addi $19, $19, 4
			addi $12, $12, -1
			bne $12, $0, gerarlinha
		addi $9, $9, 3504
		add $10, $14, $9
		addi $18, $18, 3504
		add $19, $14, $18
		addi $11, $11, -1
		bne $11, $0, gerartela
	lw $16, 0($15)
	beq $16, $0, ficarparado
	lw $16, 4($15)
      	addi $17, $0, ' '
      	beq $16, $17, fim
	beq $14, 2988, ficarparado
      	addi $17, $0, 'd'
      	bne $16, $17, ficarparado
	addi $14, $14, 4
	ficarparado:
	addi $23, $23, 1
	j looptela
	fim:
	addi $2, $0, 10
	syscall

# move o inimigo para a esquerda
# entrada: $4
# usado: $19, $20, $21, $22
moverparaesquerda:
	addi $20, $0, 8
	div $23, $20
	mfhi $20
	bne $20, $0, naomover
		addi $20, $0, 4
		mul $4, $4, $20
		addi $20, $0, -8
		movercelula:
			sub $21, $19, $4
			lw $22, 0($21)
			sw $22, -4($21)
			addi $4, $4, -4
			bne $4, $20, movercelula
	naomover:
	jr $31
	
	
	
