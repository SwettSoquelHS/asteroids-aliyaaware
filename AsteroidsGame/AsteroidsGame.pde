import java.util.ArrayList;
/* * * * * * * * * * * * * * * * * * * * * * *
 Class variable declarations here
 */
float x_pos, y_pos, speed, direction;

ArrayList<Asteroid> ast = new ArrayList<Asteroid>();
//ArrayList<Bullet> bullets = new ArrayList<Bullet>();
Spaceship player1;
//Bullet[] bull = new Bullet[10];
//Asteroid[] asteroids= new Asteroid[10];
Star[] starField = new Star[100];

int astAmnt = 15;

/*
  Track User keyboard input
 */
boolean ROTATE_LEFT;  //User is pressing <-
boolean ROTATE_RIGHT; //User is pressing ->
boolean MOVE_FORWARD; //User is pressing ^ arrow
//boolean MOVE_DOWN;
boolean SPACE_BAR;    //User is pressing space bar


  
/* * * * * * * * * * * * * * * * * * * * * * *
  Initialize all of your variables and game state here
 */
public void setup() {
  size(1000,800);
   ROTATE_LEFT = false;  
   ROTATE_RIGHT = false;
   MOVE_FORWARD = false; 
 //  MOVE_DOWN=false;
   SPACE_BAR = false; 
  
  x_pos = width/23.0;
  y_pos= height/3.0;
  
  //starfeild
  for (int i =0; i<100; i++){
    starField[i] = new Star((float)Math.random()*1000, (float)Math.random() * 800);
  }
  
  //initialize your asteroid array and fill it
  //for (int i =0; i<=asteroids.length-1; i++){
  //  asteroids[i] = new Asteroid((float)Math.random()*1000, (float)Math.random() * 800, (float)Math.random()*5, (float)Math.random()*360);
  //}
  
  for(int i=0; i < astAmnt; i++){
    ast.add(new Asteroid((float)Math.random()*1000, (float)Math.random() * 800, (float)Math.random()*5, (float)Math.random()*360));
  }
  
  //initialize ship
  player1 = new Spaceship((float)width/2, (float)height/2, 50, 0);
  
  //bullet array
  //Bullet b = new Bullet(x_pos, y_pos, 10, 10);
  //bullets.add(b);
 
  //for (int i = 0; i < bull.length; i++) {
  //    bull[i] = new Bullet((float)width/2, (float)height/2, 0, 0);
  //  }
}


/* * * * * * * * * * * * * * * * * * * * * * *
  Drawing work here
 */
