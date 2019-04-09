class Menu {
  boolean start, quit;

  // Constructor
  Menu() {
    start = false;
    quit = false;
  }

  void MenuUpdate() {
    if (mouseX > 50 && mouseX < 250 && mouseY > 250 && mouseY < 325)
      start = true;
    else if (mouseX > 350 && mouseX < 550 && mouseY > 250 && mouseY < 325)
      quit = true;
    else {
      start = false;
      quit = false;
    }
  }

  void MenuDisplay() {
    textSize(65);
    textAlign(CENTER, TOP);
    text("Welcome to Snake", width/2, 20);

    noFill();
    strokeWeight(5);

    if (start) {
      rect(40, 240, 220, 95);
      text("Start", 150, 250);
      rect(350, 250, 200, 75);
      text("Quit", 450, 250);
    } else if (quit) {
      rect(50, 250, 200, 75);
      text("Start", 150, 250);
      rect(340, 240, 220, 95);
      text("Quit", 450, 250);
    } else {
      rect(50, 250, 200, 75);
      text("Start", 150, 250);
      rect(350, 250, 200, 75);
      text("Quit", 450, 250);
    }
  }

  void mouseClicked() {
    if(start){
      // call Jose's code
    }
    if (quit) {
      exit();
    }
  }
}
