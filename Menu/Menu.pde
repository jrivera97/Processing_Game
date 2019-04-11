boolean startHover, quitHover;
boolean start, quit;
PImage im;
int x, y;
Snake s;

void setup() {
  size (600, 379);
  im = loadImage("desert.jpg");
  startHover = false;
  quitHover = false;
  start = false;
  quit = false;
  s = new Snake();
}

void draw() {
  background(im);
  if (mouseX > 50 && mouseX < 250 && mouseY > 250 && mouseY < 325) {
    startHover = true;
    quitHover = false;
  }
  else if (mouseX > 350 && mouseX < 550 && mouseY > 250 && mouseY < 325) {
    startHover = false;
    quitHover = true;
  }
  else {
    startHover = false;
    quitHover = false;
  }
  textSize(65);
  textAlign(CENTER, TOP);
  text("Welcome to Snake", width/2, 20);
  noFill();
  strokeWeight(5);

  // blow up start box on hover
  if (startHover) {
    rect(40, 240, 220, 95);
    text("Start", 150, 250);
    rect(350, 250, 200, 75);
    text("Quit", 450, 250);
  }
  // blow up quit box on hover
  else if (quitHover) {
    rect(50, 250, 200, 75);
    text("Start", 150, 250);
    rect(340, 240, 220, 95);
    text("Quit", 450, 250);
  }
  // display menu normally
  else {
    rect(50, 250, 200, 75);
    text("Start", 150, 250);
    rect(350, 250, 200, 75);
    text("Quit", 450, 250);
  }
  
  if(start){
    // call Jose's code
    
    s.moveSnake();
    s.keyPressed();
  }
  
}

void mouseClicked() {
  if (startHover) {
    start = true;
    quit = false;
  }
  if (quitHover) {
    exit();
  }
}
