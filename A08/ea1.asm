.eqv PRINT_STR, 4
.eqv READ_INT, 5
.eqv EXIT, 10
.eqv PRINT_CHAR, 11
.eqv PRINT_INT , 1

.data
lista : .word 4, 3 , -2, 1, 27, 45
msg : .asciiz "O conteudo do Array é: "
#$t0 --- int i

.text
main: 	la $a0, msg
	li $v0, PRINT_STR
	syscall
	
	move $t0, $0 # i = 0
	la $a1, lista # lista adress in $a1
	
   for: bge $t0, 6, efor
   	
   	sll $t1, $t0, 2 # 4 * i = $t1 --- Adress to add to the list adress
   	addu $t1, $a1, $t1 # adress to acess --- listAdress + 4*i
   
   	lw $a0, 0($t1) # load lista[i] andress into $a0 to print
	li $v0, PRINT_INT
	syscall
	
	li $v0, PRINT_CHAR
	li $a0, ',' # print ',' to separate values
	syscall
	
	addi $t0, $t0, 1 # i++
	
	j for
	
  efor: li $v0, EXIT
  	syscall
	
	
	
	
	
	