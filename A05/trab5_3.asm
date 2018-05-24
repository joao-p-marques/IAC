
.text

main : 	sll $t1, $t0, 1
	sra $t2, $t0, 1
	srl $t3, $t0, 1
	
li $v0, 10
syscall