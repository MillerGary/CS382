PImage img;
Tile[] tiles;

void setup() {
  img = loadImage("AB.jpg");
  size(2*img.width, 2*img.height);
  //image(img, 0, 0);
  tiles = new Tile[288];
  
  int tileNum = 0;
  for (int y = 0; y < img.height; y += 20) {
    for (int x = 0; x < img.width; x += 20) {
      tiles[tileNum] = new Tile(img.get(x, y, 20, 20), x, y);
      tileNum++;
    } //for   
  } //for
} //setup

void draw() {
  background(0);
  
  /*if (mousePressed) { //initalize movement
    for (int i = 0; i < tiles.length; i++) {
      //translate(random(0, width), random(0, height));
      tiles[i].moving = true;
    } //for moving true
  } //if to start moving*/
  
  /*int tileChoice = (int)random(0, 288);
  if (tiles[tileChoice].y == tiles[tileChoice].yStart) {
    tiles[tileChoice].moving = true;
  } //if*/
  
 for (int j = 0; j < tiles.length; j++) {
      tiles[j].update();
      tiles[j].drawTile();
 } //for draw and update
} //draw
