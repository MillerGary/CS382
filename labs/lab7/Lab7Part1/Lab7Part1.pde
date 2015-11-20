//instance variables
PImage img;

void setup() {
  colorMode(HSB, 360, 100, 100); //set color mode
  
  img = loadImage("lab7part1.png"); //load image
  size(img.width, img.height); //set height and width
    
  image(img, 0, 0); //draw the image
  
  noStroke(); //makes no outline
  loadPixels(); //load pixels of the image
  
  for (int i = 0; i < pixels.length; i++) { //loop through pixels
    float hue = hue(pixels[i]);; //value for hue of current pixel
    float sat = saturation(pixels[i]); //value for saturation of current pixel
    float val = brightness(pixels[i]); //value for brightnes of current pixel
   
    pixels[i] = color(hue, sat -50, val); //Desaturate all pixels by 50
  } //for      
    
  img.updatePixels(); //update the pixel
} //setup


  


