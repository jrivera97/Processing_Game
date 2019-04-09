int x, y;
PImage im;
Menu m;

void setup() {
  size (600, 379);
  im = loadImage("desert.jpg");
  m = new Menu();
  x = 0;
  y = 0;
}

void draw() {
  background(im);
  m.MenuDisplay();
  m.MenuUpdate();
  //rect(x, y, 25,25);
  keyPressed();
}

void mouseClicked() {
  m.mouseClicked();
}

void keyPressed() {
  if (keyCode == UP) {
    y -= 1;
  } else if (keyCode == DOWN) {
    y += 1;
  } else if (keyCode == LEFT) {
    x -= 1;
  } else if (keyCode == RIGHT) {
    x += 1;
  }
}
