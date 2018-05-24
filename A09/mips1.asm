.eqv PRINT_STR, 4
.eqv PRINT_INT, 1
.eqv READ_INT, 5
.eqv EXIT, 10

.data
# $t0 = res
# $t1 = i
# $t2 = n
# $t3 = f
# $a0 = num
prompt1 : .asciiz "Introduza um número:\n"
result : .asciiz "O fatorial do número inserido é:\n"

.text 
main: la $a0, prompt1
      li $v0, PRINT_STR
      syscall # print prompt1
      
      li $v0, READ_INT
      syscall
      move $a0, $v0 # n = readInt
      
 #     la $a0, 0($t2) # num = n
      jal fatorial # call function
      add $t3, $v0, $0 # value returned by function goes to f ($t3)
      
      la $a0, prompt1
      li $v0, PRINT_STR
      syscall # print string result
      
      #la $a0, ($t3) # value to print (f) goes to $a0
      move $a0, $t3
      li $v0, PRINT_INT
      syscall # print result
      
      li $v0, EXIT #
      syscall # exit()
      
fatorial: addi $t0, $0, 1 # res = 1
	  add $t1, $a0, $0 # i = num
	   
	  for: blez $t1, outFor # jump out if i<=0
#	       mult $t0, $t1 # multiply res*i 
#	       mflo $t0 # result of multiplication goes to res
	       mul $t0,$t1,$t0
	       addi $t1, $t1, -1 # i--
	       j for
	  outFor: add $v0, $t0, $0 # return value (res) goes to $v0
	  	  jr $ra # return to caller    
      
      
      
      
	        
