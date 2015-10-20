//instance variables
PImage img;
double threshold;
boolean rising;

void setup() {
  img = loadImage("ManuFade.jpg");
  size(img.width, img.height);
  threshold = 128;
  rising = true;
} //setup


void draw() {
  image(img, 0, 0);
  loadPixels();

  for(int i = 0; i < pixels.length; i++) {
    color c = pixels[i];
    double avg = (red(c) + green(c) + blue(c)) / 3;
    if (avg >= threshold) { //begin for
      pixels[i] = color(255);
    } else {
      pixels[i] = color(0);
    } //if-else
  } //for
  
  updatePixels();

  if (threshold == 265) {
    rising = false;
  } else if (threshold == -10) {
    rising = true;
  } //if-else

  if (rising ==true) {
    threshold++;
  } else {
    threshold--;
  } //if-else  
} //draw
