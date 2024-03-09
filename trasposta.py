#! Calculate transposed matrix of a generic 2D matrix.

def transpose_function (matrix):
    row = len (matrix)                                  # Number of rows
    col = len (matrix[0])                               # Number of columns
    
    # Create the space for the transposed matrix (full of zeros)
    transposed = []
    for i in range (col):
        transposed_row = [0] * col
        transposed.append (transposed_row)
    
    # Insert the values in the transposed matrix
    for i in range (row):
        for j in range (col):
            transposed[j][i] = matrix[i][j]             # transposed has rows and columns inverted
    
    return transposed



def main ():

    matrix = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9]
    ]

    transposed_matrix = transpose_function (matrix)

    # Print transposed matrix
    print ("Transposed matrix:\n")
    for row in transposed_matrix:
        print (row)
    
    return 0

if __name__ == "__main__":
    main()