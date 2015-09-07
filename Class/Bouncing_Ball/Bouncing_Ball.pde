float sx, sy; //position of x and y
float vx, vy; //velocity of x and y
final float gravity = 0.2;
final float friction = 0.99;

void setup() {
  size(720, 480);
  background(0);
  sx = width/2; //set value for position of x
  sy = 100; //set value for position of y
  vx = 1.5; //set velocity of x
  vy = 2; //set velocity of y
} //setup
  
void draw() {
  background (0);
  fill(255);
  ellipse(sx, sy, 10, 10);
  
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
 
 /*if(sy == height) { //stops ball if it is on the floor
   sy = height;
   vy = 0;
 }*/
  
 vy += gravity; //simulates affect of gravity

  
  //debuggin output
  System.out.println(sx + " " + sy + " " + vx + " " + vy + " " + gravity + " ");
  
  
} //draw
