public abstract class Piece {
  int x, y;
  boolean active=false;
  boolean bottom=false;
  boolean visible=false;
  Portion[] portions;

  public Piece(int x, int y, boolean active) {
    this.x=x;
    this.y=y;
    this.active=active;
  }
  public abstract void show();
  public abstract void fall();
  public abstract void rotation();
  public abstract void moveLeft();
  public abstract void moveRight();
  public abstract boolean touchsOther(ArrayList<Piece> pieces);
}