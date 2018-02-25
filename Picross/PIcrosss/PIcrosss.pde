Celda[][] celdas= new Celda[10][10];
int w= 600/10;

void setup() {
  size(600, 600);
  background(245);

  for (int i=0; i<celdas.length; i++) {
    for (int j=0; j<celdas[0].length; j++) {
      celdas[i][j]= new Celda(i*w, j*w, w);
    }
  }
}

void draw() {

  for (int i=0; i<celdas.length; i++) {
    for (int j=0; j<celdas.length; j++) {
      celdas[i][j].show();
    }
  }
}
void mousePressed() {
  println(mouseX + " " + mouseY);
  celdas[mouseX/60][mouseY/60].revealed=true;
  
}