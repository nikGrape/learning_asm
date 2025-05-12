# MIPS compilers use the slt, slti, beq, bne, and the fixed value of 0 (always available by reading register $zero) to create all relative conditions: equal, not equal, less than, less than or equal, greater than, greater than or equal.


# slt means set (to 1) on less than 
# or zero otherwise
slt  $t0, $s3, $s4   # $t0 = 1 if $s3 < $s4, or zero otherwise
slti $t0, $s2, 10    # $t0 = 1 if $s2 < 10
beq $s0 $s1 Exit     # if $s0 == $s1 jump to Exit
bne $s0 $s1 Exit     # if $s0 != $s1 jump to Exit


# for unsigned integers 
sltu  $t0, $s3, $s4  # $t0 = 1 if $s3 < $s4
sltiu $t0, $s2, 10        # $t0 = 1 if $s2 < 10
 

# Example: Signed versus unsigned comparison.
# Suppose register $s0 has the binary number
# 
# 1111 1111 1111 1111 1111 1111 1111 1111two
# 
# and that register $s1 has the binary number
# 
# 0000 0000 0000 0000 0000 0000 0000 0001two
# 
# What are the values of registers $t0 and $t1 after these two # instructions?
# 
# slt   $t0, $s0, $s1   # signed comparison
# sltu  $t1, $s0, $s1   # unsigned comparison
# 
# Answer
# The value in register $s0 represents −1ten if it is an integer and 
# 4,294,967,295ten if it is an unsigned integer. The value in 
# register $s1 represents 1ten in either case. Then register $t0 has 
# the value 1, since −1ten < 1ten, and register $t1 has the value 0, 
# because 4,294,967,295ten > 1ten.

# Example 2:
# Use this shortcut to reduce an index-out-of-bounds check: jump to IndexOutOfBounds if $s1 ≥ $t2 or if $s1 is negative.

# Answer
# The checking code just uses u to do both checks:

# sltu $t0, $s1, $t2                  # $t0 = 0 if $s1 >= length or $s1 < 0
# beq  $t0, $zero, IndexOutOfBounds   # if bad, goto Error

# ps: if s1 is negative it is treatead as a very large unsigned integer by sltu