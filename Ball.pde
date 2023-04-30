class Ball {
  float posX, posY, spX = 0, spY = 0;
  int size = 30;
  float frictX, frictY;
  
  Ball(float x, float y){
    this.posX = x;
    this.posY = y;
  }
  
  void Direction(){
    float distX = (mouseX - posX), distY = (mouseY - posY); 
    strokeWeight(5);
    stroke(255);
    for (int i = 0; i <= 20; i++) {
      float x = lerp(posX, posX - distX, i/20.0);
      float y = lerp(posY, posY - distY, i/20.0);
      point(x, y);
    }
    //line(posX, posY,posX - distX, posY - distY);
    //line(posX - (mouseX - posX), posY - (mouseY - posY), posX - (mouseX - posX) + 3, posY - (mouseY - posY) - 5);
    //line(posX - (mouseX - posX), posY - (mouseY - posY), posX - (mouseX - posX) - 3, posY - (mouseY - posY) - 5);
  }
  
  void Hit(){
    float distX = (mouseX - posX), distY = (mouseY - posY); 
    spX = -distX/10;
    spY = -distY/10;
  }
  
  void Move(){
    posX += spX;
    posY += spY;
    frictY = abs(spY/20);
    frictX = abs(spX/20);
    
    if (spX != 0.0000000 && frictX != 0){
      frictX -= 0.01;
      spX -= Integer.signum(round(spX)) * frictX;
    }
    if (spY != 0.0000000 && frictY != 0){
      frictY -= 0.01;
      spY -= Integer.signum(round(spY)) * frictY;
    }
      
    if (spY > 0 && spY < 1 || spY < 0 && spY > -1)
      spY = 0;
      
    if (spX > 0 && spX < 1 || spX < 0 && spX > -1)
      spX = 0;
  }
  
  //mouseX - posX, mouseY - posY
  void Render(){
    strokeWeight(3);
    stroke(0);
    fill(255);
    circle(posX, posY, size);  
  }
  
  void Bounce(float x1, float y1, float x2, float y2, float offset){
    if (posX + size/2 + spX > x1 - offset || posX - size/2 + spX <  x2 + offset)
      spX *= -1;
      
    if (posY + size/2 + spY > y1 - offset || posY - size/2 + spY < y2 + offset)
      spY *= -1; 
  }
  
  Boolean CheckHole(float x, float y, int radius){
    if (this.posX > x - radius && this.posY > y - radius && this.posX < x + radius && this.posY < y + radius)
      return true;
      
    return false;
  }
  
  void Run(){
    b.Move();
    b.Render();
  }
}
