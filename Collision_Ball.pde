PVector loc, vel, acc;
int sz = 70;

void setup() {
  size(800, 600);
  //initialize loc, vel, and acc
  loc = new PVector(width/2, height/2);
  vel = PVector.random2D();                //random Unit Vector
  acc = new PVector(0, 0);
  noCursor();
}

void draw() {
  background(0);
  //move ball
  vel.add(acc);
  loc.add(vel);

  //check to see if mouse is inside the ball
  if (dist(mouseX, mouseY, loc.x, loc.y) < sz/2) {
    fill(255, 0, 0);
  } else {
    fill(0, 200, 55);
  }
  
  //draw the ball
  ellipse(loc.x, loc.y, sz, sz);
  
  //bounce the ball
  if(loc.x + sz/2 > width || loc.x - sz/2 < 0){
    vel.x *= -1;
  }
  if(loc.y + sz/2 > height || loc.y - sz/2 < 0){
    vel.y *= -1;
  }
  
  //draw a small circle to indicate where the mouse is
  ellipse(mouseX, mouseY, 5, 5);
}

