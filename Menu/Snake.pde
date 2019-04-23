class Snake {
  int x, y;
  PImage im;
  boolean coin;
  float coinX, coinY;
  Coin c;
  int prev, snakeLen, bodyIndex, newDir;
  ArrayList<Integer> ySpots = new ArrayList<Integer>();
  ArrayList<Integer> xSpots = new ArrayList<Integer>();
  ArrayList<snakeBody> sList = new ArrayList<snakeBody>();
  float res;
  float tempRes;
  snakeBody s;

  // constructor
  Snake() {
    im = loadImage("desert.jpg");
    x = 100;
    y = 100;
    prev = 0;
    snakeLen = 3;
    bodyIndex = 0;
    newDir = -1;
    res = 0;
    tempRes = 0;
    coin = false;
    coinX = width/2;
    coinY = height/2;
    c = new Coin(coinX, coinY, coin);
    //snake body

    s = new snakeBody(x, y);
    sList.add(s);
    y-=25;
    s = new snakeBody(x, y);
    sList.add(s);
    y-=25;
    s = new snakeBody(x, y);
    sList.add(s);
  }

  float moveSnake() {
    background(im);


    tempRes = res;
    res = c.gotCoin(x, y);
    if (tempRes != res) {
      snakeLen++;
      s = new snakeBody((int)x, (int)y);
      sList.add(s);
    }

    fill(255);

    //if (snakeLen == 1) {
    //  rect(int((x)/25)*25, int((y)/25)*25, 25, 25);
    //}
    // if snake is more than 1 box
    //else {
      
      
    for (int i = 0; i < sList.size(); i++) {
      rect(int((sList.get(i).getX())/25)*25, int((sList.get(i).getY())/25)*25, 25, 25);
      System.out.println(" y: " + int((sList.get(i).getY())/25)*25);
    }
    
    
    //}
    return res;
  }

  void keyPressed() {

    // UP
    if (keyCode == UP) {

      //check direction
      if (prev == 2) {
        if (y + 1 > height) {
          y = 0;
          snakeBody temp = new snakeBody(x, (y+25));
          sList.add(temp);
        } 
        //do not bounce else
        else {
          y += 1;
          snakeBody temp = new snakeBody(x, (y-25));
          sList.add(temp);
        }
      } else {
        if (y - 1 < 0) {
          y = height;
          snakeBody temp = new snakeBody(x, (y-25));
          sList.add(temp);
        } else {
          y -= 1;
          snakeBody temp = new snakeBody(x, (y+25));
          sList.add(temp);
        }
        prev = 1;
      }
      
      //if (sList.size() > 1) {
      //  sList.remove(snakeLen-1);
    }
    //DOWN
    else if (keyCode == DOWN) {
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
      snakeBody temp = new snakeBody(x, y);
      sList.add(temp);
      if (sList.size() > 1) {
        //sList.remove(snakeLen);
      }
    }
    //LEFT
    else if (keyCode == LEFT) {
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
      snakeBody temp = new snakeBody(x, y);
      sList.add(temp);
      if (sList.size() > 1) {
        //sList.remove(snakeLen);
      }
    }
    //RIGHT
    else if (keyCode == RIGHT) {
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
      snakeBody temp = new snakeBody(x, y);
      sList.add(temp);
      if (sList.size() > 1) {
        //sList.remove(snakeLen);
      }
    }
  }
}
