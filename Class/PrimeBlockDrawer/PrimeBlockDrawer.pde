float rows, cols;
float rowWidth, colWidth;
float numBlocks;
int i;

void setup() {
  size(800, 600);
  rows = 90;
  cols = 120;
  i = 2;
  rowWidth = height/rows;
  colWidth = width/cols;
  numBlocks = rows * cols;
} //setup

void draw() {
  boolean prime;
  for (int j = 0; j < rows; j++) {
    for (int k = 0; k < cols; k++) {
      prime = isPrime(i);
      if (prime) { //draw red
        fill(255, 0, 0);
        stroke(255, 0, 0);
      }
      else { //draw nlue
        fill(0, 0, 255);
        stroke(0, 0, 255);
      } //if-else
      drawBlock(j, k, i); //j = row number, k = collumn number
      i++;
    } //for
  } //for
  i = 2;
} //draw

//TODO determine if a number is prime
boolean isPrime(int num) {
  for (int m = 2; m <= sqrt(num); m++) {
    if (num  % m == 0) {
      return false;
    } //if
    } //for
    return true;
} //isPrime


//TODO draw a block
void drawBlock(float row, float col, int num) {
  float x, y;
  x = col * colWidth;
  y = row * rowWidth;  
  rect(x, y, colWidth, rowWidth);
  /*fill(0);
  /text(num, x, y + rowWidth);*/ //debuggin to check if number are correct  
} //drawBlock
