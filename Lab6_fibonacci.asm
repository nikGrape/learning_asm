# Write a program to populate an array with Fibonacci numbers. The Fibonacci sequence begins with 0 and then 1, each following number is the sum of the previous two numbers. Ex: 0, 1, 1, 2, 3, 5, 8, 13. Assume the size of the array is always at least 1. Use the '+' button under the Registers display to store the size of an integer array in $s0 and the address of the first element of the array in the memory in $s1.



# size: s0
# address: s1

addi $t0, $zero, 1 # coutner

addi $t1, $zero, 1 # prev
addi $t2, $zero, 1 # current
addi $t3, $zero, 1 # next

sw $zero, 0($s1)             # save zero number to address
sw $t1, 4($s1)               # save first number to address
addi $t4, $s1, 8             # increase address on 8 and save it to t1


# t0 - loop counter
# t1 - prev fibonacci number
# t2 - current fibonacci number
# t3 - next term
# t4 - current address in memory
Loop: beq $t0, $s0, Exit        # while (t0 != s0)
    sw $t3, 0($t4)              # save next_term to memory

    add $t1, $t2, $zero         # prev = current
    add $t2, $t3, $zero         # currnt = next_term
    add $t3, $t1, $t2           # next_term = prev + current

    addi $t0, $t0, 1             # loop counter += 1
    addi $t4, $t4, 4             # increase address on 4

    j Loop
Exit:
    
