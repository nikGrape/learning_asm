# Given an integer N stored at memory address 5000, 
# write a program that stores the result of N x 8 at memory address 5004 
# and the result of N/16 at memory address 5008.


lw $a0, 5000($zero)     # inittialize arg from memory

jal mult_by_8           # call the procedure
sw $v1, 5004($zero)     # save result to memory

jal div_by_16           # call the procedure
sw $v1, 5008($zero)     # save result to memory

j Exit                  # end the script

mult_by_8:              # args: a0
    sll $v1, $a0, 3     # v1 = a0 << 3 (v1 = a0 * 8) ps:(8 = 2^3)
    jr $ra              # return v1


div_by_16:              # args: a0
    srl $v1, $a0, 4     # v1 = a0 >> 4 (v1 = a0/16) ps:(16 = 2^4)
    jr $ra              # return v1

Exit: