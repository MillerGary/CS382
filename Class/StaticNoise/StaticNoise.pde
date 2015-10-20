//instance variables

void setup() { //begin setup
  size(800, 600); //sets size of plane
} //setup


void draw() { //bgin draw
  loadPixels(); //loads our pixels from memory
  
  for (int i = 0; i < pixels.length; i++) { //begin for loop
    float gray = random(0, 255); //random gray value
    float r = random(0, 255); //random red value
    float g = random(0, 255); //random green value
    float b = random(0, 255); //random blue value

    pixels[i] = color(r, g, b); //sets pixel i to a random clor
  } //for
  
  updatePixels(); //update pixels new value
} //draw
