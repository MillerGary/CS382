float[][] emboss = {{1, 1, 0}, //emboss filter
                   {1, 0, -1}, 
                   {0, -1, -1}};
float[][] custom = {{1,  1, 1}, //filter that shows only edges
                    {1, -7,  1},
                    {1,  1,  1}};
PImage img, img2, img3, img4;

void setup() {
  //original image
  img = loadImage("ManuGinobli.png"); //initializes original image
  img2 = loadImage("ManuGinobli.png"); //intialize color manipulation image to own variable
  // new images to store the changed pixels 
  img3 = createImage(img.width, img.height, RGB); //sets parameters for third image
  img4 = createImage(img.width, img.height, RGB); //sets parameters for fourth image
  size(2*img.width, 2*img.height); //sets size for a 2x2 grid of 4 images
  
  img.loadPixels(); //loads orignal image
  img2.loadPixels(); //loads 2nd image
  img3.loadPixels(); //loads 3rd image
  img4.loadPixels(); //loads 4th image
  
  img2.filter(INVERT); //inverts color of pixels
} //setup

void draw() {
  image(img, 0, 0); //draw original image   
  image(img2, width/2, 0); //draw invert image
  image(img3, 0, height/2); //draw emboss image
  image(img4, width/2, height/2); //draw edge image
  embossFilter(); //apply edge filter
  edgeFilter(); 
} //draw

//applyFilter function from class
void embossFilter() { //function to iterate over each picture to apply filter
  for (int y=0; y<img.height; y++ ) {
    for (int x=0; x<img.width; x++) {
      img3.pixels[y*img.width+x] = convolution(x, y, emboss, img);
    }
  }
  img3.updatePixels(); //updates 2nd image's pixels
  image(img3, 0, height/2);
}

//apply filter function from class
void edgeFilter() { //funstion to iterate over each picture to apply filter
  for (int y=0; y<img.height; y++ ) {
    for (int x=0; x<img.width; x++) {
      img4.pixels[y*img.width+x] = convolution(x, y, custom, img);
    }
  }
  img4.updatePixels(); //updates 2nd image's pixels
  image(img4, width/2, height/2); //draws second image
}

// calculates the color after applying the filter
//Method given in class example
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
    return color(r, g, b); //return RGB values
}












