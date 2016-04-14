
Perceptron p;

float maxX = 10;
float maxY = y(maxX);

ArrayList<PVector> data;

void setup() {
  size(640, 360);
  
  p = new Perceptron(2);
  
  float x = 0.0;
  float y = 0.0;
  float z = 0.0;
  
  data = new ArrayList<PVector>();
  
  for(int i = 0; i < 1000; i++) {
    
    x = random(0.0, maxX);
    y = random(maxY, 0.0);
    z = classify(x, y);
    
    data.add(new PVector(x, y, z));
    
    println("x = " + x + " - y = " + y);
    
  }
  
  
    println("MaxY = " + maxY);
  
}

void draw() {
  
  background(255);
  
  pushMatrix();
    translate(30, height-30);
    
    ellipse(0, 10, 25, 25);
    
    line(0, 0, width - 60, 0);
    line(0, 0, 0, -(height - 60));
    
    for(int i = 0; i < data.size(); i++) {
      
      if(data.get(i).z == 1) {
        fill(color(204, 102, 0));
      }
      else {
        fill(color(0, 10, 234));
      }
      
      float xCoord = map(data.get(i).x, 0.0, maxX, 0.0, float(width-60));
      float yCoord = map(data.get(i).y, 0.0, maxY, 0.0, -(float)(height-60));
      
      ellipse(xCoord, yCoord, 5, 5);
    }
    
  popMatrix();
  
}

float classify(float x, float y) {
  float realY = y(x);
  
  if(y > realY) {
    return 1;
  }
  else {
    return -1;
  }
}


float y(float x) {
  return -((3 * x) + 5);
}