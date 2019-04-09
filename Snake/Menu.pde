class Menu {
  Menu() {
  }
  int x, y;
  PImage im;
  boolean coin;
  float coinX;
  float coinY;
  Coin c;

  void setup() {
    size (600, 379);
    im = loadImage("desert.jpg");
    x = 0;
    y = 0;
    coin = false;
    coinX = width/2;
    coinY = height/2;
    c = new Coin(coinX, coinY, coin);
  }

  void draw() {
    background(im);
    keyPressed();
    c.gotCoin();
    fill(255);
    rect(int(x/25)*25, int(y/25)*25, 25, 25);
  }

  void keyPressed() {
    //TODO: only allow these keys, do not turn around when opposite direction pressed
    //minor bug fixes
    //levels and border check
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
}
