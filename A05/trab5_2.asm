
.text

main : 	and $t2, $t0, $t1
	or $t3, $t0, $t1
	nor $t4, $t0, $t1
	xor $t5, $t0, $t1
	nor $t6, $t0, $0

li $v0, 10 #
syscall # exit()
