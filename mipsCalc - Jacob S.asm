# Author: Santora, Jacob
# Course: COMP B13, Fall 2022 
# Instructor: Richard Miles
# Assignment: Calculator Project
# Date submitted: 2022/11/30


# This calculator is intented to compute two integers into the following operations,
# Addition, Subtraction, Multiplication, Square, and Cube in that order,
# displaying each output in Data Memory Address (5000) simultaneosuly while recording
# each answer value in Data Memory (8180-8196) for reference.
# Input your integers into Data Memory x (5004) and y (5008).
# NOTE: 5.1.1 Terminal was used to create this program.

main:
   addi $t4, $zero, 5000 # z
   addi $t5, $zero, 5004 # x
   addi $t6, $zero, 5008 # y

   lw $t1, 0($t5)     # Load DM[5004] x
   lw $t2, 0($t6)     # Load DM[5008] y
   j add
   
# Addition operation and stores answer in assigned Data Memories.
add:
   add $t3, $t1, $t2
   sw $t3, 0($t4)
   sw $t3, 3180($t4)
   j sub
   
# Subtraction operation and stores answer in assigned Data Memories. 
sub:
   sub $t3, $t1, $t2
   sw $t3, 0($t4)
   sw $t3, 3184($t4)
   j mult
   
# Multipilcation operation and stores answer in assigned Data Memories. 
mult:
   mul $t3, $t1, $t2
   sw $t3, 0($t4)
   sw $t3, 3188($t4)
   j square
   
# Square operation of x operand and stores answer in assigned Data Memories. 
square:
   mul $t3, $t1, $t1
   sw $t3, 0($t4)
   sw $t3, 3192($t4)
   j cube
   
# Cube operation of x operand and stores answer in assigned Data Memories. 
cube:
   mul $t3, $t1, $t1
   mul $t3, $t3, $t1
   sw $t3, 0($t4)
   sw $t3, 3196($t4)
   j done
   
# End of Program.
done: