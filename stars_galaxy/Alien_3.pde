class Alien_3 extends Alien_1 {
  PVector loc =new PVector(width-210, height/2);
  PVector speed=new PVector(0, 2);
  Alien_3() {
  }

  void move() {
    loc.y+=speed.y;
    for (int i=0;i<mCollection.size();i++) {
      Missle mloc = (Missle)mCollection.get(i);
      float distance =loc.dist(mloc.loc);
      if (distance<=25) {
        image(explosion,loc.x+115,loc.y);
        mCollection.remove(i);
        scoreValue+=2;
      }
    }
  }
  @Override
    public void display() {
    image(alien_3, loc.x, loc.y);
  }
  @Override
    public void boundary() {
    if (loc.y<=0) {
      speed.y = speed.y * -1;
    }
    if (loc.y>=height-90) {
      speed.y= speed.y* -1;
    }
  }
}