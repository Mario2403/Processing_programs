class Celda {
  private int x, y, w, i, j;
  private boolean revealed=false;
  private boolean error=false;


  public Celda(int x, int y, int w, int i, int j) {
    this.x=x;
    this.y=y;
    this.w=w;
    this.i=i;
    this.j=j;
  }

  void show() {
    stroke(200);
    fill(245);
    rect(this.x, this.y, this.x, this.y);
  }



  boolean checkMouse() {

    //println(mouseX/60 + " " + mouseY/60);

    return (mouseX>=this.x && mouseX<=this.x+this.w && mouseY>=this.y && mouseY<=this.y+this.w && mousePressed);
  }

  void drawX() {

    strokeWeight(12);
    stroke(255, 0, 0);
    line(this.x, this.y, this.x+this.w, this.y+this.w);
    line(this.x+this.w, this.y, this.x, this.y+this.w);
    //println(this.i +"  "+ this.j);
  }
  void drawBlack() {
    stroke(0);
    noStroke();
    fill(0);
    rect(this.x, this.y, this.w, +this.w);
  }

  void reveal(Pattern pattern) {

    if (pattern.draw[this.i][this.j]) {
      drawBlack();
    } else {
      drawX();
    }
  }
}