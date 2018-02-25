class Celda {
  int x, y, w;
  boolean revealed=false;

  Celda(int x, int y, int w) {
    this.x=x;
    this.y=y;
    this.w=w;
  }

  void show() {
    stroke(200);
    if (this.revealed) {
      fill(0);
    } else {
      fill(245);
    }
    rect(this.x, this.y, this.x+this.w, this.y+this.w);
  }
}