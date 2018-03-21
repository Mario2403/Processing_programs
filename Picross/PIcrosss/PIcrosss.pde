Celda[][] celdas= new Celda[10][10];
int w= 600/10;
Pattern pattern=new Pattern();
void setup() {

  size(900, 900);
  background(200);

  for (int i=0; i<celdas.length; i++) {
    for (int j=0; j<celdas[0].length; j++) {

      celdas[i][j]= new Celda(i*w + 300, j*w + 300, w, i, j);

      celdas[i][j].show();
    }
  }
  drawNumbers();
}

void draw() {

  for (int i=0; i<celdas.length; i++) {
    for (int j=0; j<celdas.length; j++) {

      if (celdas[i][j].checkMouse()) {
        celdas[i][j].reveal(pattern);
      }
    }
  }
}

void drawRows() {
  fill(0);
  textSize(36);

  for (int i= 0; i<10; i++) {
    ArrayList<Integer> actual= pattern.rowNumbers.get(i);
    for (int j=0; j<actual.size(); j++) {
      text(actual.get(actual.size()-1-j), 240-(j*60), i*60 + 340 );
    }
  }
}

void drawNumbers() {
  drawCols();
  drawRows();
}

void drawCols() {
  fill(0);
  textSize(36);

  for (int i= 0; i<10; i++) {
    ArrayList<Integer> actual= pattern.colNumbers.get(i);
    for (int j=0; j<actual.size(); j++) {
      text(actual.get(actual.size()-1-j), i*60 + 310, 270-(j*60) );
    }
  }
}
//text(pattern.rowNumbers.get(i).get(0), 240, i*60 + 340);