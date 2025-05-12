# Write a program to populate an array with Fibonacci numbers. The Fibonacci sequence begins with 0 and then 1, each following number is the sum of the previous two numbers. Ex: 0, 1, 1, 2, 3, 5, 8, 13. Assume the size of the array is always at least 1. Use the '+' button under the Registers display to store the size of an integer array in $s0 and the address of the first element of the array in the memory in $s1.



# size: s0
# address: s1

addi $t0, $zero, 0
addi $t1, $zero, 1
add $t2, $zero, $s1

# t0 - loop counter
# t1 - current fibonacci number
# t2 - current address in memory
Loop: beq $t0, $s0, Exit        # while (t0 != s0)
    sw $t1, 0($t2)              # save t1 to memory
    add
    j Loop
Exit:
    
