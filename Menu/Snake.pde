class Snake {
  float x, y;
  PImage im;
  boolean coin;
  float coinX;
  float coinY;
  Coin c;
  int prev = 0;
  int snakeLen = 1;
  int bodyIndex = 0;
  int newDir = -1;
  ArrayList<Integer> ySpots;
  ArrayList<Integer> xSpots;
  // constructor
  Snake() {
    im = loadImage("desert.jpg");
    x = 25;
    y = 25;
    coin = false;
    coinX = width/2;
    coinY = height/2;
    c = new Coin(coinX, coinY, coin, snakeLen);
  }

  float moveSnake() {
    background(im);
    keyPressed();
    float res = c.gotCoin(x, y);

    fill(255);
    noStroke();
    snakeLen = c.getSnakeLen();
    System.out.println(snakeLen);
    bodyIndex = 0;
    for (int i = 0; i < snakeLen; i++) {
      //up
      if (prev == 1) {
        rect(int((x)/25)*25, int((y+bodyIndex)/25)*25, 25, 25);
      } 
      //down
      else if (prev == 2) {
        rect(int((x)/25)*25, int((y-bodyIndex)/25)*25, 25, 25);
      }

      //left
      else if (prev == 3) {
        rect(int((x+bodyIndex)/25)*25, int((y)/25)*25, 25, 25);
      }
      //right
      else if (prev == 4) {
        rect(int((x-bodyIndex)/25)*25, int((y)/25)*25, 25, 25);
      }
      //start
      else {
        rect(int((x)/25)*25, int((y)/25)*25, 25, 25);
      }
      bodyIndex+=25;
    }

    return res;
  }

  void keyPressed() {


    if (keyCode == UP) {
      if (prev == 3) {
        newDir = 0;
      }
      //System.out.println("previnUp: " + prev);
      //check direction
      if (prev == 2) {
        //System.out.println("I cant do that");
        if (y + 1 > height) {
          y = 0;
        } 
        //do not bounce else
        else {
          y += 1;
        }
      } else {
        //System.out.println("I did it");
        if (y - 1 < 0) {
          y = height;
        } else {
          y -= 1;
        }
        prev = 1;
      }
    } else if (keyCode == DOWN) {
      // System.out.println("goin down");
      // System.out.println("previnDown: " + prev);
      //check curr direction
      newDir = 2;
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
