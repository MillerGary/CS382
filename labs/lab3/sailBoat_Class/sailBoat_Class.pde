//intialize gloabl position variable
int boatX, sailX, boatCen, mastLen;
int hallWid, hallHigh, triBot, triTop;
SailBoat boat;

void setup() {
  size(640, 480); //set size of the plane
  boatX = 160;
  sailX = 40;
  boatCen = 300;
  mastLen = 150;
  hallWid = 160;
  hallHigh = 120;
  triBot = 275;
  triTop = 150;
  boat = new SailBoat(boatX, sailX, boatCen, mastLen, hallWid, hallHigh, triBot, triTop);
  /*boat = new SailBoat(160, 40, 300, 150, 160, 120, 275, 150); //initialize boat object*/
  //boat.drawBoat();
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
  boat.sail();
} //draw  