public void draw() {
  //your code here
  background(0);
  if (ast.size() ==0){
    fill(255);
    textSize(50); 
    text("Game Over You win", 300, 400);
  }
  if(player1.lives==0){
    fill(255);
    textSize(50);
    text ("Game over you lost :(", 350, 400);
  }
  if(player1.lives>0){

  //Draw Starfield first 
  for (int i =0; i<starField.length; i++){
    starField[i].show();
    //starField[i].twinkle();
  }
  fill(255);
  textSize(32); 
  text("Lives:"+ player1.lives, 10, 30);
  text("Score:"+ player1.score, 10, 70);
  
  //Check bullet collisions
  //TODO: Part III or IV - for not just leave this comment

  //TODO: Part II, Update each of the Asteroids internals
  checkOnAsteroids();
  checkOnBullets();
  checkOnShip();

  //Check for asteroid collisions against other asteroids and alter course
  //TODO: Part III, for now keep this comment in place

  //Draw asteroids
  //TODO: Part II
  for (int i =0; i<ast.size(); i++){
    Asteroid a1 = (Asteroid)ast.get(i);
    a1.update();
    a1.show();
    a1.move();
  }
  
  //spaceship
  if(ROTATE_LEFT)
      player1.turn(-5.0);
  if (ROTATE_RIGHT)
      player1.turn(5.0);
  if(MOVE_FORWARD){
     player1.accelerate(0.5);
  }
  if (!MOVE_FORWARD) {
    if(player1.getSpeed() < 0){
      player1.speed+=1.0;
    }else{
      player1.speed = 0;
    }
  }
  player1.bounceOffWalls();
  
  
  if(SPACE_BAR){
    player1.fired();
  }
  
  for (int i = 0; i < player1.bullHolder.size(); i++) {
    Bullet b = (Bullet)player1.bullHolder.get(i);
    if (b.getX() >= 1000) {
      player1.bullHolder.remove(i);
    }
    if (b.getX() < 0) {
      player1.bullHolder.remove(i);
    }
    if (b.getY() > 800) {
      player1.bullHolder.remove(i);
    }
    if (b.getY() < 0) {
      player1.bullHolder.remove(i);
    }
    Bullet bullet = (Bullet)b;
    bullet.show();
    bullet.move();
    bullet.update();
  }
  //Check for ship collision agaist asteroids
  //TODO: Part II or III

  //Draw spaceship & and its bullets
  //TODO: Part I, for now just render ship
   player1.update();
  
   player1.show();
   
  for(int i=0; i<player1.bullHolder.size(); i++){
    if(i<player1.bulletWait){
      Bullet b = (Bullet)player1.bullHolder.get(i);
      b.show();
      b.update();
    }
   }
  }
  
  //TODO: Part IV - we will use a new feature in Java called an ArrayList, 
  //so for now we'll just leave this comment and come back to it in a bit. 
  
  //Update score
  //TODO: Keep track of a score and output the score at the top right
}



/* * * * * * * * * * * * * * * * * * * * * * *
  Record relevent key presses for our game
 */
void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      ROTATE_LEFT = true;
    } else if ( keyCode == RIGHT ) {
      ROTATE_RIGHT = true;
    } else if (keyCode == UP) {
      MOVE_FORWARD = true;
    } //else if (keyCode == DOWN) {
    //  MOVE_DOWN = true;
    //}
  }

  //32 is spacebar
  if (keyCode == 32) {  
    SPACE_BAR = true;
  }
}



/* * * * * * * * * * * * * * * * * * * * * * *
  Record relevant key releases for our game.
 */
void keyReleased() {  
  if (key == CODED) { 
    if (keyCode == LEFT) {
      ROTATE_LEFT = false;
    } else if ( keyCode == RIGHT ) {
      ROTATE_RIGHT = false;
    } else if (keyCode == UP) {
      MOVE_FORWARD = false;
    }//else if (keyCode == DOWN) {
    //  MOVE_DOWN = false;
    //}
  }
  if (keyCode == 32) {
    SPACE_BAR = false;
  }
}


void checkOnAsteroids(){
  for (int i=0; i<ast.size(); i++){
    Asteroid a1 = ast.get(i);
    for (int j = 0; j< ast.size(); j++){
      Asteroid a2 = ast.get(j);
      if (i!=j && a1.collidingWith(a2) && a1.astRadius<0 && a2.astRadius<0){
        a1.direction = a1.direction+150;
        a2.direction = a2.direction-120;
      }
    }
  }
}

void checkOnBullets(){
  for (int i=0; i<ast.size(); i++){
    Asteroid a1 = ast.get(i);
    for (int j=0; j<player1.bullHolder.size(); j++){
       if (j<player1.bulletWait){
         Bullet b2 = player1.bullHolder.get(j);
         if (b2.collidingWith(a1)){
           player1.removed(j);
           //ast.remove(i);
           ast.remove(i);   
           player1.score++;
         }
         
      }
    }
  }
}

void checkOnShip(){
  for(int i =0; i < ast.size(); i ++){
    Asteroid a1 = ast.get(i);
    if(a1.collidingWith(player1)){
      player1.shipHit(player1);
      player1.lives-=1;
      ast.remove(i);
    }
  }
}
