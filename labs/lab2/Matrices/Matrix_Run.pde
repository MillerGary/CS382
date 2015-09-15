final int rows = 3;
final int columns = 3;
Matrix m1, m2, m3;
//float[][] values = new float[rows][columns];
float[][] values = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};
float[][] values1 = {{1, 1, 1}, {1, 1, 1}, {1, 1, 1}};
float[][] zeros = {{0, 0, 0}, {0, 0, 0}, {0, 0, 0}};

void setup() {
  size(720, 480);
  background(0);
  for (int i = 0; i < columns; i++) {
    for(int j = 0; j < rows; j++) {
      values[i][j] = values[i][j];
    } //inner for
  } //outter for
  m1 = new Matrix(rows, columns);
  m2 = new Matrix(rows, columns);
  m3 = new Matrix(rows, columns);
  m1 = new Matrix(values);
  m2 = new Matrix(values1);
  m3 = new Matrix(zeros);
  m1.checkPrint(rows, columns);
  m2.checkPrint(rows, columns);
  m3.addMatrices(m1, m2);
  m3.checkPrint(rows, columns);
  m3.multiplyMatrices(m1, m2);
  m3.checkPrint(rows, columns);
  System.out.println("Debugging");
} //setup

void draw() {
background(0);  
}//draw
