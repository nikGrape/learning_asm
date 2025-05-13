# Write a program to populate an array with Fibonacci numbers. 
# Ex: 0, 1, 1, 2, 3, 5, 8, 13. 
# Assume the size of the array is always at least 1.
# The size of an integer array in $s0 and 
# the address of the first element of the array in the memory in $s1.



# size: $s0
# memory address: $s1
addi $t0, $zero, 1          # coutner
addi $t1, $zero, 1          # prev
addi $t2, $zero, 1          # current
addi $t3, $zero, 1          # next

sw $zero, 0($s1)            # save first term to memory
beq $s0, $t1, Exit          # if size == 1 end the program

sw $t1, 4($s1)              # save second term to memory
addi $t4, $s1, 8            # increase address on 8 and save it to t1


# t0 - loop counter
# t1 - prev term
# t2 - current term
# t3 - next term
# t4 - current address in memory

Loop: beq $t0, $s0, Exit        # while (t0 != s0)
    sw $t3, 0($t4)              # save next_term to memory

    add $t1, $t2, $zero         # prev = current
    add $t2, $t3, $zero         # currnt = next_term
    add $t3, $t1, $t2           # next_term = prev + current

    addi $t0, $t0, 1            # loop counter += 1
    addi $t4, $t4, 4            # increase address on 4

    j Loop
Exit:
    
