public final class Matrix {
  //instance variables
  int rows, columns;
  float[][] values, matrixC;
  Matrix m1, m2, m3;
  float[][] zeros = {{0, 0, 0}, {0, 0, 0}, {0, 0, 0}};

  Matrix(int r, int c) { //initialize matrix of 0's
  //local variables
  int rows = r; //initialize number of rows locally
  int columns = c; //initialize number of columns locally
  values = new float[rows][columns]; //initializes a 2 dimensional array with 0's
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
 int rows = A.rows;
 int columns = A.columns;
 if (A.rows != B.rows || A.columns != B.columns) { //check for proper dimensions
   throw new RuntimeException("Can't add matrices of different dimesnions.");
 } //if exception
 else {
    //System.out.println("We made it this far"); //Debugging
   Matrix C = new Matrix(zeros);
   for(int i = 0; i < 3; i++) { //iterate through columns
     for(int j = 0; j < 3; j++) { //iterate through rows
       C.values[i][j] = A.values[i][j] + B.values[i][j]; //add matrices indexes
       System.out.print(" " +C.values[i][j]); //debugging
     } //inner for
     System.out.println();
   } //outter for
   System.out.println();
   //System.out.println("We made it here");
   return C;
 }//else debug
 } //addMatrices

  Matrix multiplyMatrices(Matrix m1, Matrix m2) {
    Matrix A = m1;
    Matrix B = m2;
    if (A.columns != B.rows) { //checking for proper dimensions
      throw new RuntimeException("Cannot multiply these dimensinos");
    }
    Matrix C = new Matrix(zeros);
    System.out.println("We made it this far");
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        for (int k = 0; k < 3; k++) {
          C.values[i][j] += (A.values[i][k] * B.values[j][k]);
          System.out.print(" " +C.values[i][j]);
        } //inside for
      } //middle for
      System.out.println();
    } //outside for
    //System.out.println("We made it here");
    return C;
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

    public static void main(String[] args) {
        int r = 3;
        int c = 3;
        Matrix m1, m2, m3;
        //float[][] values = new float[rows][columns];
        float[][] values = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};
        float[][] values1 = {{1, 1, 2}, {1, 1, 2}, {1, 1, 2}};
        float[][] zeros = {{0, 0, 0}, {0, 0, 0}, {0, 0, 0}};

        /*for (int i = 0; i < columns; i++) {
            for(int j = 0; j < rows; j++) {
            values[i][j] = values[i][j];
            } //inner for
        } //outter for*/
        //m1 = new Matrix(rows, columns);
        //m2 = new Matrix(rows, columns);
        m3 = new Matrix(3, 3);
        m1 = new Matrix(values);
        m2 = new Matrix(values1);
        m1.checkPrint(r, c);
        m2.checkPrint(r, c);
        m3.addMatrices(m1, m2);
        //m3.checkPrint(3, 3);
        m3.multiplyMatrices(m1, m2);
        //m3.checkPrint(rows, columns);
        //System.out.println("Debugging");
    }//end main void
}//Matrix class
