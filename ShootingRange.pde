Reticle player;

ArrayList<Duck> ducks = new ArrayList<Duck>();

int numDucks = 20;
int score = 0;
int shotsTaken = 0;
int savedTime;
float shootingPctg;

PopupTarget pop = new PopupTarget(400, 400);

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
  
  pop.move();
  pop.display();
  
  for(Duck d : ducks) {
    d.display();
    d.move();
  }
  
  player.move(mouseX, mouseY);
  player.display();
  
  fill(0);
  textSize(30);
  text("Score: " + score, 15, 40);
  
  // IN GAME STAT BOX
  noFill();
  stroke(255, 0, 0);
  strokeWeight(2);
  rect(-5, height - 67, 3*width / 8, 80);
  int passedTime = second() - savedTime;
  if(ducks.size() < 1) {
    savedTime = second();
  }
  fill(0);
  textSize(16);
  text("Time: " + passedTime + "s", 5, height - 45);
  text("Score: " + score, 160, height - 45);
  text("Shots Taken: " + shotsTaken, 160, height - 30);
  float shootingPctg = ((float)score / shotsTaken * 100);
  text("Shooting %: " + shootingPctg, 160, height - 15);
  
  // SUN
  noStroke();
  fill(255,220,0);
  ellipse(width - 10, 10, 100, 100);
  
  
  // END GAME
  if(score >= 20) {
    background(0, 168,0);
    fill(0);
    rect(width/6, height/4, 2*width/3, height/2, 7);
    fill(255);
    textSize(40);
    text("You win!", width / 3 + 40, height /2);
    textSize(20);
    text("Final Score: " + score, width / 3 + 40, height /2 + 40);
    text("Shots taken: " + (shotsTaken), width / 3 + 40, height /2 + 60);
    text("Shooting Percentage: " + shootingPctg + "%", width / 3 + 40, height /2 + 80);
  } else if(shotsTaken >= 40) {
    background(194,24,7);
    fill(0);
    rect(width/6, height/4, 2*width/3, height/2, 7);
    fill(255);
    textSize(40);
    text("Game over.", width / 3 + 40, height /2);
    textSize(20);
    text("Final Score: " + score, width / 3 + 40, height /2 + 40);
    text("Shots taken: " + (shotsTaken), width / 3 + 40, height /2 + 60);
    text("Shooting Percentage: " + shootingPctg + "%", width / 3 + 40, height /2 + 80);
  }
}

void mousePressed() {
  player.fire(ducks);
}
