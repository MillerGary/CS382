//instance variables
float chartHei, chartWid, barWid, barHei; //size variables for bars
float lineLen, pointY, nextX, nextY; //size variables for lines
float numBars, numPoints; //number of bars used in chart
int x, colorChange, showData;
//FloatDict to hold key value pairs for Ben Roethlisberger's
//passer rating each year of his career
FloatDict QBR, QBRLines;
float[] rankedRatings, rankedRatingsLines;
//FloatDict to hold key-value piars for top 15 player's 
//points per game for the 2014-2015 season
FloatDict PPG, PPGLines;
float[] rankedPPG, rankedPPGLines;
String[] NBAnames;

void setup() {
  size(800, 700); //sets size of plane

  //intialize the FloatDict
  QBR = new FloatDict();
  //adding Big Ben's QBR rating for each year to the QBR FloatDict
  QBR.set("Year 1", 98.1);
  QBR.set("Year 2", 98.6);
  QBR.set("Year 3", 75.4);
  QBR.set("Year 4", 104.1);
  QBR.set("Year 5", 80.1);
  QBR.set("Year 6", 100.5);
  QBR.set("Year 7", 97.0);
  QBR.set("Year 8", 90.1);
  QBR.set("Year 9", 97.0);
  QBR.set("Year 10", 92.0);
  QBR.set("Year 11", 103.3);

  //Adding key value pairs for the name of nba player and his PPG
  PPG = new FloatDict();
  PPG.set("Russel Westbrook", 28.1);
  PPG.set("James Harden", 27.4);
  PPG.set("LeBron James", 25.3);
  PPG.set("Anthony Davis", 24.4);
  PPG.set("DeMarcus Cousins", 24.1);
  PPG.set("Stephen Curry", 23.8);
  PPG.set("LaMarcus Aldridge", 23.4);
  PPG.set("Blake Griffin", 23.4);
  PPG.set("Kyrie Irvin", 21.7);
  PPG.set("Klay Tompson", 21.7);
  PPG.set("Dwayne Wade", 21.5);
  PPG.set("Rudy Gay", 21.1);
  PPG.set("Damian Lillard", 21.0);
  PPG.set("DeMar DeRozan", 20.1);
  PPG.set("Jimmy Butler", 20.0);

  showData = 0; //displays no data until made True
} //setup

void draw() {
  println(mouseY);
  if (showData == 0) {
    //loadPixels();
    //for (int i = 0; i < pixels.length; i++) { //iterate through pixels
    //pixels[i] = color((int)random(0, 255), (int)random(0, 255), (int)random(0, 255));
    //} //for color static if no data is being shown
    //updatePixels();
    showBarSet1();
  } //if
  else if (showData % 2 == 0) {
    if (keyPressed == true) {
      stroke(2);
      showScatterSet1(); //show data set 1 as a scatter plot
    } //if
    else {
      stroke(2);
      showBarSet1(); //shows data set 1 as a bar chart
    }
  } //else-if
  else if (showData % 2 != 0) {
    if (keyPressed == true) {
      stroke(2);
      showScatterSet2(); //show data set 2 as a scatter plot
    } //if
    else {
      stroke(2);
      showBarSet2(); //shows data set 2 as a bar chart
    } //else
  } //else if
} //draw

void mouseReleased() { //if mouse is clicked
  showData++;
} //increment showData

