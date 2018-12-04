public class Duck {
  private PVector pos;
  private PVector vel;
  private int w = 40, h = 40;
  
  public Duck(int x, int y) {
    pos = new PVector(x, y);
    vel = new PVector(5, 0);
  }
  
  void move() {
    vel.x = random(0, 15);
    vel.y = random(-4, 4);
    pos.y = constrain(pos.y, 100, height-100);
    pos.add(vel);
    if(pos.x > width) {
      pos.x = 0;
    }
  }
  
  void display() {
    fill(81,106,93); // rgb 
    noStroke(); // turn off the border
    ellipse(pos.x, pos.y, w, h);
  }
}
