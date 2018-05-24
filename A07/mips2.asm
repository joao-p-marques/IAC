.eqv PRINT_STR, 4
.eqv READ_INT, 5
.eqv EXIT, 10
.eqv PRINT_CHAR, 11

.data
prompt : .asciiz "Introduza um número:\n"
#int a - $t0;  
#int i - $t1;

.text
main: la $a0, prompt
      li $v0, PRINT_STR
      syscall
      
      li $v0, READ_INT
      syscall
      move $t0, $v0
      
      addi $t1, $0, 0
      
 FOR: beq $t0, $t1, DONE
      li $a0, '-'
      li $v0, PRINT_CHAR
      syscall
      addi $t1, $t1, 1
      j FOR
 DONE:
 
 li $v0, EXIT #
 syscall # exit() 