void showBarSet1() {
  //sets height and width of chart
  //allowing small margins to make chart more readable
  chartHei = height; //allows 50 pixels for top margin
  chartWid = width - 100; //allows 50 pixels for left & right margins



  //Initializes the values in QBR into an array for easier acess and modification
  float[] rankedRatings = QBR.valueArray();

  numBars = QBR.size(); //determine the number of chart entries
  barWid = chartWid/numBars; //makes each bar an equal width, within the chart plane
  x = 50; //starting X-coordinate for drawing bars

  background(150); //set background to a nuetral grey color
  fill(100); //light grey to outline possible data values
  rect(50, 60, (chartWid - (chartWid % numBars)), 640); //rect to show maximum data values

  //Loop that draws bar to the size of Total QBR Rating 
  for (int index = 0; index < numBars; index++) { //iterate through rankeRatings indexes
    barHei = rankedRatings[index]; //set bar height = to current index of rankedRatings
    barHei = barHei * 4; //scales bar height to size of the chart
    //uses conditional logic to determine color of the bar 
    if (barHei/4 <= 158.3 && barHei/4 > 95) { //Red for incredible passer rating
      fill(255, 0, 0); //red
      strokeWeight(2); //sets the lines 2 time thicker
      rect(x, height, barWid, -barHei);
    } //100-95 QBR
    else if (barHei/4 < 95 && barHei/4 > 90) { //light red for great 90 passer rating
      fill(255, 100, 100); //light red
      strokeWeight(2); //sets the lines 2 time thicker
      rect(x, height, barWid, -barHei);
    } //95-90 QBR
    else if (barHei/4 < 90 && barHei/4 > 85) { //orangge for high passer rating
      fill(255, 165, 0); //orange
      strokeWeight(2); //sets the lines 2 time thicker
      rect(x, height, barWid, -barHei);
    } //90-85 QBR
    else if (barHei/4 < 85 && barHei/4 > 80) { //yellow for average passer rating
      fill(255, 255, 0); //yellow
      strokeWeight(2); //sets the lines 2 time thicker
      rect(x, height, barWid, -barHei);
    } //85-80 QBR
    else if (barHei/4 < 80 && barHei/4 > 75) { //cyan for low passer rating
      fill(0, 255, 255); //cyan
      strokeWeight(2); //sets the lines 2 time thicker
      rect(x, height, barWid, -barHei);
    } //80-75 QBR
    else if (barHei/4 < 75 && barHei/4 > 70) { //blue for bad passer rating
      fill(0, 0, 255); //blue
      strokeWeight(2); //sets the lines 2 time thicker
      rect(x, height, barWid, -barHei);
    } //75-70 QBR
    else if (barHei/4 < 70) { //Navy for terrible passer rating
      fill(0, 0, 128);
      strokeWeight(2); //sets the lines 2 time thicker
      rect(x, height, barWid, -barHei);
    } //70-0 QBR
    else { //Invalid input
      println("No valid QBR");
    } //else QBR is invalid range

    int year = index + 1; //variable to print the year in which the rating was achieved
    textSize(12); //set text size
    fill(0); //set text color to black
    text("Year " +year, (x + 10), height-30); //print the year inside its bar on chart
    text(barHei / 4, (x + 10), ((height - barHei) + 15)); //labels the Y-value of each bar
    textSize(28); //set text size
    //textAlign(CENTER, TOP); //Name the chart, positioned at the center, top
    text("Ben roethlisberger's Quarterback Rating by Year", 60, 50);

    x += barWid; //increment X-coordinate to next position on the graph
  } //for drawing scaled bars

  int yVal = 160; //maximum Y-value
  //loop to print labels for the Y-axis
  for (int y = 60; y < height; y += 20) {
    textSize(12); //set text size
    fill(0); //set text color to black
    text(yVal, 25, y); //prints text that labels the Y-axis
    yVal -= 5; //decrement Y-value for next iteration
  } //for Y-axis
} //Bar Chart Set 1

void showScatterSet1() {
  //sets height and width of chart
  //allowing small margins to make chart more readable
  chartHei = height; //allows 50 pixels for top margin
  chartWid = width - 100; //allows 50 pixels for left & right margins

  //intialize the FloatDict
  QBRLines = new FloatDict();
  //adding top ten QBR ratings to the QBR FloatDict
  QBRLines.set("Year 1", 98.1);
  QBRLines.set("Year 2", 98.6);
  QBRLines.set("Year 3", 75.4);
  QBRLines.set("Year 4", 104.1);
  QBRLines.set("Year 5", 80.1);
  QBRLines.set("Year 6", 100.5);
  QBRLines.set("Year 7", 97.0);
  QBRLines.set("Year 8", 90.1);
  QBRLines.set("Year 9", 97.0);
  QBRLines.set("Year 10", 92.0);
  QBRLines.set("Year 11", 103.3);
  QBRLines.set("Prevent Index out of bounds", 103.3);

  //Initializes the values in QBR into an array for easier acess and modification
  float[] rankedRatingsLines = QBRLines.valueArray();
  numPoints = QBR.size(); //determine the number of chart entries
  //numPoints -= 1; //decrement 1 to account for index boudary error preventing element
  lineLen = chartWid/numPoints; //makes each line an equal length, within the chart plane
  x = 50; //starting X-coordinate for drawing points & lines

  background(150); //set background to a nuetral grey color
  fill(100); //light grey to outline possible data values
  rect(50, 60, (chartWid - (chartWid % numPoints)), 640); //rect to show maximum data values

  int nextIndex = 1; //place holding for lines ending point in for loop
  //Loop that draws bar to the size of Total QBR Rating 
  for (int index = 0; index < numPoints; index++) { //iterate through rankeRatings indexes
    pointY = rankedRatingsLines[index]; //set point Y value = to current index of rankedRatings
    pointY = pointY * 4; //scales pointY value to size of the chart
    nextY = rankedRatingsLines[nextIndex]; //sets nextY to the value of next index
    nextY = nextY * 4; //scales nextY value to size of the chart
    nextX = x + barWid; //sets nextX to x value of next point
    //uses conditional logic to determine color of the bar 
    if (pointY/4 <= 158.3 && pointY/4 > 95) { //Red for incredible passer rating
      stroke(255, 0, 0); //red
      strokeWeight(4); //sets the lines four time thicker
      line(x, height-pointY, nextX, height-nextY);
      stroke(0); //sets color to black for emphasis on data point
      ellipse(x, height-pointY, 2, 2); //small ellipse to empahize data point
    } //100-95 QBR
    else if (pointY/4 < 95 && pointY/4 > 90) { //light red for great 90 passer rating
      stroke(255, 100, 100); //light red
      strokeWeight(4); //sets the lines four time thicker
      line(x, height-pointY, nextX, height-nextY);
      stroke(0); //sets color to black for emphasis on data point
      ellipse(x, height-pointY, 2, 2); //small ellipse to empahize data point
    } //95-90 QBR
    else if (pointY/4 < 90 && pointY/4 > 85) { //orangge for high passer rating
      stroke(255, 165, 0); //orange
      strokeWeight(4); //sets the lines four time thicker
      line(x, height-pointY, nextX, height-nextY);
      stroke(0); //sets color to black for emphasis on data point
      ellipse(x, height-pointY, 2, 2); //small ellipse to empahize data point
    } //90-85 QBR
    else if (pointY/4 < 85 && pointY/4 > 80) { //yellow for average passer rating
      stroke(255, 255, 0); //yellow
      strokeWeight(4); //sets the lines four time thicker
      line(x, height-pointY, nextX, height-nextY);
      stroke(0); //sets color to black for emphasis on data point
      ellipse(x, height-pointY, 2, 2); //small ellipse to empahize data point
    } //85-80 QBR
    else if (pointY/4 < 80 && pointY/4 > 75) { //cyan for low passer rating
      stroke(0, 255, 255); //cyan
      strokeWeight(4); //sets the lines four time thicker
      line(x, height-pointY, nextX, height-nextY);
      stroke(0); //sets color to black for emphasis on data point
      ellipse(x, height-pointY, 2, 2); //small ellipse to empahize data point
    } //80-75 QBR
    else if (pointY/4 < 75 && pointY/4 > 70) { //blue for bad passer rating
      stroke(0, 0, 255); //blue
      strokeWeight(4); //sets the lines four time thicker
      line(x, height-pointY, nextX, height-nextY);
      stroke(0); //sets color to black for emphasis on data point
      ellipse(x, height-pointY, 2, 2); //small ellipse to empahize data point
    } //75-70 QBR
    else if (pointY/4 < 70) { //Navy for terrible passer rating
      stroke(0, 0, 128);
      strokeWeight(4); //sets the lines four time thicker
      line(x, height-pointY, nextX, height-nextY);
      stroke(0); //sets color to black for emphasis on data point
      ellipse(x, height-pointY, 2, 2); //small ellipse to empahize data point
    } //70-0 QBR
    else { //Invalid input
      println("No valid QBR");
    }

    noStroke(); //turns off stroke for text labeling
    int year = index + 1; //variable to print the year in which the rating was achieved
    textSize(12); //set text size
    fill(0); //set text color to black
    text("Year " +nextIndex, (x + 10), height-30); //print the year inside its bar on chart
    text((pointY/4), x-10, ((height - pointY) + 25)); //labels the Y-value of each bar
    textSize(28); //set text size
    //textAlign(CENTER, TOP); //Name the chart, positioned at the center, top
    text("Ben roethlisberger's Quarterback Rating by Year", 60, 50);

    if (index != numPoints) {
      x += barWid; //increment X-coordinate to next position on the graph
      nextIndex++; //increment the next index ahead of loop
    } //if
    else {
      line(x, height-pointY, x, height-pointY);
    } //else
  } //for drawing scaled bars

  int yVal = 160; //maximum Y-value
  //loop to print labels for the Y-axis
  for (int y = 60; y < height; y += 20) {
    textSize(12); //set text size
    fill(0); //set text color to black
    text(yVal, 25, y); //prints text that labels the Y-axis
    yVal -= 5; //decrement Y-value for next iteration
  } //for Y-axis
} //scatter set 1

void showBarSet2() {

  //Putting values into a float array for easier access and modification
  float[] rankedPPG = PPG.valueArray();
  String[] NBAnames = PPG.keyArray();

  numBars = PPG.size(); //determine the number of chart entries
  barWid = chartWid/numBars; //makes each bar an equal width, within the chart plane
  x = 50; //starting X-coordinate for drawing bars

  background(150); //set background to a nuetral grey color
  fill(100); //light grey to outline possible data values
  rect(50, 60, (chartWid - (chartWid % numBars)), 640); //rect to show maximum data values
  stroke(2);
  //Loop that draws bar to the size of Total QBR Rating 
  for (int index = 0; index < numBars; index++) { //iterate through rankeRatings indexes
    barHei = rankedPPG[index]; //set bar height = to current index of rankedRatings
    barHei = barHei * 8; //scales bar height to size of the chart
    //uses conditional logic to determine color of the bar 
    if (barHei/8 > 30) { //Red for incredible passer rating
      fill(255, 0, 0); //red
      strokeWeight(2); //sets the lines 2 time thicker
      rect(x, height, barWid, -barHei*2);
    } //100-95 QBR
    else if (barHei/8 <= 30 && barHei/8 > 28) { //light red 
      strokeWeight(2); //sets the lines 2 time thicker
      fill(255, 100, 100); //light red
      rect(x, height, barWid, -barHei*2.7);
    } //95-90 QBR
    else if (barHei/8 <= 28 && barHei/8 > 26) { //orangge
      strokeWeight(2); //sets the lines 2 time thicker
      fill(255, 165, 0); //orange
      rect(x, height, barWid, -barHei*2.7);
    } //90-85 QBR
    else if (barHei/8 <= 26 && barHei/8 > 24) { //yellow
      fill(255, 255, 0); //yellow
      strokeWeight(2); //sets the lines 2 time thicker
      rect(x, height, barWid, -barHei*2.7);
    } //85-80 QBR
    else if (barHei/8 <= 24 && barHei/8 > 22) { //cyan
      fill(0, 255, 255); //cyan
      strokeWeight(2); //sets the lines 2 time thicker
      rect(x, height, barWid, -barHei*2.7);
    } //80-75 QBR
    else if (barHei/8 <= 22 && barHei/8 > 20) { //blue
      fill(0, 0, 255); //blue
      strokeWeight(2); //sets the lines 2 time thicker
      rect(x, height, barWid, -barHei*2.7);
    } //75-70 QBR
    else if (barHei/8 <= 20) { //Navy
      fill(0, 0, 128);
      strokeWeight(2); //sets the lines 2 time thicker
      rect(x, height, barWid, -barHei*2.7);
    } //70-0 QBR
    else { //Invalid input
      println("No valid PPG");
    } //else QBR is invalid range
    
    pushMatrix();
    textSize(12); //set text size
    fill(0); //set text color to black
    translate(x+30, height-30);
    rotate(3*HALF_PI);
    text("PPG: " +rankedPPG[index], barHei, 0); //labels the Y-value of each bar
    text(NBAnames[index], 0, 0); //print the year inside its bar on chart
    translate((x+30)*-1, (height-30)*-1);
    popMatrix();
    textSize(22); //set text size
    text("Top 15 Player's Point Per Game in the 2014-2015 NBA Season", 60, 50);
    x += barWid; //incremenet to next x position
  } //for drawing scaled bars

  int yVal = 30; //maximum Y-value
  //loop to print labels for the Y-axis
  for (int y = 60; y < height; y += 40) {
    textSize(12); //set text size
    fill(0); //set text color to black
    text(yVal, 25, y); //prints text that labels the Y-axis
    yVal -= 2; //decrement Y-value for next iteration
  } //for Y-axis
} //Bar Chart set 2

void showScatterSet2() {
  //sets height and width of chart
  //allowing small margins to make chart more readable
  chartHei = height; //allows 50 pixels for top margin
  chartWid = width - 100; //allows 50 pixels for left & right margins

  //Adding key value pairs for the name of nba player and his PPG
  PPGLines = new FloatDict();
  PPGLines.set("Russel Westbrook", 28.1);
  PPGLines.set("James Harden", 27.4);
  PPGLines.set("LeBron James", 25.3);
  PPGLines.set("Anthony Davis", 24.4);
  PPGLines.set("DeMarcus Cousins", 24.1);
  PPGLines.set("Stephen Curry", 23.8);
  PPGLines.set("LaMarcus Aldridge", 23.4);
  PPGLines.set("Blake Griffin", 23.4);
  PPGLines.set("Kyrie Irvin", 21.7);
  PPGLines.set("Klay Tompson", 21.7);
  PPGLines.set("Dwayne Wade", 21.5);
  PPGLines.set("Rudy Gay", 21.1);
  PPGLines.set("Damian Lillard", 21.0);
  PPGLines.set("DeMar DeRozan", 20.1);
  PPGLines.set("Jimmy Butler", 20.0);
  PPGLines.set("Out Of Bounds Protection", 20.0);

  //Initializes the values in QBR into an array for easier acess and modification
  float[] rankedPPGLines = PPGLines.valueArray();
  String[] NBAnames = PPGLines.keyArray();
  numPoints = PPG.size(); //determine the number of chart entries
  //numPoints -= 1; //decrement 1 to account for index boudary error preventing element
  lineLen = chartWid/numPoints; //makes each line an equal length, within the chart plane
  x = 50; //starting X-coordinate for drawing points & lines

  background(150); //set background to a nuetral grey color
  fill(100); //light grey to outline possible data values
  rect(50, 60, (chartWid - (chartWid % numPoints)), 640); //rect to show maximum data values

  int nextIndex = 1; //place holding for lines ending point in for loop
  //Loop that draws bar to the size of Total QBR Rating 
  for (int index = 0; index < numPoints; index++) { //iterate through rankeRatings indexes
    pointY = rankedPPGLines[index]; //set point Y value = to current index of rankedRatings
    pointY = (pointY * 8)*2.7; //scales pointY value to size of the chart
    nextY = rankedPPGLines[nextIndex]; //sets nextY to the value of next index
    nextY = (nextY * 8)*2.7; //scales nextY value to size of the chart
    nextX = x + barWid; //sets nextX to x value of next point
    //uses conditional logic to determine color of the bar 
    if (pointY/8 > 30) { //Red
      stroke(255, 0, 0); //red
      strokeWeight(4); //sets the lines four time thicker
      line(x, height-pointY, nextX, height-nextY);
      stroke(0); //sets color to black for emphasis on data point
      ellipse(x, height-pointY, 2, 2); //small ellipse to empahize data point
    } //100-95 QBR
    else if (pointY/8 <= 30  && pointY/8 > 28) { //light red
      stroke(255, 100, 100); //light red
      strokeWeight(4); //sets the lines four time thicker
      line(x, height-pointY, nextX, height-nextY);
      stroke(0); //sets color to black for emphasis on data point
      ellipse(x, height-pointY, 2, 2); //small ellipse to empahize data point
    } //95-90 QBR
    else if (pointY/8 <= 28 && pointY/8 > 26) { //orangge
      stroke(255, 165, 0); //orange
      strokeWeight(4); //sets the lines four time thicker
      line(x, height-pointY, nextX, height-nextY);
      stroke(0); //sets color to black for emphasis on data point
      ellipse(x, height-pointY, 2, 2); //small ellipse to empahize data point
    } //90-85 QBR
    else if (pointY/8 <= 26 && pointY/8 > 24) { //yellow
      stroke(255, 255, 0); //yellow
      strokeWeight(4); //sets the lines four time thicker
      line(x, height-pointY, nextX, height-nextY);
      stroke(0); //sets color to black for emphasis on data point
      ellipse(x, height-pointY, 2, 2); //small ellipse to empahize data point
    } //85-80 QBR
    else if (pointY/8 <= 24 && pointY/8 > 22) { //cyan
      stroke(0, 255, 255); //cyan
      strokeWeight(4); //sets the lines four time thicker
      line(x, height-pointY, nextX, height-nextY);
      stroke(0); //sets color to black for emphasis on data point
      ellipse(x, height-pointY, 2, 2); //small ellipse to empahize data point
    } //80-75 QBR
    else if (pointY/8 <= 22 && pointY/8 > 20) { //blue
      stroke(0, 0, 255); //blue
      strokeWeight(4); //sets the lines four time thicker
      line(x, height-pointY, nextX, height-nextY);
      stroke(0); //sets color to black for emphasis on data point
      ellipse(x, height-pointY, 2, 2); //small ellipse to empahize data point
    } //75-70 QBR
    else if (pointY/8 < 20) { //Navy
      stroke(0, 0, 128);
      strokeWeight(4); //sets the lines four time thicker
      line(x, height-pointY, nextX, height-nextY);
      stroke(0); //sets color to black for emphasis on data point
      ellipse(x, height-pointY, 2, 2); //small ellipse to empahize data point
    } //70-0 QBR
    else { //Invalid input
      println("No valid QBR");
    }

  textSize(12); //set text size
  fill(0); //set text color to black
  text(+rankedPPGLines[index], x+30, height-pointY); //labels the Y-value of each bar
    
   pushMatrix();
    textSize(12); //set text size
    fill(0); //set text color to black
    translate(x+30, height-30);
    rotate(3*HALF_PI);
    text(NBAnames[index], 0, 0); //print the year inside its bar on chart
    translate((x+30)*-1, (height-30)*-1);
    popMatrix();
    textSize(22); //set text size
    text("Top 15 Player's Point Per Game in the 2014-2015 NBA Season", 60, 50);
    x += barWid; //incremenet to next x position
    nextIndex++;
  } //for drawing scaled bars

  int yVal = 30; //maximum Y-value
  //loop to print labels for the Y-axis
  for (int y = 60; y < height; y += 40) {
    textSize(12); //set text size
    fill(0); //set text color to black
    text(yVal, 25, y); //prints text that labels the Y-axis
    yVal -= 2; //decrement Y-value for next iteration
  } //for Y-axis
} //Scatter set 2



