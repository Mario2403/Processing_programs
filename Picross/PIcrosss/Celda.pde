class Celda {
  int x, y, w;
  boolean revealed=false;

  Celda(int x, int y, int w) {
    this.x=x;
    this.y=y;
    this.w=w;
  }

  void show() {
    checkMouse();
    stroke(200);
    if (this.revealed) {
      fill(0);
    } else {
      fill(245);
    }
    rect(this.x, this.y, this.x+this.w, this.y+this.w);
  }
  
  
void checkMouse() {
  println(mouseX + " " + mouseY);
  if(keyCode=)
  if(mouseX>=this.x && mouseX<=this.x*this.w && mouseY>=this.y && mouseY<=this.y*this.w)
  this.revealed= true;
}

}