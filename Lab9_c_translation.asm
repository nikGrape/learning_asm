# Impliment main in MIPS

# int Dif(int a, int b){
#    return a - b;
# }
# 
# int Sum(int a, int b){
#    return a + b;
# }
# 
# int main(){
#    int x, y;
#    w = Sum(x, y);
#    z = Dif(y, x);
#    return 0;   // Do not implement
# }

# $s0	x
# $s1	y
# $s2	w
# $s3	z
Main:
    # Type your code here.
    add $a0, $s1, $zero
    add $a1, $s0, $zero 
    
    jal Sum             # Sum(a0, a1)
    add $s2, $v0, $zero

    jal Dif             # Dif(a0, a1)
    add $s3, $v0, $zero
           
    j End

# Procedure Sum (Do not modify)
Sum:
      add $v0, $a0, $a1
      jr $ra

# Procedure Dif (Do not modify)
Dif:
      sub $v0, $a0, $a1
      jr $ra

End: