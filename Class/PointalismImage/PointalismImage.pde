//instance variables
PImage img; //intialize our image into a variable

void setup() { //begin setup
  //frameRate(1000);
  img = loadImage("ManuGinobli.jpg"); //loads image from memory
  size(img.width, img.height); //sets window plane to size of image
  image(img, 0, 0); //draws our image on the plane
  loadPixels();
  
  for (int i = 0; i < 10000; i++) { //begin for
    addPoint();
  }//for
} //setup

void draw() { //begin draw
  addPoint();
} //draw


void addPoint() { //begin addPoint
  int x = (int)random(width); //randomly selects an x location
  int y = (int)random(height); //randomly selects a y location
  color c = pixels[width*y + x]; //coor of the random pixel
  fill(c); //fills to color of pixel
  ellipse(x, y, 4, 4);
} //adPoint
