class Shape {
  float x, y, z; //float for xPOS, yPOS, zPOS
  float h, w, d; //floats for hieght, width, and depth
  int r, g, b; //ints for color value
  
  public Shape() {
    x = random(-1000, 1000); //xPOS
    y = random(-1000, 1000); //yPOS
    z = random(-1000, 1000); //zPOS
    h = random(0, 100); //height
    w = random(0, 100); //width
    d = random(0, 100); //depgth
    r = (int)random(0, 255); //red color value
    g = (int)random(0, 255); //green color value
    b = (int)random(0, 255); //blue color value
  } //Shape (constructor)
  
  //begin a method which draws shapes on visual plane
  void drawShape() {
    pushMatrix();
    translate(x, y, z);
    fill(r, g, b);
    box(h, w, d);
    popMatrix();    
  } //drawShape

} //class Shape
