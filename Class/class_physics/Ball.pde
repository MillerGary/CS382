
/*similar to example 9-2 class ball in text book chapter 9*/
class Ball {
  //instance variables
  float sx, sy; //position of x and y
  float vx, vy; //velocity of x and y
  float wid, hei; //value of width and height of ellipse used to draw ball
  float colR, colG, colB; //int to hold value of ball color
  float gravity; //float used to simulate gravity
  int i; //value for rotation position
  
  Ball(float x, float y, float w, float h, float c1, float c2, float c3) {
    sx = x;
    sy = y;
    wid = w;
    hei = h;
    colR = c1;
    colG = c2;
    colB = c3;
    vx = random(-4, 4); //sets intial x velocity to rnadom between lower & upper bound
    vy = random(-1, 1); //sets initial y velocity to random between lower & upper bound
    gravity = random(0.01, 0.05); //sets a random gravity value
  } //Ball
  
  void update() {
    sx = sx + vx; //changes position of x
  sy += vy; //changes position of y

  
  if(sy > height) { //makes ball bounce off of bottom boundary
    vy = -vy;
    sy = height;
    vy = vy * friction;
    vx *= friction;
  }
 
 if(sx > width) { //makes ball bounce off of the right boundary
    vx = -vx;
    sx = height;
    vy *= friction;
    vx *= friction;
 }

  if(sx < 0) { //makes ball bounce off of the top boundary
   vy = -vy;
   sy = 0;
   vy *= friction;
   vx *= friction;
  }
 
 if(sx < 0) { //makes ball bounce off of the left boundary 
  vx = -vx;
  vx = 0;
  vy *= friction;
  vx *= friction;
 }
  
 vy += gravity; //simulates affect of gravity

 vy *= airres;
 vx *= airres;
 
 i+= 5;
  } //update
  
  void drawBall() {
    fill(colR, colG, colB);
    pushMatrix();
    translate(sx, sy);
    rotate(radians(i));
    ellipse(0, 0, wid, hei);
    popMatrix();    
  } //drawBall
  
} //Ball (class)
