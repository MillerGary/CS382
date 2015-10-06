/**
Bryn Mawr College, Department of Computer Science <br>
Click mouse to cycle through a series of convolution filters <br>
*/

float[][][] filters = { //average
                        {{1/9., 1/9., 1/9.},
                        {1/9., 1/9., 1/9.},
                        {1/9., 1/9., 1/9.}},
                        //Sharpen
                        {{-1, -1, -1},
                        {-1,  9, -1},
                        {-1, -1, -1}},
                        //Gaussian Blur
                        {{1/16., 2/16., 1/16.}, 
                        {2/16., 4/16., 2/16.}, 
                        {1/16., 2/16., 1/16.}},
                        //Sharpen2
                        {{0, -2/3., 0},
                        {-2/3., 11/3., -2/3.},
                        {0, -2/3., 0}},
                        //Laplacian Edge Detection horizontal/vertical
                        {{0,  -1,  0},
                        {-1, 4,  -1},
                        {0,  -1,  0}},
                        //Edge detection with diagonals
                        {{-1, -1, -1}, 
                        {-1, 8, -1}, 
                        {-1, -1, -1}},
                        //Emboss, need to add offset 127 as weights add up to 0
                        {{1, 1, 0}, 
                        {1, 0, -1}, 
                        {0, -1, -1}}};
String[] filterNames = {"Average", "Sharpen", "Gaussian Blur", "Sharpen 2", "Laplacian Edge Detection Horizontal/Vertical",
                        "Edge Detection with Diagonals", "Emboss"};
int counter = 0;
PImage img, img2, img3, img4;

void setup() {
  //original image
  img = loadImage("ManuGinobli.png"); //initializes original image
  // new images to store the changed pixels
  img2 = createImage(img.width, img.height, RGB); //sets parameters for second image
  img3 = createImage(img.width, img.height, RGB); //sets parameters for third image
  img4 = createImage(img.width, img.height, RGB); //sets parameters for fourth image
  size(2*img.width, 2*img.height); //sets size for a 2x2 grid of 4 images
  
  img.loadPixels(); //loads orignal image
  img2.loadPixels(); //loads 2nd image
  img3.loadPixels(); //loads 3rd image
  img4.loadPixels(); //loads 4th image
  image(img, 0, 0); //draws first image
  //image(img, width/2, height/2); //draws first image
  applyFilter2(); //applies filters to images
  applyFilter3();
  applyFilter4();
}

void draw(){
  selectFilter();
}

//begin funcion that changes lighting scheme on key press
void selectFilter() {
  if (keyPressed) { //begin if logic check
    switch(key) { //switch to check keyboard input
      case 'q': //if the user presses q, turn on ambient lights
        applyFilter2();
        break;
      case 'w': //if the user presses w, turn on dirdctional lights
        applyFilter3();
        break;
      case 'e': //if the user pressed e, turn on point light
        applyFilter4();
        break;
      default: //if the user presses no keys, do nothing
        break;
    } //switch 
  } //if key is pressed
} //selectFilter

void applyFilter2() { //funstion to iterate over each picture to apply filter
  for (int y=0; y<img.height; y++ ) {
    for (int x=0; x<img.width; x++) {
      img2.pixels[y*img.width+x] = convolution(x, y, filters[counter%filters.length], img);
    }
  }
  img2.updatePixels(); //updates 2nd image's pixels
  image(img2, 0, height/2); //draws second image
  textSize(20); //sets text size for filter name
  text(filterNames[counter%filterNames.length], width/4, height/2+height/25); //prints filter name
  counter++;
}

void applyFilter3() { //funstion to iterate over each picture to apply filter
  for (int y=0; y<img.height; y++ ) {
    for (int x=0; x<img.width; x++) {
      img3.pixels[y*img.width+x] = convolution(x, y, filters[counter%filters.length], img);
    }
  }
  img3.updatePixels(); //updates 2nd image's pixels
  image(img3, width/2, 0); //draws second image
  textSize(20); //sets text size for filter name
  text(filterNames[counter%filterNames.length], width/4, height/2+height/25); //prints filter name
  counter++;
}

void applyFilter4() { //funstion to iterate over each picture to apply filter
  for (int y=0; y<img.height; y++ ) {
    for (int x=0; x<img.width; x++) {
      img4.pixels[y*img.width+x] = convolution(x, y, filters[counter%filters.length], img);
    }
  }
  img4.updatePixels(); //updates 2nd image's pixels
  image(img4, width/2, height/2); //draws second image
  textSize(20); //sets text size for filter name
  text(filterNames[counter%filterNames.length], width/4, height/2+height/25); //prints filter name
  counter++;
}

// calculates the color after applying the filter
color convolution(int x, int y, float[][] matrix, PImage img) {
  int offset = floor(matrix.length/2);
  float r = 0.0, g = 0.0, b = 0.0;

  for (int i = 0; i < matrix.length; i++) {
    for (int j= 0; j < matrix[i].length; j++) {
      // Which neighbor are we using
      int newX = x+i-offset;
      int newY = y+j-offset;
      int idx = img.width*newY + newX;
      // Make sure we haven't walked off our image
      idx = constrain(idx, 0, img.pixels.length-1);
      // Calculate the convolution
      r += (red(img.pixels[idx]) * matrix[i][j]);
      g += (green(img.pixels[idx]) * matrix[i][j]);
      b += (blue(img.pixels[idx]) * matrix[i][j]);
    }
  }
  if (counter%filters.length == filters.length-1) { // last filter is the emboss filter, add offset
    return color(r+127, g+127, b+127);
  }
  else {
    return color(r, g, b);
  }
}
