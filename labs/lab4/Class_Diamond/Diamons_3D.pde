//instance variables
ArrayList<Diamond> diamonds = new ArrayList<Diamond>(); //initialize a list of Diamond objects
float camX, camY, camZ; //variables for camera angle

void setup() { //begin setup function
  size(1000, 1000, P3D); //initialize size of plane wit a 3d environment
  frameRate(15); //sets framerate to 30 frames/second 
  
  for (int i = 0; i < 1500; i++) { //begin for loop to create 75 diamond objetcs
    diamonds.add(new Diamond()); //adds new diamonds to ArrayList
  } //for
  
  camX = 0; //sets initial values for camera x position
  camY = 0; //sets intial value for camera y position
  camZ = 5000; //sets initial value for camera z position
} //setup


void draw() { //begin draw function
  lights(); //turn on lights function
  background(0); //sets background to black 
  fill(0); //draws white objects on black background
  
  for (int i = 0; i < 1500; i++) { //for loop that draws diamond objects
    diamonds.get(i).drawDiamond(); //draw diamond
    //shape(Diamond);
  } //for loop that draws diamond objects
    
  keyboardInput(); //checks for user input on the keyboard
  changeLights(); //checks if user changes lighting scheme
  camera(camX, camY, camZ, 50*mouseX, 50*mouseY, -100000, 0, 1, 0); //sets camera angle
} //draw

//begin function that moves with keyboard input
void keyboardInput() { 
  if (keyPressed && (key == CODED)) { //begin if logic check
    switch(keyCode) { //switch to check keyboard input
      case LEFT: //if user presses left key, update camX in left position
        camX -= 150; //decrement value to move in the left position
        break; 
      case RIGHT: //if user presses right key, update camX in right position
        camX += 150; //incremental value to move in the right position
        break;
      case UP: //if user presses up key, update camZ in the (negative) up position
        camZ -= 150; //decrement value to move camz in up position
        break;
      case DOWN: //if user presses own key, update camZ in the (positive) down position
        camZ += 150; //incremental value to move camZ in the down position
        break;
      default: //if user presses no keys, do nothing
        break;       
    } //switch
  } //if key is pressed
} //keyboardInput


//begin funcion that changes lighting scheme on key press
void changeLights() {
  if (keyPressed) { //begin if logic check
    switch(key) { //switch to check keyboard input
      case 'q': //if the user presses q, turn on ambient lights
        ambientLight(255, 0, 0);
        //System.out.println("We made it here"); //debugging
        break;
      case 'w': //if the user presses w, turn on dirdctional lights
        directionalLight(255, 0, 0, 0, 0, 1);
        break;
      case 'e': //if the user pressed e, turn on point light
        pointLight(0, 0, 255, width/2, 0, 0);
        break;
      default: //if the user presses no keys, do nothing
        break;
    } //switch 
  } //if key is pressed
} //changeLights
