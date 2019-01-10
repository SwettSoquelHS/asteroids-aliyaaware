  /*
  Spaceship class
    Should extend Mover class and implement show.
    You may add additional methods to this class, for example "rotate" and "accelerate" 
    might be useful.
*/
class Spaceship extends Mover {  
  void update(){
    rotate(radians(direction));
    triangle(-20,-20,-20,20,70,0);
  }
  

  void show(){
    fill(40,40,50);
    pushMatrix();
    fill(255);
    //translate(x_pos, y_pos);
    rotate(radians(direction));
    //ellipse(0,10,20,20);
    triangle(-20,-20,-20,20,70,0);
    triangle(-20,-30,-10,5, 35,0);
    popMatrix();
  }
  
  public Spaceship(float x, float y){
    super(x,y);
  }
  
  public Spaceship(float x, float y, float speed, float direction) {
    //this(x,y);
    //this.speed = speed;
    //this.direction = direction;
    super (x, y, speed, direction);
  }
  void turn(){
    if(ROTATE_LEFT)
      direction -=4.0;
    if (ROTATE_RIGHT)
      direction +=4.0;
  }
  void move(){
    if (MOVE_FORWARD ==true){
      if(speed<3){
        speed+=0.5;
      }
    }else{
      if (speed>0){
        speed-=0.5;
      }
      if(speed<0)
        speed =0;
    }
    if (y_pos >= 800 || y_pos <= 0) {
      direction = direction*-1;      
    }

  }
}
