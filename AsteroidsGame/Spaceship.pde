import java.util.ArrayList;
  /*
  Spaceship class
    Should extend Mover class and implement show.
    You may add additional methods to this class, for example "rotate" and "accelerate" 
    might be useful.
*/
class Spaceship extends Mover {  
  ArrayList bullHolder;
  Bullet[] bullet;
  int shoot;
  int wait;
  
  Spaceship(float x, float y){
    super(x,y);
  }
  
  public Spaceship(float x, float y, float speed, float direction) {
    //this(x,y);
    //this.speed = speed;
    //this.direction = direction;
    super (x, y, speed, direction);
    wait=0;
    shoot = 15;
    bullHolder = new ArrayList();
  }
  

  void show(){
    pushMatrix();
    translate(x, y);
    
    rotate(radians(direction-90));
    scale(10.0);
    fill(10,10,255);
    beginShape();
    vertex(0.0, 5.0);
    vertex(2.0, 0.0);
    vertex(2.0, -4.0);
    vertex(-2.0, -4.0);
    vertex(-2.0, 0.0);
    vertex(0.0, 5.0);
    endShape();
    beginShape();
    vertex(-2.0, 0.0);
    vertex(-4.5, -2.0);
    vertex(-3.0, -6.0);
    vertex(-2.0, -4.0);
    endShape();
    beginShape();
    vertex(2.0, 0.0);
    vertex(4.5,-2.0);
    vertex(3.0, -6.0);
    vertex(2.0, -4.0);
    endShape();
    popMatrix();
  }
  
  
  void turn(float x){
     direction +=x;

  }
  void accelerate(float x){
    if(speed<=10 && speed >=0){
        speed+=x;
    }
  }
  
   void bounceOffWalls(){
   //x = x+(int)Math.random();
   //y = y+(int)Math.random();
   x= x+speed*(float)Math.cos(radians(direction));
   y= y+speed*(float)Math.sin(radians(direction));
    
    //if (x > width || x < 0 ||y > height || y < 0) {
    //    direction = random(360);
    //    direction *= -3;
    //}
    if ( x <= 0) {
      //direction = y*-1;
      x=1000;
    }
    if (x >= 1000) {
      //direction = y +1;
      x=0;
    }
    if (y >= 800 ) {
      //direction = direction*-1; 
      y=0;
    }
    if (y <= 0){
      y=800;
    }

  }
  void fired() 
  {
      if(shoot<8 && wait<0 && bullHolder.size()<8){
        Bullet bullet = new Bullet(x, y, 5, direction);
        bullHolder.add(bullet);
        shoot++;
        wait = 14;
      }
      for (int i=0; i<bullHolder.size(); i++){
        bullHolder.remove(bullet);
      }
  }
  
  void update() {
    x = x + speed*(float)Math.cos(radians(direction));
    y = y + speed*(float)Math.sin(radians(direction));
    wait--;
  }
  void removed(int bullet1){
    bullHolder.remove(bullet1);
    if(shoot>0)
      shoot-=1;
  }
}
