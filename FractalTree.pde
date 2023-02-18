private double fractionLength = .82; 
private int smallestBranch = 30; 
private double branchAngle = .25;  
public void setup() 
{   
  size(640,480);    
  noLoop(); 
} 
public void draw() 
{   
  background(0);   
  stroke(176, 132, 51);  
  strokeWeight(9);
  line(320,480,320,380);   
  drawBranches(320, 380, 110, 3*Math.PI/2, 5); 
  
  //ground
  fill(214, 190, 120);
  rect(0, 460, 640, 30);
} 
public void drawBranches(int x,int y, double branchLength, double angle, float branchWidth) 
{   
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  double angle3 = angle + 2.2 * branchAngle;
  double angle4 = angle - 2.2 * branchAngle;
  
  //different lengths of branches
  double rando = ((Math.random() * 1.5 + 9)) / 10;
  branchLength = branchLength * fractionLength * rando;
  //ending/starting branches
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  int endX3 = (int)(branchLength*Math.cos(angle3) + x);
  int endY3 = (int)(branchLength*Math.sin(angle3) + y);
  int endX4 = (int)(branchLength*Math.cos(angle4) + x);
  int endY4 = (int)(branchLength*Math.sin(angle4) + y);
  float sep1 = (float)(Math.random() * 20) + 10;
  float sep2 = (float)(Math.random() * 30) - 15;
  strokeWeight(branchWidth);
  stroke(179, 132, 51);
  
  // draw branches
  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);
  line(x, y, endX3, endY3);
  line(x, y, endX4, endY4);
  
  if(branchLength < 72 && Math.random() >= 0.7) {
    // 30% chance of drawing flower
    fill(227, 195, 220);
    strokeWeight(0.3);
    stroke((int)(Math.random() * 120) + 100, (int)(Math.random() * 70) + 50, (int)(Math.random() * 150) + 50);
    ellipse(x + sep2, y - sep1, 5, 5);
    ellipse(x + 4 + sep2, y + 4 - sep1, (int)(Math.random() * 7) + 3, (int)(Math.random() * 3) + 5);
    ellipse(x + 3 + sep2, y + 8 - sep1, (int)(Math.random() * 7) + 3, (int)(Math.random() * 3) + 5);
    ellipse(x - 4 + sep2, y + 4 - sep1, (int)(Math.random() * 7) + 3, (int)(Math.random() * 3) + 5);
    ellipse(x - 3 + sep2, y + 8 - sep1, (int)(Math.random() * 7) + 3, (int)(Math.random() * 3) + 5);
    fill(255);
    ellipse(x + 2 + sep2, y + 4 - sep1, 3, 3);
   }
  else if(branchLength < 57 && Math.random() >= 0.3) {
    // 50 % chance of drawing a leaf
    fill((int)(Math.random() * 30) + 80, (int)(Math.random() * 100) + 130, (int)(Math.random() * 60) + 100);
    stroke(113, 203, 107);
    ellipse(x + sep2, y + sep2 - 12, (float)(Math.random() * 4) + 3, (float)(Math.random() * 4) + 2); 
  }
  
  if (branchLength > smallestBranch) {
    //draw smaller branches up the tree and flowers
    drawBranches(endX1, endY1, branchLength, angle1, branchWidth * 0.6);
    drawBranches(endX2, endY2, branchLength, angle2, branchWidth * 0.6);
    drawBranches(endX3, endY3, branchLength, angle3, branchWidth * 0.6);
    drawBranches(endX4, endY4, branchLength, angle4, branchWidth * 0.6);
  } 
} 
