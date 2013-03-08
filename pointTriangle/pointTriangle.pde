/*
POINT/TRIANGLE COLLISION DETECTION
Jeff Thompson | 2013 | www.jeffreythompson.org

Takes 2 sets of arguments: 
  + x/y coordinates for triangle
  + x/y coordinates for the point

Built using a modified version of this post:
http://gmc.yoyogames.com/index.php?showtopic=106307
*/

boolean pointTriangle(int x1, int y1, int x2, int y2, int x3, int y3, int px, int py) {
  int a0 = abs((x2-x1)*(y3-y1)-(x3-x1)*(y2-y1));
  int a1 = abs((x1-px)*(y2-py)-(x2-px)*(y1-py));
  int a2 = abs((x2-px)*(y3-py)-(x3-px)*(y2-py));
  int a3 = abs((x3-px)*(y1-py)-(x1-px)*(y3-py));
  
  return (abs(a1+a2+a3 - a0) <= 1/256);
}
