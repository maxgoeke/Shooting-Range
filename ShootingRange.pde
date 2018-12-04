Reticle player;

ArrayList<Duck> ducks = new ArrayList<Duck>();

int numDucks = 20;
int score = 0;
int shotsTaken = 0;
int savedTime;

void setup() {
  // config
  noCursor();
  textSize(32);
  
  size(800, 600);
  player = new Reticle(width / 2, height / 2);
  
  // make ducks
  for(int i = 0; i < numDucks; i++) {
    ducks.add(new Duck(-i * 100, int(random(100, height - 100))));
  }
  savedTime = second();
}

void draw() {
  background(255,255,255,0.4);
  
  for(Duck d : ducks) {
    d.display();
    d.move();
  }
  
  player.move(mouseX, mouseY);
  player.display();
  
  fill(0);
  textSize(30);
  text("Score: " + score, 15, 40);
  
  int passedTime = second() - savedTime;
  if(ducks.size() < 1) {
    savedTime = second();
  }
  fill(0);
  text(passedTime + "s", 10, height - 15);
  
  noStroke();
  fill(255,220,0);
  ellipse(width - 10, 10, 100, 100);
  
  if(score >= 20) {
    background(0, 168,0);
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
  } else if(shotsTaken >= 40) {
    background(194,24,7);
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

void mousePressed() {
  player.fire(ducks);
}
