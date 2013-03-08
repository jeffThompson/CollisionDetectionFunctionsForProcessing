/*
POINT/POLYGON COLLISION DETECTION
 Jeff Thompson | 2013 | www.jeffreythompson.org
 
 Finds collisions betwen a point and a N-sided polygon - very
 flexible!
 
 Via: http://stackoverflow.com/a/2922778/1167783 
 
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

