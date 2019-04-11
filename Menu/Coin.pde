class Coin {
  float coinX;
  float coinY;
  boolean coin;

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
    rect(int(coinX/25)*25, int(coinY/25)*25, 25, 25);
  }

  void gotCoin() {
    if ((Math.abs(x - coinX)) < 10 && Math.abs(y - coinY) < 10)
    {
      coin = false;
    }
    placeCoin();
  }
}
