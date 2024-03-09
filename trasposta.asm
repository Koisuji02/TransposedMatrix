#! Calculate transposed matrix of a generic 2D matrix.

                        .data
ROW = 3
COL = 4

matrix:                 .word 126, -988, 65, 24
                        .word 7, 0, 2, 32
                        .word 66, 532, 43, 88

transposed_matrix:      .space ROW * COL * 4                # word dimension = 4 byte
                        
                        .text
                        .globl main
                        .ent main

main:                   subu $sp, $sp, 4                    # create the space in the stack
                        sw $ra, ($sp)                       # save the return address ($ra) in the stack
                        la $a0, matrix                      # $a0 = matrix address
                        la $a1, transposed_matrix           # $a1 = transposed matrix address
                        li $a2, ROW                         # $a2 = ROW
                        li $a3, COL                         # $a3 = COL
                        jal transposeFunction               # jump to transposeFunction
                        lw $ra, ($sp)                       # return from the transposeFunction and re-establish the return address from the stack
                        addiu $sp, $sp, 4                   # remove the space in the stack of the $ra
                        jr $ra                              # end of the program

transposeFunction:      move $t0, $0                        # $t0 = counter of rows
                        move $t1, $0                        # $t1 = counter of columns
                        move $t2, $a0                       # $t2 = tmp address of matrix

loop_end:               beq $t1, $a3, end                   # if $t0 = $t1, matrix terminated
                        beq $t0, $a2, loop_update           # if $t1 = ROW, rows terminated -> move to the next column
                        lw $t3, ($t2)                       # $t3 = current element of matrix
                        sw $t3, ($a1)                       # put $t3 in transposed_matrix
                        sll $t4, $a3, 2                     # $t4 = increment to the next row (COL * 4)
                        add $t2, $t2, $t4                   # tmp matrix address += COL * 4 (word)
                        addi $a1, $a1, 4                    # transposed_matrix address += 4 (next word)
                        addi $t0, $t0, 1                    # row++
                        j loop_end

loop_update:            addi $t1, $t1, 1                    # col++
                        move $t0, $0                        # reset $t0
                        addi $t2, $a0, 4                    # next column of matrix
                        j loop_end

end:                    jr $ra
                        .end transposeFunction

