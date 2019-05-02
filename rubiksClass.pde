class RubiksCube {
  // Store size and Pieces of RubiksCube
  int size;
  Piece[] corners;
  String midTurn;

  // Initialize based on size;
  RubiksCube(int size) {
    this.size = size;
    corners = new Piece[8];  
    midTurn = "N";

    corners[0] = new Piece((float)size/4, (float)size/4, (float)size/4, size/4, "V"); //DFR
    corners[1] = new Piece((float)size/4, (float)size/4, -(float)size/4, size/4, "W"); //DBR
    corners[2] = new Piece(-(float)size/4, (float)size/4, -(float)size/4, size/4, "X"); //DBL
    corners[3] = new Piece(-(float)size/4, (float)size/4, (float)size/4, size/4, "U"); //DFL
    corners[4] = new Piece((float)size/4, -(float)size/4, (float)size/4, size/4, "C"); //UFR
    corners[5] = new Piece((float)size/4, -(float)size/4, -(float)size/4, size/4, "B"); //UBR
    corners[6] = new Piece(-(float)size/4, -(float)size/4, -(float)size/4, size/4, "A"); //UBL
    corners[7] = new Piece(-(float)size/4, -(float)size/4, (float)size/4, size/4, "D"); //UFL
  }

  // Draw cube based on Pieces
  void drawCube() {
    for (int i = 0; i < 8; i++) {
      corners[i].drawPiece();
    }
  }

  void swapCorners(int a, int b) {
    Piece temp = corners[a];
    corners[a] = corners[b]; 
    corners[b] = temp;
  }

  void rotFourCorners(int a, int b, int c, int d, float x, float y, float z) {
    corners[a].xR += x;
    corners[b].xR += x;
    corners[c].xR += x;
    corners[d].xR += x;
    corners[a].yR += y;
    corners[b].yR += y;
    corners[c].yR += y;
    corners[d].yR += y;
    corners[a].zR += z;
    corners[b].zR += z;
    corners[c].zR += z;
    corners[d].zR += z;
  }

  void uMove() {
    if (midTurn == "N") {
      midTurn = "U";
    }

    if (midTurn == "U") {
      rotFourCorners(4, 5, 6, 7, 0, -4, 0);

      if (corners[4].yR <= -90) {
        midTurn = "N";

        Piece temp = new Piece((float)size/4, -(float)size/4, (float)size/4, size/4, "C");
        corners[4].uPMove(corners[7]);
        corners[7].uPMove(corners[6]);
        corners[6].uPMove(corners[5]);
        corners[5].uPMove(temp);

        swapCorners(4, 7);
        swapCorners(4, 6);
        swapCorners(4, 5);
      }
    }
  }

  void fMove() {
    if (midTurn == "N") {
      midTurn = "F";
    }

    if (midTurn == "F") {
      
      rotFourCorners(0, 3, 4, 7, 0, 0, 4);

      if (corners[0].zR >= 90 ) {
        midTurn = "N";

        Piece temp = new Piece((float)size/4, (float)size/4, (float)size/4, size/4, "V");
        corners[0].fPMove(corners[3]);
        corners[3].fPMove(corners[7]);
        corners[7].fPMove(corners[4]);
        corners[4].fPMove(temp);

        swapCorners(0, 3);
        swapCorners(0, 7);
        swapCorners(0, 4);
      }
    }
  }

  void rMove() {
    if (midTurn == "N") {
      midTurn = "R";
    }

    if (midTurn == "R") {

      rotFourCorners(0, 1, 4, 5, 4, 0, 0);

      if (corners[0].xR >= 90) {
        midTurn = "N";

        Piece temp = new Piece((float)size/4, (float)size/4, (float)size/4, size/4, "V");
        corners[0].rPMove(corners[4]);
        corners[4].rPMove(corners[5]);
        corners[5].rPMove(corners[1]);
        corners[1].rPMove(temp);

        swapCorners(0, 4);
        swapCorners(0, 5);
        swapCorners(0, 1);
      }
    }
  }
}
