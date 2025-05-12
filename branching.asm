bne $s3, $s4, Else  # go to Else if i ≠ j

add $s0, $s1, $s2   # f = g + h (skipped if i ≠ j)

j Exit              # jump to Exit

Else: sub $s0, $s1, $s2 # f = g - h (skipped if i == j)

Exit:
