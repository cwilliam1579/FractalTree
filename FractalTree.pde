public double fractionLength = .8;
public double smallestBranch = 10.00;
public double branchAngle = .2;
public void setup()
{
  size(640, 480);
  noLoop();
}
public void draw()
{
  background(0);
  stroke(0, 255, 0);
  line(320, 480, 320, 380);
  drawBranches(320, 380, 100, 3*Math.PI/2);
}



void keyTyped() {
  if (key == 'w') {
    fractionLength += 0.01;
  } else if (key == 'q') {
    fractionLength -= 0.01;
  } else if (key == 's') {
    smallestBranch += 1;
  } else if (key == 'a') {
    smallestBranch -= 1; 
  } else if (key == 'x') {
    branchAngle += 0.01; 
  } else if (key == 'z') {
    branchAngle -= 0.01; 
  }
  redraw(); 
}




public void drawBranches(int x, int y, double branchLength, double angle)
{
  double angle1=angle+branchAngle;
  double angle2=angle-branchAngle;
  branchLength*=fractionLength;

  int endX1 = (int)(branchLength * Math.cos(angle1) + x);
  int endX2 = (int)(branchLength * Math.cos(angle2) + x);
  int endY1 = (int)(branchLength * Math.sin(angle1) + y);
  int endY2 = (int)(branchLength * Math.sin(angle2) + y);

  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);

  if (branchLength > smallestBranch) {
    drawBranches(endX1, endY1, branchLength, angle1);
    drawBranches(endX2, endY2, branchLength, angle2);
  }
}
