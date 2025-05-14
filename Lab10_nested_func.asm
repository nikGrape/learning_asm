# Given the following C program and the mapping of registers to variables, complete the MIPS implementation of procedure Sum.
# int Dif(int a, int b) {
#    return b - a;
# }
# 
# int Sum(int m, int n) {
#    int p = Dif(n+1, m-1);
#    int q = Dif(m+1, n-1);
#    return p + q;
# }
# 
# int main() {
#    int x, y;
#    z = x + y + Sum(x, y);
#    return 0;
# }

# $s0	x
# $s1	y
# $s2	z

addi $sp, $zero, 6000   # Assume Stack memory starts at 6000. Do not modify.

# Procedure Main (Do not modify)
Main:
      add $a0, $zero, $s0
      add $a1, $zero, $s1
      
      jal Sum
      
      add $s2, $s0, $s1
      add $s2, $s2, $v0
      
      j End

# Procedure Sum
Sum: # args: a0:m, a1:n
      # Type your code here.
# ------------------ Stack ops ------------------------------
      addi $sp, $sp, -12       # make room in the stack for 1 item
      sw $ra, 8($sp)           # save return address to the stack
      sw $a0, 4($sp)           # save initial args
      sw $a1, 0($sp)           # save initial args
# -----------------------------------------------------------
      
      # int p = Dif(n+1, m-1);
      addi $t0, $a1, 1         # t0 = n+1
      addi $t1, $a0, -1        # t1 = m-1
      add $a0, $t0, $zero      # set up args for Dif
      add $a1, $t1, $zero      # set up args for Dif

      jal Dif                  # v0 = Dif(a0, a1)
      add $t0, $v0, $zero      # save retruned value to t1 (t1 = v0)

# ------------------ Stack ops ------------------------------
      lw $a0, 4($sp)           # restore original a0 value
      lw $a1, 0($sp)           # restore original a1 value
# -----------------------------------------------------------

      # int q = Dif(m+1, n-1);
      addi $a0, $a0, 1         # a0 = m+1 (first param)
      addi $a1, $a1, -1        # a1 = n-1 (second param)
      jal Dif                  # v0 = Dif (a0, a1)

      add $v0, $v0, $t0        # v0 = p + q;

# ------------------ Stack ops ------------------------------
      lw $ra, 8($sp)           # load return address form stack
      addi $sp, $sp, 12        # srink the stack back to original size
# -----------------------------------------------------------

      jr $ra                   # return v0

# Procedure Dif (Do not modify)
Dif:
      sub $v0, $a1, $a0
      jr $ra

End:
