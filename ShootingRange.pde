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
  background(255);
  
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
}

void mousePressed() {
  player.fire(ducks);
}
