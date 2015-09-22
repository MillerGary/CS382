float x, y, z; //verticies
float len; //lenth from center to verticies
float posX,posY, posZ; //coordinate positions
float vert1; //top vertex in diamond
float vert2; //left vertex in diamond
float vert3; //right vertex in diamond
float vert4; //bottom vertex in diamond
float vert5; //negative z vertex in diamond
float vert6; //positive z vertex in diamond
PShape s;

float camX, camY, camZ; //variables for camera angle

void setup() { 
  size(800, 800, P3D);
  background(209);
  x = width / 2;
  y = height / 2;
  z = 0;
  len = 100;
  vert1 = y - len; //sets position for top point of diamond
    vert2 = x - len; //sets X position for left point of diamond
    vert3 = x + len; //sets X position for right point of diamond
    vert4 = y + len; //sets position for bottom point of diamond
    vert5 = z - len; //sets position for negative depth of diamond
    vert6 = z + len; //sets position for positive depht of diamond
    
    camX = 0; //sets initial values for camera x position
  camY = 0; //sets intial value for camera y position
  camZ = 2000; //sets initial value for camera z position
  
  s = createShape();
  s.beginShape();
  s.beginShape(); //Top-Left face
      s.vertex(x, vert1, z); //top point
      s.vertex(vert2, y, z); //left point
      s.vertex(x, vert4, z); //bottom point
      s.vertex(vert3, y, z); //right point
      s.vertex(x, vert1, z); //top point
      
      s.vertex(x, y, vert6); //pos z
      s.vertex(vert2, y, z); //left point
      s.vertex(x, y, vert5); //neg z
      s.vertex(vert3, y, z); //right point
      s.vertex(x, y, vert6); //pos z
      s.vertex(x, vert4, z); //bottom point
      
      s.vertex(x, y, vert5); //neg z
      s.vertex(x, vert1, z); //top point
      s.vertex(x, y, vert6); //pos z
      
    s.endShape();  //Top_Left face
  
} //setup

void draw() {
  background(209);
  s.rotate(PI/96);
  shape(s);
    
    /*beginShape(); //Top-Right face
      vertex(x, y, z); //center
      vertex(vert3, y, z); //right point
      vertex(x, vert1, z); //top point    
    endShape(); //Top-Right face
    
    beginShape(); //Bottom-Left face
      vertex(x, y, z); //center
      vertex(vert2, y, z); //left point
      vertex(x, vert4, z); //bottom point
    endShape(); //Bottom-Left face
    
    beginShape(); //Bottom-Right face
      vertex(x, y, z); //center
      vertex(vert3, y, z);//right point
      vertex(x, vert4, z); //bottom point
    endShape(); //Bottom-right face
    
    beginShape(); //Connects mid height verticies front side
      vertex(vert2, y, z); //connects center, left, and negative z points
      vertex(x, y, vert6); //connects center, left, and positive z points
      vertex(vert3, y, z); //connects center, right, and negative z points
    endShape(); //Connects mid height points front side
    
    beginShape(); //Connects mid height verticies back side
      vertex(vert2, y, z); //left center vertex
      vertex(x, y, vert5); //positive z vertex
      vertex(vert3, y, z); //right center vertex
    endShape(); //Connects mid height verticies back side
    
    beginShape(); //Connects top and bottom verticies front side
      vertex(x, vert1, z); //top center vertex
      vertex(x, y, vert6); //positive z vertex
      vertex(x, vert4, z); //bottom center vertex
    endShape(); //Connects mid height verticies front side
    
    beginShape(); //Connects top and bottom verticies back side
      vertex(x, vert1, z); //top center vertex
      vertex(x, y, vert5); //negative z vertex 
      vertex(x, vert4, z); //bottom center vertex
    endShape(); //Connects top and bottom verticies back side
    
    beginShape(); //Connects top and bottom verticies back side
      vertex(vert2, y, z); //
      vertex(x, y, vert6); // 
      vertex(vert3, y, z); //
    endShape(); //Connects mid height points front side*/
  
    keyboardInput(); //checks for user input on the keyboard
    camera(camX, camY, camZ, 50*mouseX, 50*mouseY, -100000, 0, 1, 0); //sets camera angle
} //draw

//begin function that moves with iven keyboard input
void keyboardInput() { 
  if (keyPressed && (key == CODED)) { //begin if logic check
    switch(keyCode) { //switch to check keyboard input
      case LEFT: //if user presses left key, update camX in left position
        camX -= 10; //decrement value to move in the left position
        break; 
      case RIGHT: //if user presses right key, update camX in right position
        camX += 10; //incremental value to move in the right position
        break;
      case UP: //if user presses up key, update camZ in the (negative) up position
        camZ -= 10; //decrement value to move camz in up position
        break;
      case DOWN: //if user presses own key, update camZ in the (positive) down position
        camZ += 10; //incremental value to move camZ in the down position
        break;
      default: //if user presses no keys, do nothing
        break;       
    } //switch
  } //if key is pressed
} //keyboardInput
