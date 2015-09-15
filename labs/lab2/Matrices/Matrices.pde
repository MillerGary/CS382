class Matrix {
  //instance variables
  int rows, columns; 
  float[][] values, matrixC;
  Matrix m1, m2, m3;
  
  Matrix(int rows, int columns) { //initialize matrix of 0's
  //local variables
  int r = rows; //initialize number of rows locally
  int c = columns; //initialize number of columns locally
  values = new float[r][c]; //initializes a 2 dimensional array with 0's
  } //Matrix(int rows, int columns)
 
 Matrix(float[][] values) { //initialize matrix from a 2 dimensional array
   int rows = values.length; //sets r = to number of rows in the array parameter
   int columns = values[0].length; //sets c = to number of columns in the array parameter
   this.values = new float[rows][columns]; //initalizes Matrix array
   for (int i = 0; i < columns; i++) { //iterates through number of columns
    for (int j = 0; j < rows; j++) { //iterates through number of rows
     this.values[i][j] = values[i][j]; //sets Matrix array = to input array iteratively
    } //inner for
   } //outer for
 } //Matrix(float[][] values)
 
 Matrix (Matrix m1) { //copy constructor
   this(m1.values);
 }
 
 Matrix addMatrices(Matrix m1, Matrix m2) { //begin addMatrices A + B = C
 Matrix A = m1;
 Matrix B = m2;
 if (A.rows != B.rows || A.columns != B.columns) { //check for proper dimensions
   throw new RuntimeException("Can't add matrices of different dimesnions.");
 } //if exception
 else {
   Matrix C = new Matrix(A.rows, A.columns);
   for(int i = 0; i < 3; i++) { //iterate through columns
     for(int j = 0; j < 3; j++) { //iterate through rows
       C.values[i][j] = A.values[i][j] + B.values[i][j]; //add matrices indexes
       System.out.println("We made it here");
       //System.out.print(" " +C.values[i][j]); //debugging
       //C.checkPrint(C.rows, C.columns);
     } //inner for
   } //outter for
   for (int k = 0; k < C.rows; k++) {
     for (int m = 0; m < C.columns; m++) {
       System.out.print(" " +C.values[k][m]);
     } //inner for
   } //outter for
   System.out.println();
   return C; 
 }//else debug   
 } //addMatrices

  void multiplyMatrices(Matrix m1, Matrix m2) {
    Matrix A = m1;
    Matrix B = m2;
    if (A.columns != B.rows) { //checking for proper dimensions
      throw new RuntimeException("Cannot multiply these dimensinos");
    }
    Matrix C = new Matrix(A.columns, B.rows);
    for (int i = 0; i < C.rows; i++) {
      for (int j = 0; j < C.columns; j++) {
        for (int k = 0; k < A.columns; k++) {
          C.values[i][j] += (A.values[i][k] * B.values[k][j]);
        } //inside for
      } //middle for
    } //outside for
  } //multiplyMatrices 

  //method to check array is properly set up by printing to the console
  void checkPrint(int rows, int columns) { 
    int r = rows; //sets r = to number of rows in matrix
    int c = columns; //sets c = to number of columns in matrix
    for (int i = 0; i < r; i++) { //iterates trhough number of rows
      for (int j = 0; j < c; j++) { //iterates through number of columns
      System.out.print(" " +values[i][j]); //prints current index to the console
      } //inner for
    System.out.println(); //prints newline for new row of indexes
    }// outter for
  System.out.println(); //prints newline inbetween matrix and next console output
  } //print  
} //Matrix Class
