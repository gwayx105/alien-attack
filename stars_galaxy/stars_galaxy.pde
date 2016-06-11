int total=100;
float [] x=new float[total];
float [] y=new float[total];
float[] speed= new float[total];
PImage rocket;
PImage sparrow;
PImage tomcat_1;
PImage tomcat_2;
PImage alien_1;
PImage alien_2;
PImage alien_3;
PImage explosion;
Missle nMissile;
Alien_1 al1;
Alien_2 al2;
Alien_3 al3;
float totalDistance;
String trek="Distance: ";
String mCount="Missles: ";
String score="Score: ";
String lives="Lives: ";
int livesCount=3;
int misslesCount=100;
int scoreValue=0;
ArrayList aCollection;
ArrayList mCollection;
void setup() {
  size(700, 400);
  background(0);
  //disabling the mouse cursor
  noCursor();
  mCollection=new ArrayList();
  aCollection=new ArrayList();
  // pulling alien images from the data folder
  alien_1=loadImage("alien_1.png");
  alien_2=loadImage("alien_2.png");
  alien_3=loadImage("alien_3.png");
  rocket=loadImage("rocket.png");
  //pulling spacecraft ship from data folder
  sparrow = loadImage("sparrow.png");
  tomcat_1= loadImage("tomcat_1.png");
  tomcat_2= loadImage("tomcat_2.png");
  explosion=loadImage("explosion.png");
  //adding aliens to the collections
  al1=new Alien_1();
  al2=new Alien_2();
  al3=new Alien_3();
  aCollection.add(al1);
  aCollection.add(al2);
  aCollection.add(al3);
  stroke(255);
  strokeWeight(5);
  int i=0;
  while (i<total) {
    x[i]=random(0, width);
    y[i]=random(0, height);
    speed[i]=random(1, 5);
    i++;
  }
}

void draw() {
  background(0);
  text(trek+totalDistance, 10, 20);
  text(score+scoreValue, 250, 20);
  text(mCount+misslesCount, 460, 20);
  text(lives+livesCount, 580, 20);
  int i=0;
  while (i<total) {
    float co = map(speed[i], 1, 5, 0, 255);
    stroke(co);
    strokeWeight(speed[i]);
    point(x[i], y[i]);
    x[i]-=speed[i]/2;
    if (x[i]<0) {
      x[i]=width;
    }
    i++;
  }

  if (totalDistance<3.5) {
    image(sparrow, mouseX, mouseY);
    Alien_1 al11=(Alien_1)aCollection.get(0);
    al11.run();
  } else if (totalDistance>=3.5 && totalDistance<8.5) {
    image(tomcat_1, mouseX, mouseY);
    Alien_2 al22=(Alien_2)aCollection.get(1);
    al22.run();
  } else if (totalDistance>=8.5) {
    image(tomcat_2, mouseX, mouseY);
    Alien_3 al33=(Alien_3)aCollection.get(2);
    al33.run();
  }
  if (mCollection.size() !=0) {
    for (int j=0; j<mCollection.size(); j++) {
      Missle ml=(Missle)mCollection.get(j);
      if (ml.loc.x<width) {
        ml.fire();
      } else {
        mCollection.remove(j);
      }
    }
  }

  totalDistance+=0.01;
}
//adds missle objects to be fired
void mousePressed() {
  Missle lMissle=new Missle(mouseX, mouseY);
  mCollection.add(lMissle);
  misslesCount-=1;
}