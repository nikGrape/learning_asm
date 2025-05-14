# Do not initialize $s0 and $s1 here. 
# Task: Given an array of four integers, write a program that populates 
# a new array with the square of the elements in the given array. 
# Assume $s0 stores the memory location of the first element of the given array, 
# and $s1 stores the memory location of the first element of the new array.

 
addi $t0, $zero, 4          # t0 = 4 (counter for the loop)
Loop: beq $t0, $zero, Exit  # while t0 != 0
    lw $t1, 0($s0)          # t1 = s0[0]
    mult $t1, $t1           # mflo = t1 * t1
    mflo $t1                # t1 = mflo (move from lower)
    sw $t1, 0($s1)          # s1[0] = t1
   
    addi $s0, $s0, 4        # increment first array
    addi $s1, $s1, 4        # increment second array
   
    addi $t0, $t0, -1       # t0 -= 1
    j Loop                  # jump to Loop
Exit: