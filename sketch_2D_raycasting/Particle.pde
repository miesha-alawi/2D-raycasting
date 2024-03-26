class particle {
  PVector pos;
  ArrayList<ray> rays;
  int rayn;
  particle() {
    pos = new PVector(width/2,height/2);
    rays = new ArrayList<ray>();
    for(int i = 0; i < 360; i+= 10) {
     rays.add(new ray(pos , radians(i)));
    }
  }
  
  void look(boundary[] wa) {
    for(ray r : rays) {
      PVector closest = null;
      double record = Double.POSITIVE_INFINITY;
      for(boundary w: wa) {
        PVector pt = r.cast(w);
        if(pt != null) {
          float d = PVector.dist(pos,pt);
          if(d < record) {
            record = d;
            closest = pt;
          }
        }
      }
      if(closest != null) {
        line(pos.x,pos.y, closest.x,closest.y);
      }
    }
  }
  
  void update(float x, float y) {
    pos.set(x,y);
  }
  
   void draw() {
     fill(255);
     ellipse(pos.x,pos.y,4,4);
     for(ray r : rays) {
       r.draw();
     }
   }

}
