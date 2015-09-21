//initialize instance variables
int sunXPOS, sunYPOS;
int count = 0;
int i = 0;
int moonX = 0; 
int moonY = 150;

class Sun { //begin class Sun
  Sun(int sunX, int sunY) {
    sunXPOS = sunX;
    sunYPOS = sunY;
  } //Sun
  
  void drawSun() { //method that draws sun on screen
    fill(255, 255, 0); //sets color for sun to yellow
    pushMatrix();
    translate(sunXPOS, sunYPOS); //translates sun object by given parameters
    ellipse(0, 0, 100, 100); //draws sun at position (0, 0)
    popMatrix();
    if (count % 100 == 0) { //every 100 frames update sun position by 10
    sunXPOS += 10;
    sunYPOS += 10;
    } //if sun moves
  } //drawSun
  
  //method that makes sun set at faster rate when sailBoat object passess off screen
  void sunSet() { 
    if (count > 250) { //uses a counter to update position, 250 frames is when sailBoat passess off screen
    sunXPOS++;
    sunYPOS += 1.5;
    } //start making sun set when boat passes
    else { //update counter until count >= 250
     count++; 
    }
    if (sunXPOS > 700) { //sets sky to black and rises moon object
      background(0); //set background to black
      fill(0, 0, 255); //sets water to blue
      rect(0, 320, 640, 160); //redraws water
      fill(255, 255, 255); //sets moon color to white
      pushMatrix();
      translate(moonX, moonY); //translate moon by given parameters
      scale(2); //scales moon to two times the size of Sun object
      ellipse(0, 0, 100, 100); //draws moon at position (0, 0)
      popMatrix(); 
      moonX++; //updates moon's position
      moonY--;
    } //set background to black wen sun sets
  } //sunSet
  
  void drawMoon() {
    fill(255, 255, 255); //sets color for moon to white
    ellipse(0, 0, 100, 100); //draws moon in position where sun currently is
    scale(2); //sets moon to 2 times the size of the sun
  } //drawMoon
    
  void moonRise() {
    if (count > 701) {
      pushMatrix();
      translate(moonX, moonY); //makes moon translate across screen frame by frame
      popMatrix();
    } //starts making moon rise when sky goes to black
  } //moonRise
} //Sun
