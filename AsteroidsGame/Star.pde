//note that this class does NOT *NEED* to extend Mover but can if you like
class Star extends Mover {
  //your code here
  float x, y, speed, direction;
  
  Star(float x, float y, float speed, float direction){
    super(x, y, speed, direction);
    
    this.speed = speed;
    this.direction = direction;
    
  }
  void show(){
    fill(100);
    ellipse(x,y,10,10);
  }
  
  void twinkle(){
    
    x = x+(int)Math.random()*3;
    y = y+(int)Math.random()*3;
    if (x >= 300 || x <= 0) {
      x = direction*-1;
    }
    if (y >= 250 || y <= 0) {
      y = direction*-1;
    }
  }
}
