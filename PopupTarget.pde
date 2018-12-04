public class PopupTarget {
  
  private PVector pos;
  private int w = 30, h = 0, maxH = -30;
  private int speed = 10;
  
  // time stuff
  private long mark = 0;
  private long timeBetween = 2000; // ms between popup
  private long timeUp = 1000; // ms while up
  
  private boolean up = false; // target starts hidden
  
  public PopupTarget(int x, int y) {
    pos = new PVector(x, y);
  }
  
  public void move() {
    // time to popup
    if(millis() - mark > timeBetween) {
       up = true;
       mark = millis(); 
    }
    
    if(up) {
      if(millis() - mark < timeUp) {
         speed = 10;
      } else {
        up = false;
        mark = millis();
        speed = -10;
      }
    }
    
    h -= speed;
    h = constrain(h, maxH, 0);
  }
  
  public void display() {
    noStroke();
    fill(255, 0, 0);
    ellipse(pos.x, pos.y, w, h);
  }
  
}
