Ball b;
Hole h;
//Obstacle o;
int score = 0, strokes = 0;
Boolean locked = false;


void setup(){
  size(512, 512);
  b = new Ball(random((0 + 15/2)  + 15, (width - 15/2) - 15), random((0 + 15/2) + 15, (height - 15/2) - 15));
  h = new Hole(random((0 + 15/2)  + 15, (width - 15/2) - 15), random((0 + 15/2) + 15, (height - 15/2) - 15));
  //o = new Obstacle((int)random((0 + 15/2) + 50, (width - 15/2) - 15), (int)random((0 + 15/2) + 15, (height - 15/2) - 50), (int)random(10, 50), (int)random(10, 50));
}

void draw(){
  background(0, 125, 0);
  h.Display();
  
  if (locked)
    b.Direction();
  //o.Display();
  b.Bounce(width, height, 0, 0, 15/2);
  b.Run();
  Muro();
  UI();
  
  if (b.CheckHole(h.posX, h.posY, b.size/2)){
    score += 11-strokes;
    setup();
    strokes = 0;
  }
}

void Muro(){
  fill(0, 0);
  stroke(50);
  strokeWeight(15);
  rect(0, 0, width, height);
}

void keyPressed(){
  if (key == 'r')
    setup();
}

void UI(){
  fill(255, 200, 0);
  textSize(26);
  text("Score = " + score, 20, 40);
  text("Strokes = " + strokes, 20, 62);
}

void mousePressed(){
  locked = true;
}

void mouseReleased(){
  b.Hit();
  strokes++; 
  locked = false;
}
