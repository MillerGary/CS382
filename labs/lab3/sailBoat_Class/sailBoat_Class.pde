sailBoat boat;
Sun sun;
void setup() {
  size(640, 480); //set size of the plane
  boatXPOS = 160;
  sailXPOS = 40;
  boatArcStart = 0;
  sunXPOS = 500;
  sunYPOS = 0;
  boat = new sailBoat(boatXPOS, sailXPOS);
  sun = new Sun(sunXPOS, sunYPOS);
} //setup

void draw() {
  background(0, 0, 255); //set background used for color of water
  fill(100, 120, 255); //sets fill used for top of skyline
  noStroke(); //makes no outline around rectangle
  rect(0, 0, 640, 80); //draws rectangle used as the sky
  fill(100, 140, 255); //sets lighter color in skyline
  rect(0, 80, 640, 80); //draws lighter skyline color
  fill(100, 160, 255); //sets lighter color in skyline
  rect(0, 160, 640, 80); //draws next lihgter color in skyline
  fill(120, 180, 255); //sets lightest color in skyline
  rect(0, 240, 640, 80); //draws lightest color in skyline
  boat.drawBoat();
  sun.drawSun();
  boat.sail();  
  sun.sunSet();
  if (count > 701) {
    sun.drawMoon();
    sun.moonRise();
  } //if moon check
} //draw  
