PImage img;

void setup() {
  img = loadImage("ManuGinobli.jpg");
  size(img.width, img.height);
  image(img, 0, 0);
  image(img, 0, img.height);
} //setup


void draw() { 
  loadPixels();
  
  for (int i = 0; i < pixels.length; i++) { //begin for
    color c = pixels[i];
    if (i < pixels.length/2) {
      pixels[i] = color(red(c)-1, green(c)-1, blue(c)-1);
    } //if
    else {
      pixels[i] =  color(red(c)*0.99, green(c)*0.99, blue(c)*0.99);
    } //else
  } //for
  
  updatePixels();  
} //draw
