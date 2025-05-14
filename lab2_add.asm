# Calculate:
# Z = A + B - C - D
# A = $s0
# B = $s1
# C = $s2
# D = $s3
# Z = $s4

add $t0, $s0, $s1
sub $t0, $t0, $s2
sub $s4, $t0, $s3