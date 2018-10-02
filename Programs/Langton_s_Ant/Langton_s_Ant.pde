

int[][] grid;
int x;
int y;
int dir;

int antup = 0;
int antdown = 2;
int antright = 1;
int antleft = 3;

void setup(){
 size(400,400);
 grid = new int[width][height];
 x = 200;
 y = 200;
 dir = antup;
}

void turnRight(){
  dir++;
  if(dir > antleft){
   dir = antup; 
  }
}

void turnLeft(){
  dir--;
  if(dir < antup){
   dir = antleft; 
  }
}

void moveForward(){
 if(dir == antup){
  y--; 
 }else if(dir == antright){
   x++;
 }else if (dir == antdown){
  y++; 
 }else if (dir == antleft){
   x--;
 }
 
 if (x > width){
  x = 0; 
 }else if (x < 0){
  x = width-1; 
 }
 if( y > height){
  y = 0; 
 }else if ( y < 0){
  y = height-1; 
 }
 
}

void draw(){
 background(255);
 
 for(int n = 0; n < 11000; n++){
 int state = grid[x][y];
 
 if(state == 0){
turnRight();
grid[x][y] = 1;
moveForward();
 }else if (state == 1){
  turnLeft();
  grid[x][y] = 0;
  moveForward();
 }
 }
 
 loadPixels();
 for (int i = 0; i < width; i++){
  for ( int j = 0; j < height; j++){
    int pix = i * width + j;
    if (grid[i][j] == 0){
    pixels[pix] = color(255);
  } else{
    pixels[pix] = color(0);
  }
  }
 }
 updatePixels();
 noLoop();
 
}
