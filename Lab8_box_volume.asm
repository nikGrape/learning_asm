# Given the dimensions of a rectangular box, write a program to calculate 
# the volume of the box and store the result at memory address 4024.

# 4000: length
# 4008: width
# 4016: height

lw $a0, 4000($zero)
lw $a1, 4008($zero)
lw $a2, 4016($zero)

jal box_volume

sw $v0, 4024($zero)
j Exit

box_volume: # args: a0, a1, a2
    mult $a0, $a1           # (mflo, mfhi) = $a0 * $a1
    mflo $t0                # move result of multiplication to $t0

    mult $t0, $a2
    mflo $v0

    jr $ra                  # return

Exit: