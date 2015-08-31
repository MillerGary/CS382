//TL = top left corner
//CN = center
//size(width, height)
size(480, 320);

//point(x, y)
point(100, 100);

//rect(x_pos_TL, y_pos_TL, width, height)
rect(80, 150, 100, 20);

//ellipse(x_pos_CN, y_pos_CN, width, height)
ellipse(80, 150, 100, 20);

//line(x1, y1, x2, y2)
line(80, 150, 100, 20);

//triangle(x1, y1, x2, y2, x3, y3)
triangle(200, 20, 250, 25, 225, 150);

//quad(x1, y1, x2, y2, x3, y3, x4, y4)
quad(200, 200, 225, 225, 350, 200, 225, 175);

//arc(x_pos_CN, y_pos_CN, width, height, rad_start, rad_end)
//arc(100, 250, 100, 50, 1, 2);
//arc(100, 250, 100, 50, radians(90), radians(180));
arc(100, 250, 100, 50, PI, TWO_PI);
