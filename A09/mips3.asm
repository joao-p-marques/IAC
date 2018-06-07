.eqv PRINT_STR, 4
.eqv PRINT_INT, 1
.eqv READ_INT, 5
.eqv EXIT, 10
.eqv PRINT_CHAR, 11

.data
# $t0 - n
# $t1 - i
str : .asciiz "String de exemplo"
prompt : .asciiz "A String tem "
prompt2 : .asciiz " caracteres. \n"

.text
      		    
main : la $a0, str

       jal strlen
       add $t3, $v0, $0
       
       la $a0, prompt
       li $v0, PRINT_STR
       syscall
       
       move $a0, $t3
       li $v0, PRINT_INT
       syscall # print result 
       
       la $a0, prompt2
       li $v0, PRINT_STR
       syscall
       
       li $v0, EXIT #
       syscall # exit()      

strlen : addi $t0, $0, 0 # n=0
	 addi $t1, $0, 0 # i=0
	 
	 # la $a1, str
	 	 
	 while: add $a1, $a0, $t1 # $a1 will contain the adress of $a0( - str) + i
	 	lb $t2, ($a1) # $t2 will contain the byte in $a1(str[i])
	 	
	 	beq $t2, '\0', outWhile
	 	
	 	addi $t0, $t0, 1 # n++
		
		addi $t1, $t1, 1 # i++
      		
      		j while
      		
      	 outWhile : addi $v0, $t0, 0
      		    jr $ra # return to caller

	 	