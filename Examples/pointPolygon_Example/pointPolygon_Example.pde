/*
POINT/POLYGON COLLISION DETECTION
 Jeff Thompson | 2013 | www.jeffreythompson.org
 
 Finds collisions betwen a point and a N-sided polygon - very
 flexible!
 
 Via: http://stackoverflow.com/a/2922778/1167783 
 */

int numVertices = 4;                      // number of sides in polygon
float[] vertX = new float[numVertices];   // array of x/y coordinates for polygon
float[] vertY = new float[numVertices];

void setup() {
  size(500, 500);
  smooth();
  noStroke();

  // create vertices for polygon (here a trapezoid)
  vertX[0] = 100;
  vertY[0] = 100;
  vertX[1] = width-100;
  vertY[1] = 100;
  vertX[2] = width-200;
  vertY[2] = height-100;
  vertX[3] = 200;
  vertY[3] = height-100;
}

void draw() {
  background(150, 50, 0);

  // if hit, change the fill color for the polygon
  if (pointPolygon(numVertices, vertX, vertY, mouseX, mouseY)) {
    fill(255);
  }
  else {
    fill(255, 0, 0);
  }

  // draw polygon
  beginShape();
  for (int i=0; i<numVertices; i++) {
    vertex(vertX[i], vertY[i]);
  }
  endShape(CLOSE);

  // draw cursor
  fill(0);
  ellipse(mouseX, mouseY, 30, 30);
}

/*
POINT/POLYGON COLLISION DETECTION
 Takes 5 arguments:
 + # of vertices
 + float array x and y coordinates for vertices
 + x/y coordinates for point
 */
boolean pointPolygon (int numVertices, float[] vertX, float[] vertY, float px, float py) {
  boolean collision = false;
  for (int i=0, j=numVertices-1; i < numVertices; j = i++) {
    if ( ((vertY[i]>py) != (vertY[j]>py)) && (px < (vertX[j]-vertX[i]) * (py-vertY[i]) / (vertY[j]-vertY[i]) + vertX[i]) ) {
      collision = !collision;
    }
  }
  return collision;
}

