int x, y;
PImage im;
 
void setup(){
  size (600, 379);
  im = loadImage("desert.jpg");
  x = 0;
  y = 0;
}
 
void draw(){
  background(im);
  rect(x, y, 25,25);
  keyPressed();
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
