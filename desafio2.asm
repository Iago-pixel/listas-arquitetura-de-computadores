.text
main: lui $8, 0x1001   # $8 <= 0x10010000

      lui $9, 0x0f0f   # $9 <= 0x00ff0000
      srl $9, $9, 4
      addi $10, $0, 512
     
      addi $4, $0, 0
      addi $5, $0, 0x00ffffff
laco: beq $10, $0, npc
     
     
      addi $2, $0, 42
      syscall
     
     
      sw $4, 0($8)
      sw $4, 2048($8)
     
     
      addi $8, $8, 4
      addi $10, $10, -1
      j laco
     
     
 #     lui $8, 0x1001   # $8 <= 0x10010000
     
npc:  addi $11, $0, 0x00ffffff
      lui $8, 0x1001   # $8 <= 0x10010000
      addi $16, $8, 128
      addi $8, $8, 252
      sw $11, 0($8)
      addi $14, $0, -4
     
      addi $13, $0, 45
npcGo: beq $13, $0, sainpc

      jal nulltime
    	    
      #testar se chegou em uma das bordas e, caso verdadeiro, multiplicar $14 por -1]
      addi $18, $0, -1
      beq $8, $16, inverter
      	j continuar
      	inverter:
      	mul $14, $14, $18
      	continuar:
      
      lw $12, 2048($8)
      sw $12, 0($8)
      add $15, $8, $14
      sw $11, 0($15)

      add $8, $8, $14
     
      addi $13, $13, -1
      j npcGo
sainpc:      









      addi $2, $0, 10
      syscall
# rotina para gastar tempo      
# usado: $25
nulltime:
        addi $25, $0, 10000
ntfor:  beq $25, $0, ntfim
        nop
        nop
        addi $25, $25, -1
        j ntfor        
ntfim: jr $31