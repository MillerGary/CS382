PImage img;
Tile[] tiles;

void setup() {
  img = loadImage("AB.jpg");
  size(img.width, img.height);
  //image(img, 0, 0);
  tiles = new Tile[288];
  
  int tileNum = 0;
  for (int y = 0; y < img.height; y += 20) { //outter for
    for (int x = 0 ; x < img.width; x += 20) { //inner for
      tiles[tileNum] = new Tile(img.get(x, y, 20, 20), x, y);
      tileNum++;
    } //inner for
  } //outter fr
  
} //setup

void draw() {
  background(0);
  
  int tileChoice = (int)random(0, 288);
    if (tiles[tileChoice].y == tiles[tileChoice].yStart) { //if
      tiles[tileChoice].falling = true;
  } //if
  
  for (int i = 0; i < tiles.length; i++) {
    tiles[i].update();
    tiles[i].drawTile(); 
  } //for
  
} //draw
