PImage img, img2; //initialize a variable to import an image from the data directory
PFont font; //imports a font from the data directory

void setup() { //begin setup function
  //size(500, 500);
  img = loadImage("lunar.jpg"); //loads image into a variable
  img2 = loadImage("lunar.jpg"); //loads image into a second variable
  size(img.width, img.height * 2); //sets size to size of the image
  
  image(img, 0, 0); //image(image variable, posX, posY, width, height); width an height are optional
  image(img2, 0, img.height); //drawing our second imag directly under the first one
  
  loadPixels(); //function that loads all of the pixels in our initialized image
  
  int size = img.width * img.height; //gives us the toal numbe of pixels in our image
  
  for (int i = 0; i < pixels.length; i++) { //iterate through pixels
    if (i >= size) {
      color c = pixels[i]; //sets current pixel to a variable c
      float colorRed = red(c); //gets red color value of current pixel
      float colorGreen = green(c); //gets green color value of current pixel
      float colorBlue = blue(c); //gets blue coor value of current pixel
      /*series of filers to choose from, just uncomment desired filter*/
      //pixels[i] = color(((1.0/3.0) * colorRed) + ((1.0/3.0) * colorGreen) + ((1.0/3.0) * colorBlue)); //casts geyscale values from RGB to a single greyscale value
      //pixels[i] = color(((1.0) * colorRed) + ((0.0) * colorGreen) + ((0.0) * colorBlue)); //casts geyscale values from RGB to a single greyscale value
      pixels[i] = color(255 - colorRed, 255 - colorGreen, 255 - colorBlue); //casts grayscale value of RGB into a negatvie color value
      //pixels[i] = color(colorRed, 0, 0); //sets pixels to all red values
      //pixels[i] = color(0, colorGreen, 0); //sets pixels to all green values
      //pixels[i] = color(colorRed, colorGreen, 0); //sets pixels to red and green to make a yellow image
      //pixels[i] = color(1/colorBlue + colorGreen * colorGreen, colorRed * colorGreen / colorBlue, 255 - colorRed); //sets pixels to BRG value
      //System.out.println(colorRed+ ", " +colorGreen+ ", " +colorBlue); //debugging to see greyscale value
    } //if
  } // for
 
  updatePixels();
  
  font = loadFont("AbyssinicaSIL-48.vlw"); //loads front into a variable
  textFont(font); //method to utilize loaded font
    
} //setup


void draw() { //begin draw function
  //background(0); //set background to black
  textSize(18); //sets text size to parameter
  text("Neil Armstrong Cruisin'", 10, 20); //text("what I want to type", posX, posY);
} //draw
