boundary[] walls;
int wallsn = 5;
ray r;
particle p;
float yoff = 0;
float xoff = 100;

void setup() {
  size(400,400);
  p = new particle();
  walls = new boundary[wallsn];
  for(int i = 0; i < wallsn; i++) {
    float x1 = random(width);
    float x2 = random(width);
    float y1 = random(height);
    float y2 = random(height);
    walls[i] = new boundary(x1,y1,x2,y2);
  }
}

void draw() {
  background(0);
  for(boundary w: walls) {
    w.draw();
  }
  p.draw();
  p.update(noise(xoff)*width,noise(yoff)*height);
  p.look(walls);
  xoff += 0.01;
  yoff += 0.01;
  
}
