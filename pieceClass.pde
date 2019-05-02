class Piece {
  float x, y, z;
  float xR, yR, zR;
  int sideLen;
  color[] colors;
  String id;

  Piece(float x, float y, float z, int sideLen, String id) {
    this.id = id;
    
    // Store location of Piece
    this.x = x;
    this.y = y;
    this.z = z;

    // Store rotation of Piece
    this.xR = 0;
    this.yR = 0;
    this.zR = 0;
    this.sideLen = sideLen;

    // Stores colors in order UFRBLD
    this.colors = new color[] {yellow, orange, blue, red, green, white};
    
    switch(id.charAt(0)) {
      case 'A':
        colors[1] = 0;
        colors[2] = 0;
        colors[5] = 0;
        break;
      case 'B':
        colors[1] = 0;
        colors[4] = 0;
        colors[5] = 0;
        break;
      case 'C':
        colors[3] = 0;
        colors[4] = 0;
        colors[5] = 0;
        break;
      case 'D':
        colors[2] = 0;
        colors[3] = 0;
        colors[5] = 0;
        break;
      case 'U':
        colors[0] = 0;
        colors[2] = 0;
        colors[3] = 0;
        break;
      case 'V':
        colors[0] = 0;
        colors[3] = 0;
        colors[4] = 0;
        break;
      case 'W':
        colors[0] = 0;
        colors[1] = 0;
        colors[4] = 0;
        break;
      case 'X':
        colors[0] = 0;
        colors[1] = 0;
        colors[2] = 0;
        break;
    }
  }

  // Draw the Piece based on location and rotation
  void drawPiece() {
    x = x % 360;
    y = y % 360;
    z = z % 360;

    pushMatrix();
    rotateX(xR*PI/180);
    rotateY(yR*PI/180);
    rotateZ(zR*PI/180);

    translate(x, y, z);

    fill(colors[0]);
    beginShape();
    vertex(  sideLen, -sideLen, sideLen);
    vertex(  sideLen, -sideLen, -sideLen);
    vertex( -sideLen, -sideLen, -sideLen);
    vertex( -sideLen, -sideLen, sideLen);
    vertex(  sideLen, -sideLen, sideLen);
    endShape();

    fill(colors[1]);
    beginShape();
    vertex(  sideLen, sideLen, sideLen);
    vertex(  sideLen, -sideLen, sideLen);
    vertex( -sideLen, -sideLen, sideLen);
    vertex( -sideLen, sideLen, sideLen);
    vertex(  sideLen, sideLen, sideLen);
    endShape();

    fill(colors[2]);
    beginShape();
    vertex(  sideLen, sideLen, sideLen);
    vertex(  sideLen, -sideLen, sideLen);
    vertex(  sideLen, -sideLen, -sideLen);
    vertex(  sideLen, sideLen, -sideLen);
    vertex(  sideLen, sideLen, sideLen);
    endShape();

    fill(colors[3]);
    beginShape();
    vertex(  sideLen, sideLen, -sideLen);
    vertex(  sideLen, -sideLen, -sideLen);
    vertex( -sideLen, -sideLen, -sideLen);
    vertex( -sideLen, sideLen, -sideLen);
    vertex(  sideLen, sideLen, -sideLen);
    endShape();

    fill(colors[4]);
    beginShape();
    vertex( -sideLen, sideLen, sideLen);
    vertex( -sideLen, -sideLen, sideLen);
    vertex( -sideLen, -sideLen, -sideLen);
    vertex( -sideLen, sideLen, -sideLen);
    vertex( -sideLen, sideLen, sideLen);
    endShape();

    fill(colors[5]);
    beginShape();
    vertex(  sideLen, sideLen, sideLen);
    vertex(  sideLen, sideLen, -sideLen);
    vertex( -sideLen, sideLen, -sideLen);
    vertex( -sideLen, sideLen, sideLen);
    vertex(  sideLen, sideLen, sideLen);
    endShape();
    popMatrix();

    pushMatrix();
    translate(x, y, z);
    popMatrix();
  }
  
  void colorSwitch(int a, int b) {
    color temp = colors[a];
    colors[a] = colors[b];
    colors[b] = temp;
  }
  
  void uPMove(Piece newLoc) {
    colorSwitch(1, 4);
    colorSwitch(1, 3);
    colorSwitch(1, 2);
    
    x = newLoc.x;
    y = newLoc.y;
    z = newLoc.z;
    
    yR = 0;
  }
  
  void fPMove(Piece newLoc) {
    colorSwitch(0, 2);
    colorSwitch(0, 5);
    colorSwitch(0, 4);
    
    x = newLoc.x;
    y = newLoc.y;
    z = newLoc.z;
    
    zR = 0;
  }
  
  void rPMove(Piece newLoc) {
    colorSwitch(0, 3);
    colorSwitch(0, 5);
    colorSwitch(0, 1);
    
    x = newLoc.x;
    y = newLoc.y;
    z = newLoc.z;
    
    xR = 0;
  }
}
