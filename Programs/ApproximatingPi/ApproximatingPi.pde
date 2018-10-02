float r = 200;

int total = 0;
int circle = 0;

double record_pi = 0;

void setup(){
  size(402,402);
  background(0);
  translate(width/2,height/2);
  stroke(255);
  strokeWeight(4);
  noFill();
  ellipse(0,0,r*2,r*2);
  rectMode(CENTER);
  rect(0,0,r*2,r*2);
}

void draw(){
    translate(width/2,height/2);
    
  for(int i = 0; i < 10000; i++){
  float x = random(-r,r);
  float y = random(-r,r);
  total++;
  
  double d = (double)x * (double)x + (double)y * (double)y;
  if (d < (double)r * (double)r){
    circle++;
   stroke(0, 255, 0, 100); 
  }else{
   stroke(255, 0, 0, 100); 
  }
  strokeWeight(1);
  point(x,y);

  double pi = (double)4 * ((double)(circle) / (double)total);
double recordDiff = Math.abs(Math.PI - record_pi);
 double diff = Math.abs(Math.PI - pi);
 if (diff < recordDiff){
  recordDiff = diff;
  record_pi = pi;
  println(record_pi);
 }
 // println(pi); 
}
}
