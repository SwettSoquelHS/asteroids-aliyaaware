  /*
  Spaceship class
    Should extend Mover class and implement show.
    You may add additional methods to this class, for example "rotate" and "accelerate" 
    might be useful.
*/
class Spaceship extends Mover {  
  //void update(){
  //  rotate(radians(direction));
  //  triangle(-20,-20,-20,20,70,0);
  //}
  
  Spaceship(float x, float y){
    super(x,y);
  }
  
  public Spaceship(float x, float y, float speed, float direction) {
    //this(x,y);
    //this.speed = speed;
    //this.direction = direction;
    super (x, y, speed, direction);
  }
  

  void show(){
    pushMatrix();
    translate(x, y);
    
    rotate(radians(direction));
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
    if(speed<=50){
        speed+=x;
    }
  }
}
  //void move(){
  //  if (MOVE_FORWARD ==true){
  //    if(speed<3){
  //      speed+=0.5;
  //    }
  //  }else{
  //    if (speed>0){
  //      speed-=0.5;
  //    }
  //    if(speed<0)
  //      speed =0;
  //  }
  //  if (y_pos >= 800 || y_pos <= 0) {
  //    direction = direction*-1;      
  //  }
  //  if(ROTATE_LEFT) {
  //    player1.direction -= 3.0;
  //  }
  //  if(ROTATE_RIGHT) {
  //    player1.direction += 3.0;
  //  }
  //  if(MOVE_FORWARD) {
  //    if(player1.speed<3.5){
  //      player1.speed+=.1;
  //    }
  //  }
  // if (!MOVE_FORWARD) {
  //  if(player1.speed < 0){
  //    player1.speed+=.05;
  //  }
  //  if(player1.speed > 0){
  //    player1.speed-=.05;
  //  }
  //  if(player1.speed == 0){
  //    player1.speed = 0;
  //  }
  //}
//  }
