# $s0	A
# $s1	B
# $s2	C
# $s3	D
# $s4	Z
# do without sub command
# Z = ( A + B ) * ( C - D ) 

add $s0, $s0, $s1 # A + B 

# samse as sub $s1, $s2, $s3
nor $s3, $s3, $zero # negate all bits in D
addi $s3, $s3, 1    # add one to get -D
add $s1, $s2, $s3   # C + (-D)

mult $s0, $s1       # (mflo, mfhi) = $s0 * $s1
mflo $s4            # move result of multiplication to $s4