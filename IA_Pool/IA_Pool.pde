import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d = new Box2DProcessing(this);

void setup() {

  size(1100, 500);

  box2d.createWorld();
  box2d.setGravity(0, 0);

 
}
void draw() {
  background(0, 80, 0);
  box2d.step(); 
  
  
  
}