.eqv PRINT_STR, 4
.eqv PRINT_INT, 1
.eqv READ_INT, 5
.eqv EXIT, 10

.data
# $t0 = n
# $t1 = i
prompt1 : .asciiz "Introduza um número:\n"
result : .asciiz "O fatorial do número inserido é:\n"