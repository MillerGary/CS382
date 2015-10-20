//instance variables
PImage img;
double avg;
color darkBlue, red, lightBlue, yellow;
float[][] filter = {{1/9., 1/9., 1/9.},
                   {1/9., 1/9., 1/9.},
                   {1/9., 1/9., 1/9.}};;

void setup() {
  img = loadImage("ManuFade.jpg");
  size(img.width, img.height);
  image(img, 0, 0);
  
  darkBlue = color(0, 51, 76);
  red = color(217, 26, 33);
  lightBlue = color(112, 150, 158);
  yellow = color(252, 227, 166);
    
  loadPixels();
  
} //setup

  // calculates the color after applying the filter
  color convolution(int x, int y, float[][] matrix, PImage img) {
  int offset = floor(matrix.length/2);
  float r = 0.0, g = 0.0, b = 0.0;
  
   for (int i = 0; i < matrix.length; i++) {
    for (int j= 0; j < matrix[i].length; j++) {
      // Which neighbor are we using
      int newX = x+i-offset;
      int newY = y+j-offset;
      int idx = img.width*newY + newX;
      // Make sure we haven't walked off our image
      idx = constrain(idx, 0, img.pixels.length-1);
      // Calculate the convolution
      r += (red(img.pixels[idx]) * matrix[i][j]);
      g += (green(img.pixels[idx]) * matrix[i][j]);
      b += (blue(img.pixels[idx]) * matrix[i][j]);
    }
  return color(r, g, b);
   }

  for(int i = 0; i < pixels.length; i++) {
    color c = pixels[i];
    double avg = (red(c) + green(c) + blue(c)) / 3;
    if (avg < 64) { //begin for
      pixels[i] = color(darkBlue);
    } else if (avg < 128) {
      pixels[i] = color(red);
    } else if (avg < 192) {
      pixels[i] = color(lightBlue);
    } else {
      pixels[i] = color(yellow);
    } //if-else
  } //for
  
  updatePixels();

