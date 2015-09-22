//instance variables
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

class Diamond { //begin Diamond class

  Diamond() {
    x = random(-1000, 1000); //x vertex
    y = random(-1000, 1000); //y vertex
    z = random(-1000, 5000); //z vertex
    len = random(0, 200); //length of diamond
    /*posX = random(-1000, 1000); //x coordinate
    posY = random(-1000, 1000); //y coordinate
    posZ = random(-500, 500); //z coordinate*/
    vert1 = y - len; //sets position for top point of diamond
    vert2 = x - len; //sets X position for left point of diamond
    vert3 = x + len; //sets X position for right point of diamond
    vert4 = y + len; //sets position for bottom point of diamond
    vert5 = z - len; //sets position for negative depth of diamond
    vert6 = z + len; //sets position for positive depht of diamond
  } //Diamond (constructor)
  
  void drawDiamond() { //begin drawDiamond
  pushMatrix();
  translate(random(-1500, 1500), random(-1500, 1500), random(-1500, 1500));
  //translate(posX, posY, posZ);
  //rotate(PI/(random(2, 24)));
  fill((int)random(200, 255), (int)random(200, 255), 0); //random diamond color
  
  /*s = createShape();
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
      
    s.endShape();  //Top_Left face*/
  
  
  /*beginShape(); //Top-Left face
      vertex(x, y, z); //center
      vertex(vert2, y, z); //left point
      vertex(x, vert1, z); //top point
      //vertex(x, y, vert5); //negative z point
      //vertex(x, y, vert6); //postive z point
    endShape();  //Top_Left face
    
    beginShape(); //Top-Right face
      vertex(x, y, z); //center
      vertex(vert3, y, z); //right point
      vertex(x, vert1, z); //top point
      //ertex(x, y, vert5); //negative z point 
      //vertex(x, y, vert6); //positive z point     
    endShape(); //Top-Right face
    
    beginShape(); //Bottom-Left face
      vertex(x, y, z); //center
      vertex(vert2, y, z); //left point
      vertex(x, vert4, z); //bottom point
      //vertex(x, y, vert5); //negative z point
      //vertex(x, y, vert6); //positive z point
    endShape(); //Bottom-Left face
    
    beginShape(); //Bottom-Right face
      vertex(x, y, z); //center
      vertex(vert3, y, z);//right point
      vertex(x, vert4, z); //bottom point
      //vertex(x, y, vert5); //negative z point
      //vertex(x, y, vert6); //positive z point
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
    popMatrix();
  } //drawDiamond
} //class
