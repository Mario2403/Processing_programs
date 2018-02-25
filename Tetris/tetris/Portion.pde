class Portion {

  int x, y;


  public Portion(int x, int y) {
    this.x=x;
    this.y=y;
  }

  public void show() {
    rect(this.x, this.y, 30, 30);
  }
  public boolean touchEdgesBottom() {
    if (this.y!=height && this.y+30!=height) return false;
    return true;
  }

  public int touchEdgesSides() {
    if (this.x==0) return 1;
    if (this.x+30==width) return 2;
    return 0;
  }


  public void setPosition(int x, int y) {
    this.x=x;
    this.y=y;
  }
}