/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 All objects in this world that move must implemnt the Movalbe interface.
 */
interface Movable {
  /*
    Return the x location of the Movable
   */
  float getX();

  /*
    Return the y location of the Movable
   */
  float getY();

  /*
    Return the direction of the Movable in degrees.
   */
  float getDirection();

  /*
   Return the speed of the Movable.
   The speed you use is a relative value and will
   feel different for different frame rates. For example,
   if frameRate is set to 48, then a speed of 1 would move 48 pixels 
   per second.
   */
  float getSpeed();

  /*
   Return the radius of influence. If you could draw a circle
   around your object, then what would this radius be.
   */
  float getRadius();

  /* 
   Sets the direction of the Movable
   */
  void setDirection(float newDirectionInDegrees);

  /* 
   Sets the speed of the Movable
   */
  void setSpeed(float newSpeed);

  /*
   Update the internals of the instance
   */
  void update(); 

  /*
    Display the isntance
   */
  void show();

  /*
   Return true if the instance of Movable is "colliding with" 
   the movable referred to by object.  *Note* An object should not
   be able to astRadius with iteself.
   */
  boolean collidingWith(Movable m);
}
//END OF Movable Interface




/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
 Abstract base class Mover 
 */
abstract class Mover implements Movable {

  protected float x, y;
  protected float speed;
  protected float direction;
  protected int myColor;
  protected float radius; 
  
  float getX(){
    return x;
  }
  float getY(){
    return y;
  }
  float getDirection(){
    return  direction;
  }
  float getSpeed(){
    return speed;
  }
  float getRadius(){
    return radius;
  }
  void setDirection(float newDirectionInDegrees){
    this.direction = newDirectionInDegrees;
  }
  void setSpeed(float newSpeed){
    this.speed = newSpeed;
  }
  void setX(float x_pos){
    x = x_pos;
  }
  
  void setY(float y_pos){
    y = y_pos;
  }

  /*
    Default Mover, not actually moving and directionless
  */
  Mover(float x, float y) {
    //The line below shows how we can 
    //link this constructor to the constructor below through "this"
    this(x, y, 0, 0);  
  }

  /*
    Mover constructor specifying x, y position along with its speed and
    direction (in degrees)
  */
  Mover(float x, float y, float speed, float direction) {
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.direction = direction;
    myColor = 225;
    radius = 0.0;
  }

  /*
    Most of your movalbe objects should follow this pattern.
   */
  void update() {
    x = x + speed*(float)Math.cos(radians(direction));
    y = y + speed*(float)Math.sin(radians(direction));
    
    
   //if (x<0 || x>width){    //todo: You need to decide what to do when X is less than 0 or greater than width
   //  speed = 2;
   //}
   //if (y <0 || y > height){ //todo: You need to decide what to do when Y is less than 0 or greater than height
   //  direction+=1;
   //  speed = 2;
   //}
   
   
  }

  /*
    Save this for your subclasses to override.
    but notice how it is tagged with abstract, meaning 
    it is incomplete. (It's like an I.O.U.)
   */
  abstract void show();


  /*
    TODO: Part 4: Implement collision detection
   */
  boolean collidingWith(Movable m){
    float distance = dist(x, y, m.getX(), m.getY());
    boolean touching = distance <(radius + m.getRadius());
    return touching; 
  }
  
}
