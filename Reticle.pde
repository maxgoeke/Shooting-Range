public class Reticle {
  // variables
  private PVector mousePos;
  private PVector target;
  private PVector vel;
  private PVector pos;
  private float drag;
  private float strength;
  private int r = 40;
  private PVector force;
  
  private int w = 50, h = 50;
  private Magazine mag;
  
  // constructors
  public Reticle(int x, int y) {
    pos = new PVector(x, y);
    mousePos = new PVector(0, 0);
    target = new PVector(0, 0);
    vel = new PVector(0, 0);
    
    drag = 0.86; //need to take some force away, 1 = no drag
    strength = 0.04; // the "strength" of the spring, out of 1
    
    mag = new Magazine(40);
  }
  
  // methods
  public void move() {
  }
  public void move(int x, int y) {
    mousePos.set(x, y);
    target = mousePos;

    force = target.sub(pos);
    force.mult(strength);
    vel.mult(drag);
    vel.add(force);  
    pos.add(vel);
  }
  public void display() {
    noFill();
    noCursor();
    //background(255,255,255,0.4);
    stroke(0);
    strokeWeight(2);
    int hy = -21;
    
    line(pos.x, pos.y - h/2 - hy, pos.x, pos.y + h/2 + hy);
    line(pos.x - w/2 - hy, pos.y, pos.x + w/2 + hy, pos.y);
    point(pos.x - w/2 - hy + 4, pos.y - h/2 + 35);
    point(pos.x - w/2 - hy + 4, pos.y - h/2 + 40);
    point(pos.x - w/2 - hy + 4, pos.y - h/2 + 45);
    point(pos.x - w/2 - hy + 4, pos.y - h/2 + 5);
    point(pos.x - w/2 - hy + 4, pos.y - h/2 + 10);
    point(pos.x - w/2 - hy + 4, pos.y - h/2 + 15);
    
    point(pos.x - w/2 - hy + 14, pos.y - h/2 + 25);
    point(pos.x - w/2 - hy + 19, pos.y - h/2 + 25);
    point(pos.x - w/2 - hy + 24, pos.y - h/2 + 25);
    point(pos.x - w/2 - hy - 6, pos.y - h/2 + 25);
    point(pos.x - w/2 - hy - 11, pos.y - h/2 + 25);
    point(pos.x - w/2 - hy - 16, pos.y - h/2 + 25);
    ellipse(pos.x, pos.y, w, h);
    
    mag.display();
  }
  
  public void fire(ArrayList<Duck> ducks) {
    // compare the target against the ducks...
    // if overlapping, destroy the duck
    if (mag.remove()) {
      for(int i = 0; i < ducks.size(); i++) {
        Duck duck = ducks.get(i);
        float distance = dist(pos.x, pos.y, duck.pos.x, duck.pos.y);
        int radius = duck.w / 2;
        if (distance < radius) {
          score++;
          ducks.remove(duck);
        }
      }
    }
  }
}
