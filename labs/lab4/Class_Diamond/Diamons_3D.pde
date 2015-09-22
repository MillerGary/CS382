//instance variables
ArrayList<Diamond> diamonds = new ArrayList<Diamond>(); //initialize a list of Diamond objects
float camX, camY, camZ; //variables for camera angle

void setup() { //begin setup function
  size(800, 600, P3D); //initialize size of plane wit a 3d environment 
  
  for (int i = 0; i < 1500; i++) { //begin for loop to create 75 diamond objetcs
    diamonds.add(new Diamond()); //adds new diamonds to ArrayList
  } //for
  
  camX = 0; //sets initial values for camera x position
  camY = 0; //sets intial value for camera y position
  camZ = 2000; //sets initial value for camera z position
  
} //setup


void draw() { //begin draw function
  lights(); //turn on lights function
  background(0); //sets background to black 
  fill(0); //draws white objects on black background
  
  for (int i = 0; i < 1500; i++) { //for loop that draws diamond objects
    //diamonds.get(i).drawDiamond(); //draw diamond
    shape(Diamond);
  } //for loop that draws diamond objects
    
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
