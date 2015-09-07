final float gravity = 0.2; //float used to simulate gravity
final float friction = 0.99; //float used to simulate friciton
final float airres = 0.999; //float used to simulate air resistance
//Ball myBall, myBall2;
ArrayList<Ball> allBalls = new ArrayList<Ball>();

void setup() {
  size(720, 480);
  background(0);
  //myBall = new Ball(width/2, 50, 10, 10, 255);
  //myBall2 = new Ball(width/4, 0, 25, 25, 50);
  
  for (int i = 0; i < 500; i++) {
    allBalls.add(new Ball(random(0, width), random(0, height), random(10, 25), random(10, 25), random(32, 255), random(32, 255), random(32, 255)));
  } //for
} //setup

void draw() {
  //background(0);
  //fill(255);
  
  for (int i = 0; i < 500; i++) {
    allBalls.get(i).drawBall();
    allBalls.get(i).update();
  } //for
  
  /*myBall.drawBall();
  myBall.update();
  myBall2.drawBall();
  myBall2.update();*/
} //draw   
