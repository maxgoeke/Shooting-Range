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
  }
}
