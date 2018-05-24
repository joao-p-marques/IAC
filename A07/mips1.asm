.eqv PRINT_STR, 4
.eqv READ_INT, 5
.eqv EXIT, 10


.data
prompt1 : .asciiz "Introduza um n�mero: \n"
strpar : .asciiz "O n�mero � par.\n"
strimp : .asciiz "O n�mero � impar.\n"

.text
#int a; a - $t0

main: la $a0, prompt1
      li $v0, PRINT_STR
      syscall
      
      li $v0, READ_INT
      syscall
      move $t0, $v0
      
      andi $t1, $t0, 1
      bne $t1, 0, EX
  DO: la $a0, strpar
      li, $v0, PRINT_STR
      syscall
      j END
  EX: la $a0, strimp
      li, $v0, PRINT_STR
      syscall
  END: 
      
      
 li $v0, EXIT #
 syscall # exit()
 
 
 
