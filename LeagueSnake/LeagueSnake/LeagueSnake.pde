//*
// ***** SEGMENT CLASS *****
// This class will be used to represent each part of the moving snake.
//*

class Segment {

//Add x and y member variables. They will hold the corner location of each segment of the snake.
int x;
int y;

// Add a constructor with parameters to initialize each variable.
Segment (int x, int y) {
this.x = x;
this.y = y;
}


}


//*
// ***** GAME VARIABLES *****
// All the game variables that will be shared by the game methods are here
//*
Segment head;
int foodX;
int foodY;
int direction = UP;
int eaten = 0;
ArrayList <Segment> array = new ArrayList <Segment> ();

//*
// ***** SETUP METHODS *****
// These methods are called at the start of the game.
//*

void setup() {
 
size (500,500);
head = new Segment((int) random(50)*10, (int) random(50)*10);
frameRate(20);
dropFood();
}

void dropFood() {
  //Set the food in a new random location
    foodX = ((int)random(50)*10);
    foodY = ((int)random(50)*10);
}



//*
// ***** DRAW METHODS *****
// These methods are used to draw the snake and its food 
//*

void draw() {
  background(#000000);
  drawFood();
  move();
  drawSnake();
  eat();
}

void drawFood() {
  //Draw the food
  fill (255, 0, 0);
  rect (foodX, foodY, 10, 10);
}

void drawSnake() {
  //Draw the head of the snake followed by its tail
 fill ( #35ED42);
  rect(head.x,head.y,10,10);
}


//*
// ***** TAIL MANAGEMENT METHODS *****
// These methods make sure the tail is the correct length.
//*

void drawTail() {
  //Draw each segment of the tail 
fill (#35ED42);
for (int i = 0; i< array.size(); i++) {
rect (array.get(i).x, array.get(i).y, 10, 10);}

}

void manageTail() {
  //After drawing the tail, add a new segment at the "start" of the tail and remove the one at the "end" 
  //This produces the illusion of the snake tail moving.
  checkTailCollision();
  drawTail();
  array.add(new Segment(head.x, head.y));
  array.remove(0);
}

void checkTailCollision() {
  //If the snake crosses its own tail, shrink the tail back to one segment
  for (int g = 0; g< array.size(); g++) {
if (array.get(g).x == head.x && array.get(g).y == head.y) {}
}

}



//*
// ***** CONTROL METHODS *****
// These methods are used to change what is happening to the snake
//*

void keyPressed() {
  //Set the direction of the snake according to the arrow keys pressed
  if (key == CODED) {
    if (keyCode == UP && direction != DOWN) {
    direction = UP;}
    else if (keyCode == DOWN && direction != UP) {
    direction = DOWN;}
    else if (keyCode == RIGHT && direction != LEFT) {
      direction = RIGHT;}
      else if (keyCode == LEFT && direction != RIGHT) {
      direction = LEFT;}
    }
  }


void move() {
  //Change the location of the Snake head based on the direction it is moving.
  
    
  switch(direction) {
  case UP:
  head.y = head.y-10;
    break;
  case DOWN:
   head.y = head.y+10;
    break;
  case LEFT:
   head.x = head.x-10;
    break;
  case RIGHT:
    head.x = head.x+10;
    break;
  }
  checkBoundaries();
}

void checkBoundaries() {
 //If the snake leaves the frame, make it reappear on the other side
 if (head.x <0) {
 head.x = 490;}
 else if (head.x >500) {
 head.x = 10;}
 else if (head.y < 0 ){
 head.y = 490;}
 else if (head.y >500) {
 head.y = 10;}
}



void eat() {
  //When the snake eats the food, its tail should grow and more food appear
if (foodX == head.x && foodY == head.y) {
eaten = eaten + 1;
dropFood();
}
}
