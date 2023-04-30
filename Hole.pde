class Hole{
  float posX, posY;
  int size = 35;
  
  Hole(float x, float y){
    this.posX = x;
    this.posY = y;
  }
  
  void Display(){
    noStroke();
    fill(0);
    circle(posX, posY, 35);
  }
}
