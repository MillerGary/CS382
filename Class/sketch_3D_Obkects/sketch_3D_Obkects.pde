float rotAngle;
int reset;


void setup() {
  size(420, 220, P3D); //P3D is the 3-D parameter for processing
  background(0);
  noFill();
  stroke(255);
  float rotAngle = 0; 
  //reset = 0;
  //lights();
  //ambientLight(0, 0, 192);
} //setup


void draw() {
  background(0);
  //line(x1, y1, x2, y2); //for a line in 2-D
  //line(x1, y1, z1, x2, y2, z2); //for a line in 3-D
  //line(30, 20, 0, 185, 120, 15);
  //stroke(128);
  //line(185, 120, 15, 185, 175, 50);
  //stroke(255); 
  //pushMatrix();
  translate(width/2, height/2);
  rotateY(rotAngle);
  rotateZ(rotAngle/2);
  rotateX(rotAngle/4);
  //box(75, 150, 25);
  sphere(255);
  //popMatrix();
  rotAngle += PI/48;
  /*reset++;
  if (reset > 60) {
    background(0);
    reset = 0;
  } //if*/
} //draw
