/*
  Asteroid class
    Should extend Mover class and implement show.
    
    Initially, your asteroid may just be a simple circle or square
    but the final program should use "beginShap(), vertex(), and endShape()"
    to render the asteroid.
*/
class Asteroid extends Mover {   
  //your code here
  float rotate;
  float[] xCoords = new float[13];
  float[] yCoords = new float[13];
  //float x_pos, y, speed;
  //float direction = -1.0;

  
  public Asteroid(float x, float y, float speed, float direction){
    super(x, y, speed, direction);
    
  }
  Asteroid(float x, float y){
  super(x,y);
  }
  
  void show(){
    pushMatrix();
    translate(x, y);
    rotate(radians(rotate));
    scale(5.0);
    fill(100);
    beginShape();
    vertex(0.0,4.0);
    vertex(2.0,3.8);
    vertex(4.1, 1.0);
    vertex(4.0,0.0);
    vertex(3.0, -2.0);
    vertex(2.0, -3.0);
    vertex(1.0, -4.2);
    vertex(0.0,-4.0);
    vertex(-3.0, -4.2);
    vertex(-4.0, -2.0);
    vertex(-3.5, 0.0);
    vertex(-3.3, 2.0);
    vertex(-2, 3.5);
    endShape();
    popMatrix();
  }
  
  void move(){
   x = x+(int)Math.random();
   y = y+(int)Math.random();
    
    if (x > width || x < 0 ||y > height || y < 0) {
        direction = random(360);
        direction *= -1;
    }
    if ( x <= 0) {
      direction = y*-1;
    }
    if (x >= 1000) {
      direction = y +1;
    }
    if (y >= 800 || y <= 0) {
      direction = direction*-1;      
    }

  }
  void update(){
    x = x+ speed*(float)Math.cos(radians(direction));
    y = y + speed*(float)Math.sin(radians(direction));
    rotate += 1;
  }
}
