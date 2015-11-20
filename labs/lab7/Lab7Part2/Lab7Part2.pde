//instance variables
PImage img; //create PImage variable

void setup() {  
  img = loadImage("lab7part2.png"); //loads image
  size(img.width, img.height); //sets size equal to size of image
  colorMode(HSB,360,100,100); //Set color mode
  
  image(img, 0, 0); //draws image
 
  noStroke(); //sets no outline
  loadPixels(); //loads pixels of the image
 
  for (int i=0; i<pixels.length;i++) { //loops through pixels
    float h = hue(pixels[i]);  //value for hue of current pixel
    float s = saturation(pixels[i]); //value for saturation of current pixel
    float b = brightness(pixels[i]); //value for brightness of current pixel
 
    //determines what hue current pixel is
    if (((hue(pixels[i]) < 217) && (hue(pixels[i])>209)) && ((saturation(pixels[i]) < 42) && (saturation(pixels[i])>29)) && ((brightness(pixels[i]) < 101) && (brightness(pixels[i])>99))) {
      pixels[i]=color(h,s+66,b); //sets saturation value for water on the map
    } //water's values
    
    //determines what hue current pixel is
    if (((hue(pixels[i]) < 90) && (hue(pixels[i])>79)) && ((saturation(pixels[i]) < 26) && (saturation(pixels[i])>19)) && ((brightness(pixels[i]) < 90) && (brightness(pixels[i])>85))) {
      pixels[i]=color(h+66,s+66,b); //sets saturation value for parks on map
    } //park's values
    
    //determines what hue current pixel is
    if (((hue(pixels[i]) < 90) && (hue(pixels[i])>79)) && ((saturation(pixels[i]) < 26) && (saturation(pixels[i])>19)) && ((brightness(pixels[i]) < 90) && (brightness(pixels[i])>85))) {
      pixels[i]=color(h+66,s+66,b); 
    } //
    
    //determines what hue current pixel is
    if (((hue(pixels[i]) < 48) && (hue(pixels[i])>40)) && ((saturation(pixels[i]) < 23) && (saturation(pixels[i])>17)) && ((brightness(pixels[i]) < 92) && (brightness(pixels[i])>87))) {
      pixels[i]=color(h,s+66,b); 
    } //school's values
    
    //determines what hue current pixel is
    if (((hue(pixels[i]) < 47) && (hue(pixels[i])>30)) && ((saturation(pixels[i]) < 100) && (saturation(pixels[i])>50)) && ((brightness(pixels[i]) < 109) && (brightness(pixels[i])>89))) {   
      pixels[i]=color(h-5,s+30,b-3);
    } //road's values
    
    //determines what hue current pixel is
    if (((hue(pixels[i]) < 47) && (hue(pixels[i])>30)) && ((saturation(pixels[i]) < 10) && (saturation(pixels[i])>0)) && ((brightness(pixels[i]) < 109) && (brightness(pixels[i])>89))) {
      pixels[i]=color(h,s-10,b-3); 
    } //street's values
    
    //determines what hue current pixel is
    if (((hue(pixels[i]) < 8) && (hue(pixels[i])>4)) && ((saturation(pixels[i]) < 12) && (saturation(pixels[i])>8)) && ((brightness(pixels[i]) < 95) && (brightness(pixels[i])>89))) {    
        pixels[i]=color(h,s+42,b); 
    } //library's values
  } //for
  
  updatePixels(); //updates images pixels
} //setup


void draw() {
  printValues();
} //draw


void printValues() { //if mouse is click
   loadPixels(); //Loads the pixel data for the display window into the pixels[] array
   int i = mouseY*width + mouseX;
   
   if (mousePressed) { //when mouse is pressed output HSV values
     System.out.println("hue " + hue(pixels[i]) + " Sat "+saturation(pixels[i]) +" Bright "+ brightness(pixels[i]) );
   } //if
} //mouseClicked




  

