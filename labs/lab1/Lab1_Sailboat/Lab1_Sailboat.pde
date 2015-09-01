//intialize gloabl position variable
int boatXPOS, sailPOSX1, boatArcStart;

void setup() {
  size(640, 480); //set size of the plane
  boatXPOS = 160;
  sailPOSX1 = 40;
  boatArcStart = 0;
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
  fill(255, 255, 0); //sets color for sun
  ellipse(520, 80, 100, 100); //draws sun
  fill(255, 255, 255); //sets color of boat to white
  arc(boatXPOS, 300, 160, 120, 0, PI); //draws hall of the boat as an arc
  stroke(0); //makes stroke grey for the mast
  strokeWeight(2); //sets the strok weight to make line thicker
  line(boatXPOS, 300, boatXPOS, 150); //draws line used for mast
  noStroke(); //eliminates stroke again
  fill(255, 255, 255); //sets sail color to white
  triangle(sailPOSX1, 275, boatXPOS, 150, boatXPOS, 275); //draws sail as a triangle  
  boatXPOS++;
  sailPOSX1++;
} //draw  
