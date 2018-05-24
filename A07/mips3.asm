.eqv PRINT_STR, 4
.eqv READ_INT, 5
.eqv EXIT, 10
.eqv PRINT_CHAR, 11
.eqv PRINT_INT , 1

.data
#int i - $t0;
#int n - $t1;
#int f - $t2;
prompt : .asciiz "Introduza um número:\n"
result : .asciiz "O fatorial do número inserido é: "

.text
main:   la $a0, prompt
	li $v0, PRINT_STR
	syscall
	
	li $v0, READ_INT
	syscall
	move $t1, $v0
	
	addi $t2, $0, 1 # f = 1
	add $t0, $t1, $0 # i = n
	
   FOR: beq $t0, $0, DONE
   	mulu $t2, $t2, $t0
   	subi $t0, $t0, 1
   	j FOR
  DONE:	la $a0, result
  	li $v0, PRINT_STR
  	syscall
  	
	move $a0, $t2
  	li $v0, PRINT_INT
  	syscall  
  	
 li $v0, EXIT #
 syscall # exit() 