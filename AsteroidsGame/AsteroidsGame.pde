/* * * * * * * * * * * * * * * * * * * * * * *
 Class variable declarations here
 */
float x_pos, y_pos, speed, direction;

Spaceship player1;
Asteroid[] asteroids= new Asteroid[20];
Star[] starField = new Star[100];


/*
  Track User keyboard input
 */
boolean ROTATE_LEFT;  //User is pressing <-
boolean ROTATE_RIGHT; //User is pressing ->
boolean MOVE_FORWARD; //User is pressing ^ arrow
boolean SPACE_BAR;    //User is pressing space bar


  
/* * * * * * * * * * * * * * * * * * * * * * *
  Initialize all of your variables and game state here
 */
public void setup() {
  size(1000,800);
   ROTATE_LEFT = false;  
   ROTATE_RIGHT = false;
   MOVE_FORWARD = false; 
   SPACE_BAR = false; 
  
  x_pos = width/23.0;
  y_pos= height/3.0;
  
  for (int i =0; i<starField.length; i++){
    starField[i] = new Star(x_pos, y_pos, speed, direction);
  }
  
  //initialize your asteroid array and fill it
  for (int i =0; i<=asteroids.length-1; i++){
    asteroids[i] = new Asteroid((float)Math.random()*1000, (float)Math.random() * 800, (float)Math.random()*5, (float)Math.random()*360);
  }
  
  //initialize ship
  player1 = new Spaceship((float)width/2, (float)height/2, 0, 0);
  
  //initialize starfield
}


/* * * * * * * * * * * * * * * * * * * * * * *
  Drawing work here
 */
public void draw() {
  //your code here
  background(0);

  //Draw Starfield first 
  //TODO: Part I
  for (int i =0; i<starField.length; i++){
    starField[i].show();
    //starField[i].twinkle();
  }
  
  
  //Check bullet collisions
  //TODO: Part III or IV - for not just leave this comment

  //TODO: Part II, Update each of the Asteroids internals
  checkOnAsteroids();

  //Check for asteroid collisions against other asteroids and alter course
  //TODO: Part III, for now keep this comment in place

  //Draw asteroids
  //TODO: Part II
  for (int i =0; i<asteroids.length; i++){
    asteroids[i].update();
    asteroids[i].show();
    asteroids[i].move();
  }

  //Update spaceship
  //TODO: Part I
  if(!keyPressed){
    speed = 5;
  }else{
    speed =0;    
  }
  
  
  if(ROTATE_LEFT)
      player1.turn(-4.0);
   if (ROTATE_RIGHT)
      player1.turn(4.0);
   if(MOVE_FORWARD)
     player1.accelerate(0.5);    
  
    if (y_pos >= 800 || y_pos <= 0) {
      direction = direction*-1;      
    }

    //x_pos= x_pos+speed*(float)Math.cos(radians(direction));
    //y_pos= y_pos+spee(float)Math.sin(radians(direction));
  player1.update();

  
  //Check for ship collision agaist asteroids
  //TODO: Part II or III

  //Draw spaceship & and its bullets
  //TODO: Part I, for now just render ship
  player1.show();
  //for(int i =0; i <bullets.length1;i++){
  //  if(bullets[i] != null){
  //    bullets[i].move();
  //    bullets[i].show();
  //    if(bullets[i].dud){
  //      bullets[i] = null;
  //    }
  //  }
  //}
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
    }
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
    }
  }
  if (keyCode == 32) {
    SPACE_BAR = false;
  }
}


void checkOnAsteroids(){
  for (int i=0; i<asteroids.length; i++){
    Asteroid a1 = asteroids[i];
    for (int j = 0; j< asteroids.length; j++){
      Asteroid a2 = asteroids[j];
      if (a1!=a2 && a1.collidingWith(a2)){
        //do something
      }
    }
  }
}
