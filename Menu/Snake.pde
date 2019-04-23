class Snake {
  float x, y;
  PImage im;
  boolean coin;
  float coinX;
  float coinY;
  Coin c;
  int prev = 0;

  // constructor
  Snake() {
    im = loadImage("desert.jpg");
    x = 0;
    y = 0;
    coin = false;
    coinX = width/2;
    coinY = height/2;
    c = new Coin(coinX, coinY, coin);
  }

  float moveSnake() {
    background(im);
    keyPressed();
    float res = c.gotCoin(x, y);

    fill(255);
    noStroke();
    rect(int(x/25)*25, int(y/25)*25, 25, 25);
    return res;
  }

  void keyPressed() {


    if (keyCode == UP) {
      //check direction
      if (prev == 2) {
        if (y + 1 > height) {
          y = 0;
        } 
        //do not bounce else
        else {
          y += 1;
        }
      } else {
        if (y - 1 < 0) {
          y = height;
        } else {
          y -= 1;
        }
        prev = 1;
      }
    } else if (keyCode == DOWN) {
      //check curr direction
      if (prev ==1) {
        if (y - 1 < 0) {
          y = height;
        } else {
          y -= 1;
        }
      } else {
        if (y + 1 > height) {
          y = 0;
        } else {
          y += 1;
        }
        prev = 2;
      }
    } else if (keyCode == LEFT) {
      //check curr direction
      if (prev == 4) {
        if ( x+1 > width) {
          x = 0;
        } else {
          x += 1;
        }
      } else {
        if ( x-1 < 0) {
          x = width;
        } else {
          x -= 1;
        }
        prev = 3;
      }
    } else if (keyCode == RIGHT) {
      if (prev == 3) {
        if ( x-1 < 0) {
          x = width;
        } else {
          x -= 1;
        }
      } else {
        if ( x+1 > width) {
          x = 0;
        } else {
          x += 1;
        }
        prev = 4;
      }
    }
  }
}
