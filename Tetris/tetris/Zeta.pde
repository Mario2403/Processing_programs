class Zeta extends Piece {

  int pos= 0;


  public Zeta(int x, int y, boolean active) {
    super(x, y, active);
    this.portions = new Portion[4];
    portions[0]= new Portion(this.x, this.y);
    portions[1]= new Portion(this.x+30, this.y);
    portions[2]= new Portion(this.x+30, this.y+30);
    portions[3]= new Portion(this.x+60, this.y+30);
  }

  public void show() {
    pushStyle();
    fill(0, 255, 0);
    for (Portion p : portions) {
      p.show();
    }
    popStyle();
  }
  public void fall() {

    boolean touch=false;

    for (Portion p : portions) {
      if (p.touchEdgesBottom()) {
        this.bottom=true;
        this.active=false;
        return;
      }
    }
    if (!touch) {
      for (Portion p : portions) {
        p.y+=30;
      }
    }
  }

  public void rotation() {
    if (this.active) {
      if (this.pos==0) {
        portions[0].setPosition(portions[0].x+60, portions[0].y-30);
        portions[1].setPosition(portions[1].x+30, portions[1].y);
        portions[2].setPosition(portions[2].x, portions[2].y-30);
        portions[3].setPosition(portions[3].x-30, portions[3].y);
        this.pos=1;
      } else {
        portions[0].setPosition(portions[0].x-60, portions[0].y+30);
        portions[1].setPosition(portions[1].x-30, portions[1].y);
        portions[2].setPosition(portions[2].x, portions[2].y+30);
        portions[3].setPosition(portions[3].x+30, portions[3].y);
        this.pos=0;
      }
    }
  }

  public void moveLeft() {
    boolean edge=false;
    for (Portion p : portions) {
      if (p.touchEdgesSides()==1) edge=true;
    }
    if (!edge) {
      for (Portion p : portions) {
        p.x-=30;
      }
    }
  }

  public void moveRight() {
    boolean edge=false;
    for (Portion p : portions) {
      if (p.touchEdgesSides()==2) edge=true;
    }
    if (!edge) {
      for (Portion p : portions) {
        p.x+=30;
      }
    }
  }


  public boolean touchsOther(ArrayList<Piece> pieces) {
    for (Piece p : pieces) {
      if (p!=this) {
        for (Portion port : this.portions) {
          for (Portion otherPortion : p.portions) {
            if (port.y+30==otherPortion.y && port.x==otherPortion.x ) {
              this.active=false;
              this.bottom=true;
              this.visible=true;
              return true;
            }
          }
        }
      }
    }
    return false;
  }
}