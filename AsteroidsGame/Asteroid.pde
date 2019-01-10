/*
  Asteroid class
    Should extend Mover class and implement show.
    
    Initially, your asteroid may just be a simple circle or square
    but the final program should use "beginShap(), vertex(), and endShape()"
    to render the asteroid.
*/
class Asteroid extends Mover {   
  //your code here
  float x, y, speed;
  PVector location, velocity;
  float direction = 1;
  
  Asteroid(float x, float y, float speed, float direction){
    super(x, y, speed, direction);
     location = new PVector(x, y);
    velocity = new PVector(speed*(float)Math.cos(radians(direction)), 
      speed*(float)Math.sin(radians(direction)));
    this.speed = speed;
    this.direction = direction;
    
  }
  void show(){
    fill(100);
    ellipse(location.x,location.y,10,10);
  }
  
  void move(){
   // x = x+(int)Math.random()*3;
    //y = y+(int)Math.random()*3;
    //location.x += velocity.x; //update x and y
    //location.y += velocity.y;
    //velocity.x = (speed*(float)Math.cos(radians(direction))); //update direction
    //velocity.y = (speed*(float)Math.sin(radians(direction)));
    
    //System.out.println(direction);
    if (location.x > width || location.x < 0
      || location.y > height || location.y < 0) {
        //direction -= random(160, 190);
        direction *= -1;
    }
    if ( x_pos <= 0) {
      direction = y_pos*-1;
    }
    if (x_pos >= 1000) {
      direction = y_pos +1;
    }

  }
}
