int x = 0;
int y = 0;
 
void setup(){
  size (400, 400);  
}
 
void draw(){
  background(80);
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
