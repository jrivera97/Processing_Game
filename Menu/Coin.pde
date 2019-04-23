class Coin {
  float coinX;
  float coinY;
  boolean coin;
  float count;

  Coin(float coinX, float coinY, boolean coin) {
    this.coinX = coinX;
    this.coinY = coinY;
    this.coin = coin;
  }

  void placeCoin() {
    if (!coin) {
      coinX = random(0, width-25);
      coinY = random(0, height-25);
      coin = true;
    }
    fill(#F20C1C);
    noStroke();
    rect(int(coinX/25)*25, int(coinY/25)*25, 25, 25);
  }

  float gotCoin(float x, float y) {
    if ((Math.abs(int(x/25)*25 - int(coinX/25)*25)) < 10 && Math.abs(int(y/25)*25 - int(coinY/25)*25) < 10)
    {
      bite.loop(1);
      count += 10;
      coin = false;
    }
    placeCoin();
    return count;
  }
}
