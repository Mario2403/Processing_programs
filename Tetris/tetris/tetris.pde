import processing.sound.*;
int grid=30;

SoundFile mainOST;

ArrayList<Piece> pieces= new ArrayList();

void setup() {

  size(300, 600);
  mainOST = new SoundFile(this, "OST.mp3");
  mainOST.loop();
  frameRate(5);
}

void draw() {

  background(0);

  boolean actual=false;
  for (Piece p : pieces) {
    for (Portion portion : p.portions) {
      if (portion.y==0) {
        noLoop();
      }
    }
  }

  for (Piece p : pieces) {
    if (p.active) actual=true;
  }

  if (!actual) {
    int r= (int)floor(random(7));
    if (r==0) pieces.add(new J(floor(random(7))*30, 0, true));
    else if (r==1) pieces.add(new L(floor(random(7))*30, 0, true));
    else if (r==2) pieces.add(new Zeta(floor(random(7))*30, 0, true));
    else if (r==3) pieces.add(new Stick(floor(random(7))*30, 0, true));
    else if (r==4) pieces.add(new S(floor(random(7))*30, 0, true));
    else if (r==5) pieces.add(new Square(floor(random(7))*30, 0, true));
    else if (r==6) pieces.add(new T(floor(random(7))*30, 0, true));
  }

  for (Piece p : pieces) {
    if (p.active || p.bottom) {
      p.show();
      if (!p.touchsOther(pieces))
        p.fall();
    }
  }

  checkLines();
}

void checkLines() {

  for (int i=1; i<10; i++) {
    int cont=0;
    for (Piece p : pieces) {
      for (Portion portion : p.portions) {
        if (portion.y==height-(i*30) && p.bottom) cont++;
      }
    }
    if (cont==10) deleteLine(i);
  }
}

void deleteLine(int line) {
  for (Piece p : pieces) {
    for (Portion portion : p.portions) {
      if (portion.y==height-(line*30)) { 
        portion.x=500;
      }
    }
  }
  fallAll(line);
}

void fallAll(int line) {
  for (Piece p : pieces) {
    for (Portion portion : p.portions) {
      if (portion.y<=height-(line*30))
        portion.y+=30;
    }
  }
}
void keyPressed() {
  if (keyCode==LEFT) {

    for (Piece p : pieces) {
      if (p.active) {
        p.moveLeft();
      }
    }
  }
  if (keyCode==RIGHT) {

    for (Piece p : pieces) {
      if (p.active) {
        p.moveRight();
      }
    }
  }
  if (keyCode==UP || keyCode==DOWN) {

    for (Piece p : pieces) {
      if (p.active) {
        p.rotation();
      }
    }
  }
}