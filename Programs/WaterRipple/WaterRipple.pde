
int cols = 200;
int rows = 200;
float[][] current = new float[cols][rows];
float[][] previous = new float[cols][rows];

float damping = 0.95;

void setup(){
  size(600,400);
  cols = width;
  rows = height;
  current = new float[cols][rows];
  previous = new float[cols][rows];
 
}

void mouseDragged() {
previous[mouseX][mouseY] = 255;
}


void draw() {
  background(0);
  loadPixels();
  for (int i = 1; i < cols-1; i++){
  for (int j = 1; j < rows-1; j++){
    
    current[i][j] = (previous[i-1][j] + previous[i+1][j] +
                     previous[i][j-1] + previous[i][j+1]) / 2 -
                     current[i][j];
    current[i][j] = current[i][j] * damping;
    
    int index = i + j * cols;
   pixels[index] = color(current[i][j]*255);
  }
  }
   
   updatePixels();
   
   float[][] temp = previous;
   previous = current;
   current = temp;
  
  
}
