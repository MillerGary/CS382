
ArrayList<Shape> shapes = new ArrayList<Shape>(); //intialize a list of Shape objects
float camX, camY, camZ; //variables for camera angle
float lookX, lookY, lookZ;
float angle, angleV;

void setup() { //begin setup function
  size(800, 600, P3D); //intialize size with 3D environment
  noStroke(); //no stroke, looks better with lighting 
  
  for (int i = 0; i < 500; i++) { //begin for to intialize 50 shapes
    shapes.add(new Shape()); //adds new shapes to ArrayList
  } // for loop initalizes shapes
  
  camX = 0; //sets initial values for camera x position
  camY = 0; //sets intial value for camera y position
  camZ = 2000; //sets initial value for camera z position
  
  lookX = 0;
  lookY = 0;
  lookZ = -100000;
  
  angle = 0;
  angle = 0;
} //setup


void draw() { //begin draw function
  lights(); //turn on lights function
  background(0); //set backgroun to blakc
  fill(255); //draw white objects on black background

  for (int i = 0; i < 500; i++) { //begin for to draw 50 shapes
    shapes.get(i).drawShape(); //ad shape to arrayList
  }//for loop draws shapes 
  
  keyboardInput(); //checks for user input on the keyboard
  mousePosition(); //checks for position of mouse
  camera(camX, camY, camZ, 50*mouseX, 50*mouseY, -100000, 0, 1, 0); //sets camera angle
} //draw

//begin function that moves with iven keyboard input
  void keyboardInput() { 
  if (keyPressed && (key == CODED)) { //begin if logic check
    switch(keyCode) { //switch to check keyboard input
      case LEFT: //if user presses left key, update camX in left position
        camX += 20 * sin(radians(angle - 90));; //decrement value to move in the left position
        camZ += -20 * cos(radians(angle - 90));
        break; 
      case RIGHT: //if user presses right key, update camX in right position
        camX += -20 * sin(radians(angle - 90));; //incremental value to move in the right position
        camZ += 20 * cos(radians(angle - 90));
        break;
      case UP: //if user presses up key, update camZ in the (negative) up position
        camX += 20 * sin(radians(angle));
        camZ += -20 * cos(radians(angle));; //decrement value to move camz in up position 
        break;
      case DOWN: //if user presses own key, update camZ in the (positive) down position
        camX += -20 * sin(radians(angle));
        camZ += 20 * cos(radians(angle));; //incremental value to move camZ in the down position
        break;
      default: //if user presses no keys, do nothing
        break;       
    } //switch
  } //if key is pressed
  } //keyboardInput
  
  void mousePosition() { //begin mouse position function
   float mouse = mouseX;
   float mou = mouseY;
   float wid = width;
   float hei = height;
   angle = ((mouse / wid) -0.5) * 360;
   angleV = ((mou / hei) -0.5) * 180;
   cameraUpdate();
  } //mousePosition
  
  void cameraUpdate() { 
    lookX = 100000*sin(radians(angle));
    lookY = 100000*sin(radians(angleV));
    lookZ = -100000*cos(radians(angle));
  } //cameraUpdate
