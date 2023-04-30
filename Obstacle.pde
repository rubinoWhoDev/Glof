class Obstacle{
  int x, y, l, h;
  color c;
  
  Obstacle(int x, int y, int l, int h){
    this.x = x;
    this.y = y;
    this.l = l;
    this.h = h;
    this.c = (int)random(0, 256);
  }
  
  void Display(){
    stroke(0);
    strokeWeight(5);
    fill(c);
    rect(x, y, l, h);
  }
}
