# $a0 - $a3: four argument registers in which to pass parameters
# $v0 - $v1: two value registers in which to return values
# $ra: one return address register to return to the point of origin (jumps to the next instruction after calling instruction)

# $t0 - $t9: temporary registers that are not preserved by the callee (called procedure) on a procedure call
# $s0 - $s7: saved registers that must be preserved on a procedure call (if used, the callee saves and restores them)
# $sp - stack pointer register 
# $ra - return pointer register
# $fp - frame pointer (optional). Can be used to point to stack where more parameters are allocated

# note that $ra must be saved in the stack if a procedure calls another procedure and put the value back before terminating.

#        __________________________________________________
#       |       preserved       |      not preserved       |
#       |-----------------------+--------------------------|
#       | saved reg. $s0 - $s7  | temp. reg. $t0 - $t9     |
#       |-----------------------+--------------------------|
#       | stack pinter reg. $sp | arg. reg. $a0 - $a3      |
#       |-----------------------+--------------------------|
#       | return add reg. $ra   | retun value reg. v0 - v1 |
#       |__________________________________________________|



# Example
# C laguage
# int leaf_example (int g, int h, int i, int j)
# {
#       int f;
#    
#       f = (g + h) - (i + j);
#       return f;
# }

jal leaf_example           # call the procedure


leaf_example:              # the name of the procedure
    addi $sp, $sp, -12     # adjust stack to make room for 3 items
    sw $t1, 8($sp)         # save register $t1 for use afterwards
    sw $t0, 4($sp)         # save register $t0 for use afterwards 
    sw $s0, 0($sp)         # save register $s0 for use afterwards

    add $t0, $a0, $a1      # register $t0 contains g + h
    add $t1, $a2, $a3      # register $t1 contains i + j
    sub $s0, $t0, $t1      # f = $t0 - $t1, which is (g + h)-(i + j)

    # To return the value of f, we copy it into a return value register:

    add $v0, $s0, $zero    # returns f ($v0 = $s0 + 0)

    # Before returning, we restore the three old values of the registers we saved by "popping" them from the stack:

    lw $s0, 0($sp)         # restore register $s0 for caller
    lw $t0, 4($sp)         # restore register $t0 for caller
    lw $t1, 8($sp)         # restore register $t1 for caller
    addi $sp, $sp, 12      # adjust stack to delete 3 items

    # The procedure ends with a jump register using the return address:

    jr $ra                 # jump back to calling routine

    # ps: we didn't have to save $t registries to the stack



# Example 2. Compiling a recursive C procedure, showing nested procedure linking.
# Let's tackle a recursive procedure that calculates factorial:

# int fact (int n)
# {
#       if (n < 1) return (1);
#             else return (n * fact(n - 1));
# }

# What is the MIPS assembly code?

# Answer
# The parameter variable n corresponds to the argument register $a0. The compiled program starts with the label of the procedure and then saves two registers on the stack, the return address and $a0:

Fact:
addi  $sp, $sp, -8   # adjust stack for 2 items
      sw    $ra, 4($sp)    # save the return address
      sw    $a0, 0($sp)    # save the argument n

# The first time fact is called, sw saves an address in the program that called fact. The next two instructions test whether n is less than 1, going to L1 if n ≥ 1.

slti  $t0,$a0,1      # test for n < 1
beq   $t0,$zero,L1   # if n >= 1, go to L1

# If n is less than 1, fact returns 1 by putting 1 into a value register: it adds 1 to 0 and places that sum in $v0. It then pops the two saved values off the stack and jumps to the return address:

addi  $v0,$zero,1   # return 1
addi  $sp,$sp,8     # pop 2 items off stack
jr    $ra           # return to caller

# Before popping two items off the stack, we could have loaded $a0 and $ra. Since $a0 and $ra don't change when n is less than 1, we skip those instructions.

# If n is not less than 1, the argument n is decremented and then fact is called again with the decremented value:

L1: addi $a0,$a0,-1   # n >= 1: argument gets (n - 1)
    jal fact          # call fact with (n -1)

# The next instruction is where fact returns. Now the old return address and old argument are restored, along with the stack pointer:

lw   $a0, 0($sp)   # return from jal: restore argument n 
lw   $ra, 4($sp)   # restore the return address
addi $sp, $sp, 8   # adjust stack pointer to pop 2 items

# Next, the value register $v0 gets the product of old argument $a0 and the current value of the value register. We assume a multiply instruction is available, even though it is not covered until COD Chapter 3 (Arithmetic for Computers):

mul $v0, $a0, $v0   # return n * fact (n - 1)

# Finally, fact jumps again to the return address:

jr $ra              # return to the caller
