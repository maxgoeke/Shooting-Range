public class Reticle {
  // variables
  private PVector pos;
  private int w = 50, h = 50;
  private Magazine mag;
  
  // constructors
  public Reticle(int x, int y) {
    pos = new PVector(x, y);
    mag = new Magazine(40);
  }
  
  // methods
  public void move() {
  }
  public void move(int x, int y) {
    pos.x = x;
    pos.y = y;
  }
  public void display() {
    noFill();
    noCursor();
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
    
    if(ducks.size() < 1) {
      final float shootingPctg = ((float)score / shotsTaken);
      fill(0);
      rect(width/6, height/4, 2*width/3, height/2, 7);
      fill(255);
      textSize(40);
      text("You win!", width / 3 + 40, height /2);
      textSize(20);
      text("Final Score: " + score, width / 3 + 40, height /2 + 40);
      text("Shots taken: " + (shotsTaken), width / 3 + 40, height /2 + 60);
      text("Shooting Percentage: " + (shootingPctg * 100) + "%", width / 3 + 40, height /2 + 80);
    }
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
