//instance variable
PImage img, img2; //initializes our image as a vairblae
int fadeAmount; //variable to determine how fast the image will fade
boolean fadeState; //false means fading in, true mean fading out

void setup() { //begin setup
  background(0);
  img = loadImage("ManuGinobli.jpg"); //loads image from memory
  img2 = loadImage("swish.jpg");
  size(img.width, img.height); //sets window plane to size of the image
  fadeAmount = 0;
  fadeState = false;
  //tint(200, 0, 0); //red tint
  //tint(255, 50); //transparent tint 
  //image(img, 0, 0); //draws image on the plane
} //setup


void draw() { //begin draw
  //background(0); //sets background to black each draw call
  tint(255, 255);
  image(img2, 0, 0);
  tint(255, fadeAmount); //sets transparency value
  image(img, 0, 0); //draws image each draw call
  fadeAmount++; //decrements our fade amount towards black
  
  if (fadeState == false) {
      fadeAmount++;
  } //if
  else {
    fadeAmount--;
  } //else
  
  if (fadeAmount == 255) { //begin if for switching images
    fadeState = true;
  } //if
  
  if (fadeAmount == 0) {//begin if
    fadeState = false;
  } //if
} //draw
