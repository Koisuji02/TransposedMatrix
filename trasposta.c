//! Calculate transposed matrix of a generic 2D matrix.

#include <stdio.h>

void transpose_function(int matrix[][3], int row, int col, int transposed[][3]) {
    // Create the space for the transposed matrix (full of zeros)
    for (int i = 0; i < col; i++) {
        for (int j = 0; j < col; j++) {
            transposed[i][j] = 0;
        }
    }

    // Insert the values in the transposed matrix
    for (int i = 0; i < row; i++) {
        for (int j = 0; j < col; j++) {
            transposed[j][i] = matrix[i][j]; // transposed has rows and columns inverted
        }
    }
}

int main() {
    int matrix[3][3] = {
        {1, 2, 3},
        {4, 5, 6},
        {7, 8, 9}
    };
    int transposed_matrix[3][3];

    int row = 3; // Number of rows
    int col = 3; // Number of columns

    // Calculate transposed matrix
    transpose_function(matrix, row, col, transposed_matrix);

    // Print transposed matrix
    printf("Transposed matrix:\n");
    for (int i = 0; i < col; i++) {
        for (int j = 0; j < row; j++) {
            printf("%d ", transposed_matrix[i][j]);
        }
        printf("\n");
    }

    return 0;
}
