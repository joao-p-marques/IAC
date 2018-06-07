.eqv PRINT_STR, 4
.eqv PRINT_INT, 1
.eqv READ_INT, 5
.eqv EXIT, 10
.eqv PRINT_CHAR, 11

.data
src: .asciiz "String original de exemplo"
copy: .space 26

.text
main: la $a0, copy
      la $a1, src
      
      jal strcopy
      
      la $a0, copy
      li $v0, PRINT_STR
      syscall

      li $v0, EXIT #
      syscall # exit()  

strcopy: # $a0 - dst, $a1 - src
	 addi $t0, $0, 0 # i=0
	 
	 while: add $t1, $a0, $t0 # dst[i]
	 	add $t2, $a1, $t0 # src[i]
	 	
	 	lb $t2, ($t2)
	 	
	 	beq $t2, '\0', outwhile
	 	
	 	# lb $t3, ($t2) # $t3 gets contents of src[i]
	 	sb $t2, ($t1) # $t3 goes to dst[i]
	 	
	 	addi $t0, $t0, 1
	 	
	 	j while
	 outwhile: sb $0, ($t1)
	 	   jr $ra
	 	
strcat: 
	 	
	 