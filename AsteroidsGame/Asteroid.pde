class Asteroid extends Mover {   
  //your code here
  float rotate;
  boolean hit;
  int astRadius;
  
  public Asteroid(float x, float y, float speed, float direction){
    super(x, y, speed, direction);
    radius  = 25;
    astRadius =0;
  }
  
  public Asteroid(float x, float y){
    super(x,y);
  }
  
  void show(){
    pushMatrix();
    stroke(2);
    translate((float)x, (float)y);
    rotate(radians(rotate));
    scale(7.0);
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
    vertex(0.0,4.0);
    endShape();
    popMatrix();
  }
  
  void move(){
   x = x+(int)Math.random();
   y = y+(int)Math.random();
    
    if (x >= width && x <= 0 || y >= height && y <= 0) {
        direction = random(360);
        direction *= -3;
    }
    if(x >1000)
       x = 0;
     if(x <0)
       x = 1000;
     if(y>800)
       y = 0;
     if(y <0)
       y = 800;

  }
  void update(){
    x = x+ (float)Math.cos(radians(direction)*7);
    y = y + (float)Math.sin(radians(direction)*7);
    rotate += 2;
    astRadius--;
  }
  
}
