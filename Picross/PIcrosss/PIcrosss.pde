Celda[][] celdas= new Celda[10][10];
int w= 600/10;

void setup() {
  size(650, 650);
  background(245);

  for (int i=0; i<celdas.length; i++) {
    for (int j=0; j<celdas[0].length; j++) {
      celdas[i][j]= new Celda(i*w + 50, j*w + 50,w);
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