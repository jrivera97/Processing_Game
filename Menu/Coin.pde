class Coin {
  float coinX;
  float coinY;
  boolean coin;
  float count;
  int snakeLen;
  Coin(float coinX, float coinY, boolean coin, int snakeLenIn) {
    this.coinX = coinX;
    this.coinY = coinY;
    this.coin = coin;
    this.snakeLen = snakeLenIn;
  }

  void placeCoin() {
    if (!coin) {
      coinX = random(0, width-25);
      coinY = random(0, height-25);
      coin = true;
    }
    fill(#F20C1C);
    rect(int(coinX/25)*25, int(coinY/25)*25, 25, 25);
  }

  float gotCoin(float x, float y, int snakeLen) {
    if ((Math.abs(int(x/25)*25 - int(coinX/25)*25)) < 10 && Math.abs(int(y/25)*25 - int(coinY/25)*25) < 10)
    {
      System.out.println("here");
      bite.loop(1);
      count += 10;
      snakeLen++;
      coin = false;
    }
    placeCoin();
    return count;
  }

  int getSnakeLen() {
    return snakeLen;
  }
}
