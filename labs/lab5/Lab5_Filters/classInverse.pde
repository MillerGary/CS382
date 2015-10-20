//instance variables
PImage inverseImg;
int x, y;
class inverse {
  inverse(PImage inverseImage, int posX, int posY) { //inialize image to inverse
    inverseImg = inverseImage;
    x = posX;
    y = posY;
  } //inverse constructor    

  
  void inversePixels() {
    loadPixels();
    for (int i = 0; i < pixels.length; i++) {
      color c = pixels[i];
      float colorRed = red(c);
      float colorGreen = green(c);
      float colorBlue = blue(c);
      pixels[i] = color(255-colorRed, 255-colorGreen, 255-colorBlue);
    } //for
    updatePixels();
    
    image(inverseImg, x, y);
  } //inversePixels    
} //inverse class
