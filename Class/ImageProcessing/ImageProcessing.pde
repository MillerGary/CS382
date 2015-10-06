//instance variables
PImage img, img2;
color[][] tempTwoD;

void setup() {
  background(0);
  img = loadImage("lunar.jpg");
  img2 = createImage((int)(img.width/2), (int)(img.height/2), RGB);
  size(img.width, (int)(img.height * 1.5));

  
} //setup


void draw() {
  image(img, 0, 0);
  image(img2, 0, img.height);
  //image(img, 0, img.height, img.width/2, img.height/2);
  //image(img, x, y, width, height);
  
  img.loadPixels();
  tempTwoD = convertTo2d(pixels, img.width, img.height);
  
} //draw

color[][] convertTo2d(color[] oneD, int w, int h) {
  color[][] twoD = new color[w][h];
  int row = 0, col = 0;
  
  for (int i = 0; i < oneD.length; i++) {
    twoD[row][col] = oneD[i];
    col++;
    if (col > w) {
      col = 0;
      row++;
    } //if
  } //for
  
  return twoD;
} //convertTo2D
