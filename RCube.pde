//      CONST VARS
float x, y;
color red, orange, yellow, green, blue, white;

//      
RubiksCube cube;
int sideLen;

Piece a, b;

void setup() {
  size(800, 600, P3D);

  x = width/2;
  y = height/2;

  red = color(255, 0, 0);
  orange = color(255, 125, 0);
  yellow = color(255, 255, 0);
  green = color(0, 255, 0);
  blue = color(0, 0, 255);
  white = color(255, 255, 255);

  cube = new RubiksCube(100); 
  
}
int temp;
void draw() {
  translate(x, y);
  background(white);
  rotateX(radians(-45));
  rotateY(radians(45));
  
  cube.rMove();
  cube.uMove();
  cube.fMove();
  
  cube.drawCube();
  
  
}
