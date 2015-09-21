int i = 0;
boolean isRotating = false;

void setup() {
  size(800, 600);
  background(192);
} //setup

void draw() {
  background(192); //sets background to grey
  rectMode(CENTER); //sets rect to be drawn by mouse position in center
  //rect(mouseX, mouseY, 100, 50);
  pushMatrix(); //saves matrix to memory in Matrix stack
  translate(mouseX, mouseY); //translates matrix to mouse position
  rotate(radians(i));
  scale(2);
  if (isRotating) {
    i++;
  } //if
  rect(0, 0, 100, 50); //draws rectanagle
  popMatrix(); //removes current matrix from Matrix stack
  
  //translate(75,0);
  //rect(0, 0, 25, 25);
  //translate(0, 25);
  //rect(0, 0, 10, 10);
  
} //draw

void mousePressed() {
 isRotating = !isRotating; 
}
