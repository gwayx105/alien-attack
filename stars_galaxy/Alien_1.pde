class Alien_1 {
  PVector loc =new PVector(width-110, height/2);
  PVector speed=new PVector(0, 2);

  Alien_1() {
  }
  void run() {
    display();
    move();
    fire();
    boundary();
  }
  void display() {
    image(alien_1, loc.x, loc.y);
  }

  void move() {
    loc.y+=speed.y;
    for (int i=0;i<mCollection.size();i++) {
      Missle mloc = (Missle)mCollection.get(i);
      float distance =loc.dist(mloc.loc);
      if (distance<=15) {
        //triggering explosion when missle is closest to ship
        image(explosion,loc.x,loc.y);
        //removing missle from collection after a successful hit
        mCollection.remove(i);
        scoreValue+=2;
      }
    }
  }

  void fire() {
    
  }

  void boundary() {
    if (loc.y<5) {
      speed.y = speed.y * -1;
    }
    if (loc.y>height-40) {
      speed.y= speed.y* -1;
    }
  }
}