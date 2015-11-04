class Tile {
  PImage img;
  float x, y, yStart, xStart;
  float angle, spinRate, initialAngle;
  boolean moving, STOPPED;
  PVector current, stop;
  
  Tile(PImage i, int xStop, int yStop) {
    img = i;
    x = xStop;
    y = yStop;
    
    //random starting positions for tiles
    //error of 20 pixels given
    xStart = random(-200, (width+200));
    yStart = random(-200, (height+200));
    
    //random angle and rotation value
    initialAngle = 0;
    angle = random(radians(PI));
    spinRate = random(3, 10);
    
    //intialize moving and final sSTOPPEDD to false
    moving = true;
    STOPPED = false;
    
    //position vector
    stop = new PVector(x, y); //ending coordinates
    current = new PVector(xStart, yStart); //current coordinates
    
    //set starting position
    translate(xStart, yStart);
  } //Tile (constructor)
  
  void update() {   
    angle = (angle + spinRate) % 360; //random spinning rate
    
    if ((stop.x == current.x) && (stop.y == current.y)) { //If STOPPED
      moving = true;
      angle = PI/2;
      spinRate = 0;
    } //if STOPPED
    
    if (moving) { //if moving
      if (xStart < stop.x) {
        xStart+=.5;
      } if (xStart > stop.x) {
        xStart-=.5;
      } if (yStart < stop.y) {
        yStart+=.5;
      } if (yStart > stop.y) {
        yStart-=.5;
      }      
    } //if moving  
    
  } //update
  
  void drawTile() { //draw tiles
    pushMatrix();
      translate(xStart, yStart);
      if (moving) { //checks if tiles is moving
        //rotate(radians(angle));
      } //if moving
    image(img, width/4, height/2);
    popMatrix();          
  } //drawTile
  
} //Tile (class)



