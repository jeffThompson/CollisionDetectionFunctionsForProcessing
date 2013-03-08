/*
POINT/TRIANGLE COLLISION DETECTION
Jeff Thompson | 2013 | www.jeffreythompson.org

Check if a point is inside a triangle. Built using a modified version
of this post:
http://gmc.yoyogames.com/index.php?showtopic=106307
*/

int x1, y1, x2, y2, x3, y3;    // variables for the triangle
boolean collision = false;

void setup() {
  size(500,500);
  smooth();
  noStroke();
  
  // setup triangle
  x1 = 50;
  y1 = 50;
  x2 = width-50;
  y2 = 50;
  x3 = width/2;
  y3 = height-50;
}

void draw() {
  
  // draw background and triangle
  background(0,150,75);
  fill(255,150,0);
  triangle(x1, y1, x2, y2, x3, y3);
  
  // if point is in triangle, change color of the cursor!
  if (pointTriangle(x1, y1, x2, y2, x3, y3, mouseX, mouseY)) {
    fill(255);
  }
  else {
    fill(0);
  }
  ellipse(mouseX, mouseY, 20,20);
}

/*
POINT/TRIANGLE COLLISION FUNCTION
Takes 2 sets of arguments: 
  + x/y coordinates for triangle
  + x/y coordinates for the point
*/
boolean pointTriangle(int x1, int y1, int x2, int y2, int x3, int y3, int px, int py) {
  int a0 = abs((x2-x1)*(y3-y1)-(x3-x1)*(y2-y1));
  int a1 = abs((x1-px)*(y2-py)-(x2-px)*(y1-py));
  int a2 = abs((x2-px)*(y3-py)-(x3-px)*(y2-py));
  int a3 = abs((x3-px)*(y1-py)-(x1-px)*(y3-py));
  
  return (abs(a1+a2+a3 - a0) <= 1/256);
}
