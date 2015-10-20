//instance variables

void setup() { //setup
  size(720, 400);
  noStroke();
  colorMode(HSB, 360, 100, 100);
  
  for (int i = 0; i < width; i += 2) { //for
    fill(i/2, 100, 100);
    rect(i, 0, 2, height);
    fill(i/2, 100, 100);
    rect(i, height/2, 2, height/2);
  } //for

} //setup


void draw() { //draw


} //draw
