boolean startHover, quitHover;
boolean start, quit;
boolean level1Hover, level2Hover;
boolean level1, level2;
PImage im;
int x, y;
Snake s;
float count;
import ddf.minim.*; 
AudioPlayer bite;
AudioPlayer background;
Minim minim;

void setup() {
  size (600, 379);
  im = loadImage("desert.jpg");
  minim = new Minim(this);
  bite = minim.loadFile("Bite-Sound.mp3");
  background = minim.loadFile("background.mp3");
  
  startHover = false;
  quitHover = false;
  start = false;
  quit = false;
  level1Hover = false;
  level2Hover = false;
  level1 = false;
  level2 = false;
  s = new Snake();
}

void draw() {
  background(im);
  // check if mouse is over either button box
  if (mouseX > 50 && mouseX < 250 && mouseY > 250 && mouseY < 325) {
    startHover = true;
    quitHover = false;
  } else if (mouseX > 350 && mouseX < 550 && mouseY > 250 && mouseY < 325) {
    startHover = false;
    quitHover = true;
  } else {
    startHover = false;
    quitHover = false;
  }
  // check if mouse is over either level choice
  if (mouseX > 250 && mouseX < 350 && mouseY > 125 && mouseY < 200) {
      level1Hover = true;
      level2Hover = false;
  } else if (mouseX > 400 && mouseX < 500 && mouseY > 125 && mouseY < 200) {
      level1Hover = false;
      level2Hover = true;
  } else {
    level1Hover = false;
    level2Hover = false;
    if (level1) {
      level1Hover = true;
      level2Hover = false;
    }
    if (level2) {
      level1Hover = false;
      level2Hover = true;
    }
  }

  textSize(65);
  textAlign(CENTER, TOP);
  text("Welcome to Snake", width/2, 20);
  noFill();
  strokeWeight(5);

  textSize(55);
  text("Level: ", 130, 135);
  text("1", 300, 135);
  text("2", 450, 135);

  // underline "1"
  if (level1Hover) {
    line(280, 200, 320, 200);
  }
  // underline "2"
  else if (level2Hover) {
    line(430, 200, 470, 200);
  }

  textSize(65);
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

  // call code to play the game
  if (start) {
    background.play();
    float res = s.moveSnake();
    if (res >= 40) {
      String str = "Game Over \n you score: ";
      str += res;
      background(im);
      textSize(65);
      textAlign(CENTER, TOP);
      text(str, width/2, 20);
    }
    s.keyPressed();

    // implement levels
    if (level1) {
      frameRate(50);
    }
    if (level2) {
      frameRate(100);
    }
  }
}

void mouseClicked() {
  // if the user clicks start
  if (startHover) {
    start = true;
    quit = false;
  }
  // if the user clicks quit
  if (quitHover) {
    exit();
  }
  // if the user clicks level 1
  if (level1Hover) {
    level1 = true;
  }
  // if the user clicks level 2
  if (level2Hover) {
    level2 = true;
  }
}
