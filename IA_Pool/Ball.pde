class Ball {

  float radius=30;
  int number=8;
  Body body;
  color col;
  boolean sunk=false;
  Box2DProcessing world;

  Ball(float x, float y, Box2DProcessing world, color col) {

    this.col=col;
    this.world=world;

    BodyDef bd= new BodyDef();
    bd.type=BodyType.DYNAMIC;
    bd.position.set(world.coordPixelsToWorld(x, y));
    body = world.createBody(bd);

    CircleShape cs = new CircleShape();
    cs.setRadius(radius);


    FixtureDef fd= new FixtureDef();
    fd.shape=cs;
    fd.density=0.0000001;
    fd.friction = 0.001;
    fd.restitution = 0.8;

    body.createFixture(fd);
  }


  void show() {

    if (!sunk) {

      Vec2 pos = world.getBodyPixelCoord(body);

      pushMatrix();
      translate(pos.x, pos.y);
      fill(col);
      noStroke();
      ellipse(0, 0, 2*radius, 2*radius);
      fill(255);
      ellipse(0, 0, radius-8, radius-8);
      fill(0);
      textSize(15);
      text(this.number, -6, 5);
      popMatrix();
    }
  }
}