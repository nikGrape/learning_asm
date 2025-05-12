# Type your code here.
# Do not initialize $s0 and $s1 here. 
# Use the + button under the Register display to initialize $s0 and $s1.
# Task: Given an array of four integers, write a program that populates a new array with the square of the elements in the given array. Assume $s0 stores the memory location of the first element of the given array, and $s1 stores the memory location of the first element of the new array.

# Type your code here.
# Do not initialize $s0 and $s1 here. 

addi $t0, $zero, 4
Loop: beq $t0, $zero, Exit
   lw $t1, 0($s0)
   mult $t1, $t1
   mflo $t1
   sw $t1, 0($s1)
   
   addi $s0, $s0, 4
   addi $s1, $s1, 4
   
   addi $t0, $t0, -1
   j Loop
Exit: