class Tile {
  PImage img;
  int x, y, yStart;
  float angle, spinRate;
  boolean falling;
  
  Tile(PImage i, int newX, int newY) {
    img = i;
    x = newX;
    y = newY;
    yStart = newY;
    angle = 0;
    spinRate = random(3, 20);
    falling = false;
  } //Tile Constructor
  
  void drawTile() {
    pushMatrix();
    translate(x + 10, y + 10);
    if (falling) {
    rotate(radians(angle));
    } //if
    translate(-10, -10);
    image(img, 0, 0);
    popMatrix();
    
  } //drawTile
  
  void update() {
    angle = (angle + spinRate) % 360;
    
    /*if (falling) { //if
      y++;
    } //if
    
    if ((y - yStart) == 150) { //if
      falling = false;
    } //if*/
  } //update
  
} //Tile Class
