# Type your code here.
# Do not initialize register values here.
# The values are stored in $s0, $s1, and $s2. Store the result in $s3.


# copy values into args registers:
add $a0, $s0, $zero
add $a1, $s1, $zero
add $a2, $s2, $zero

jal max_of_3        # start procedure mas_of_3
add $s3, $v1, $zero # save returned value to $s3
j Exit              # exit program


max_of_2: # args: a0, a1
   slt $t1, $a0, $a1        # t1 = 1 if a0 < a1
   beq $t1, $zero, Else     # jump to Else if $a0 is larger
   
   add $v1, $a1, $zero      # return a1
   jr $ra
   
   Else:
   add $v1, $a0, $zero      # return a0
   jr $ra

max_of_3: # args: a0, a1, a2
    addi $sp, $sp, -4 # make room in the stack for 1 item
    sw $ra, 0($sp)

    jal max_of_2 # sets v1 = max_of(a0, a1)

    add $a0, $v1, $zero
    add $a1, $a2, $zero

    jal max_of_2 # sets v1 = max_of(v1, a2)

    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

   
Exit: