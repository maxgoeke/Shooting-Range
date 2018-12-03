public class Magazine {
  
  // instance variables
  private int numBullets;
  private int capacity;
  
  // constructor
  public Magazine(int numBullets) {
    this.numBullets = numBullets;
    this.capacity = numBullets;
  }
  
  public boolean add() {
    if(numBullets < 40) {    
      numBullets++;
      return true;
    }
    return false;
  }
  
  public boolean remove() {
    if(numBullets > 0) {
      --numBullets;
      shotsTaken++;
      return true;
    }
    return false;
  }
  
  public void display() {
    fill(0);
    textSize(18);
    text(numBullets, width/2 + 170, height - 10);
    for(int i = 0; i < numBullets/2; i++) {
        fill(0);
        rect(i*10 + (width/2 + 200), height - 30, 1, 10);
        rect(i*10 + (width/2 + 200), height - 15, 1, 10);
    }
    
    if(numBullets < 1) {
      final float shootingPctg = ((float)score / shotsTaken);
      fill(0);
      rect(width/6, height/4, 2*width/3, height/2, 7);
      fill(255);
      textSize(40);
      text("Game over.", width / 3 + 40, height /2);
      textSize(20);
      text("Final Score: " + score, width / 3 + 40, height /2 + 40);
      text("Shots taken: " + (shotsTaken), width / 3 + 40, height /2 + 60);
      text("Shooting Percentage: " + (shootingPctg * 100) + "%", width / 3 + 40, height /2 + 80);
    }
  }
}
