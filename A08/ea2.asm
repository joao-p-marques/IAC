.eqv PRINT_STR, 4
.eqv READ_INT, 5
.eqv EXIT, 10
.eqv PRINT_CHAR, 11
.eqv PRINT_INT , 1

.data
lista : .word 0 : 6
msg : .asciiz "Insira 6 números: \n"
msg2 : .asciiz "Números inseridos: "
#$t0 --- int i

.text
main :  la $a0, msg
	li $v0, PRINT_STR
	syscall
	
	move $t0, $0 # i = 0
	la $a1, lista # lista adress in $a1
	
   for: bge $t0, 6, efor
   	
   	sll $t1, $t0, 2 # 4 * i = $t1 --- Adress to add to the list adress
   	addu $t1, $a1, $t1 # adress to acess --- listAdress + 4*i
   
	li $v0, READ_INT
	syscall
	sw $v0, 0($t1) # load read value into lista[i]
	
	addi $t0, $t0, 1 # i++
	
	j for
	
  efor: move $t0, $0 # i = 0
  	
  	la $a0, msg2
	li $v0, PRINT_STR
	syscall
  	
  for2: bge $t0, 6, efor2
   	
   	sll $t1, $t0, 2 # 4 * i = $t1 --- Adress to add to the list adress
   	addu $t1, $a1, $t1 # adress to acess --- listAdress + 4*i
   
   	lw $a0, 0($t1) # load lista[i] andress into $a0 to print
	li $v0, PRINT_INT
	syscall
	
	li $v0, PRINT_CHAR
	li $a0, ',' # print ',' to separate values
	syscall
	
	addi $t0, $t0, 1 # i++
	
	j for2
	
  efor2: li $v0, EXIT
  	 syscall