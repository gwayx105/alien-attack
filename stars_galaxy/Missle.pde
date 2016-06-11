class Missle {
  PVector loc=new PVector();
  float speedM=random(90,200);
  
  //Constructor
  Missle(float x,float y) {
    loc.x=x;
    loc.y=y;
  }
  float getY(){
    return loc.y;
  }
/*
  Description: Displays a missle image at x and y coordinates
  Parameter: none
  Return: none
*/
  void display() {
    image(rocket,loc.x+15,loc.y+28);
  }
/*
  Description: moves missle by incrementing its x and y coordinates
  Parameter: none
  Return: none
*/
  void move() {
    loc.x+=4.5;
    //y+=speedM;
  }
/*
  Description: moves the missle image by calling display() and move() functions
  Parameter: none
  Return: none
*/
  void fire() {
    display();
    move();
  }
  float getX(){
    return loc.x;
  }
}