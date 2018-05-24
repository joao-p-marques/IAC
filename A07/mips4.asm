.eqv PRINT_STR, 4
.eqv READ_INT, 5
.eqv EXIT, 10
.eqv PRINT_CHAR, 11
.eqv PRINT_INT , 1

.data
#int num - $t0;
#int n - $t1;
prompt : .asciiz "Introduza um número: "
result : .asciiz "\n O número em hexadecimal é: "

.text
main :  la $a0, prompt
	li $v0, PRINT_STR
	syscall
	
	li $v0, READ_INT
	syscall
	move $t0, $v0
	
	la $a0, result
	li $v0, PRINT_STR
	syscall
	
	addi $t1, $0, 0 #n = 0
	addi $t2, $0, 8 #tmp = 8
   FOR: beq $t1, $t2, DONE
	andi $t3, $t0, 0xF0000000
  DONE: 