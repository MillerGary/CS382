//instance variables
PImage img;

void setup() { //begin setup
  frameRate(10);
  img = loadImage("ManuFade.jpg");
  size(img.width, img.height);
  image(img, 0, 0);
} //setup


void draw() { //begin draw
  loadPixels();
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      int newX = (int)random(x-1, x+2);
      int newY = (int)random(y-1, y+2);
      newX = constrain(newX, 0, width-1);
      newY = constrain(newY, 0, height-1);
      pixels[y*width+x] = pixels[newY*width+newX];
    } //inner for
  } //outter for
  updatePixels();
} //draw
