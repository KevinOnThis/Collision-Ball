PVector loc, vel, acc;
PVector mouse;
int sz = 70;

void setup() {
  size(800, 600);
  //initialize loc, vel, and acc
  loc = new PVector(width/2, height/2);
  vel = PVector.random2D();                //random Unit Vector
  acc = new PVector(0, 0);
  noCursor();
  mouse = new PVector();
}

void draw() {
  mouse.set(mouseX, mouseY);
  background(0);
  //move ball
  vel.add(acc);
  loc.add(vel);

  //check to see if mouse is inside the balls
  if (loc.dist(mouse) < sz/2) {
    fill(255, 0, 0);
    vel.mult(-1);
  } else {
    fill(0, 200, 55);

    //draw the balls
    ellipse(loc.x, loc.y, sz, sz);

    //bounce the balls
    if (loc.x + sz/2 > width || loc.x - sz/2 < 0) {
      vel.x *= -1;
    }
    if (loc.y + sz/2 > height || loc.y - sz/2 < 0) {
      vel.y *= -1;
    }

    //draw a small circle to indicate where the mouse is
    fill(255);
    ellipse(mouse.x, mouse.y, 5, 5);
  }
}

