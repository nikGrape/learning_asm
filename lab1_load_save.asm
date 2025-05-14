# The assignment is to load the value of variable X from a memory location and save the value in variable Y. 
# Assume the value of X is stored at memory address 4000, the value of Y is stored at
# memory address 4004, and registers $s0 and $s1 contain the memory 
# addresses 4000 and 4004:


lw $t0, 0($s0)  # $t0 = X = memory[4000]
sw $t0, 0($s1)  # Y = memory[4004] = $t0