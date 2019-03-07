class Bullet extends Spaceship {
  protected float x_pos, y_pos;
  
  public Bullet(float x, float y, float speed, float direction){
    super(x, y, speed, direction);
    radius = 10;
    x_pos = x;
    y_pos = y;
  }
  void show(){
    pushMatrix();
    translate(x, y);
    rotate(radians(direction));
    fill(255,0,0);
    scale(1);
    ellipse(-40, -2, 40, 4);
    popMatrix();
  }
  
  void move() {
    x_pos = x_pos + 12 * (float)Math.cos(radians(direction));
    y_pos = y_pos + 12 * (float)Math.sin(radians(direction));
  }
  
  void collision(){}
}
