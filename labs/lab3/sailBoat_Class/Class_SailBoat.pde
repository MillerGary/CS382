//initialize instance variables
int boatXPOS, sailXPOS, boatArcStart;

class sailBoat { //begin class sailBoat
  sailBoat(int boatX, int sailX) { //initialize sailBoat object
    boatXPOS = boatX;
    sailXPOS  = sailX;   
  }//Boat
  
  void drawBoat() {
  pushMatrix();
  translate(boatXPOS, sailXPOS); //translates boat shape
  rotate(PI/24); //rotates sail boat to simulate heeling from the wind
  fill(255, 255, 255); //sets color of boat to white
  arc(boatXPOS, 300, 160, 120, 0, PI); //draws hall of the boat as an arc
  stroke(0); //makes stroke grey for the mast
  strokeWeight(2); //sets the strok weight to make line thicker
  line(boatXPOS, 300, boatXPOS, 150); //draws line used for mast
  noStroke(); //eliminates stroke again
  fill(255, 255, 255); //sets sail color to white
  triangle(sailXPOS, 275, boatXPOS, 150, boatXPOS, 275); //draws sail as a triangle
  popMatrix();
  }///drawBoat
  
  void sail() {
    boatXPOS++; //incrementes the x position of the boat
    sailXPOS++; //increments the x position for the sail
  } //sail
} //class
