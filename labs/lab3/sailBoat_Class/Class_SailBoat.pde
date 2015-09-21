class SailBoat {
  int boatXPOS, sailXPOS, boatCenter, mastLength;
  int hallWidth, hallHeight, triangleBottom, triangleTop;
  
  SailBoat(int boatX, int sailX, int boatCen, int mastLen, int hallWid, int hallHigh, int triBot, int triTop) {
  int boatXPOS = boatX;
  int sailXPOS = sailX;
  int boatCenter = boatCen;
  int mastLength = mastLen;
  int hallWidth = hallWid;
  int hallHeight = hallHigh;
  int triangleBottom = triBot;
  int triangleTop = triTop;
  }//sailBoat
  
  void drawBoat() {
  fill(255, 255, 255); //sets color of boat to white
  /*arc(boatXPOS, 300, 160, 120, 0, PI); //draws hall of the boat as an arc*/
  arc(boatXPOS, boatCenter, hallWidth, hallHeight, 0, PI); //draws hall of the boat as an arc
  stroke(0); //makes stroke grey for the mast
  strokeWeight(2); //sets the strok weight to make line thicker
  /*line(boatXPOS, 300, boatXPOS, 150); //draws line used for mast*/
  line(boatXPOS, boatCenter, boatXPOS, mastLength); //draws line used for mast
  noStroke(); //eliminates stroke again
  fill(255, 255, 255); //sets sail color to white
  /*  triangle(sailXPOS, 275, boatXPOS, 150, boatXPOS, 275); //draws sail as a triangle*/
  triangle(sailXPOS, triangleBottom, boatXPOS, triangleTop, boatXPOS, triangleBottom); //draws sail as a triangle
  }//drawBoat
  
  void sail() {
    boatXPOS++;
    sailXPOS++;
  } //sail
} //Class
