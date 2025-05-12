# Type your code here.
# Do not initialize register values here.

jal max_of_3 # start procedure mas_of_3
add $s3, $v1, $zero # save returned value to $s3
j Exit # exit program

max_of_3:
   slt $t1, $s0, $s1 # t1 = 1 if s0 < s1
   beq $t1, $zero, ElseS0 # jump to ElseS0 if $s0 is larger
   
   slt $t1, $s1, $s2 # t1 = 1 if s1 < s2
   beq $t1, $zero, ElseS1
   add $v1, $s2, $zero
   jr $ra
   
   ElseS1:
   add $v1, $s1, $zero
   jr $ra
   
   ElseS0:
   slt $t1, $s0, $s2 # t1 = 1 if s0 < s2
   beq $t1, $zero, ElseS0a # s0 is larger
   add $v1, $s2, $zero
   jr $ra
   
   ElseS0a:
   add $v1, $s0, $zero
   jr $ra
   
Exit: