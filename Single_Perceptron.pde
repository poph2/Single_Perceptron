
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
  
  /*for(int i = 0; i < 1000; i++) {
    
    x = random(0.0, maxX);
    y = random(maxY, 0.0);
    z = classify(x, y);
    
    data.add(new PVector(x, y, z));
    
    println("x = " + x + " - y = " + y);
    
  }*/
  
  
  println("MaxY = " + maxY);
  
}

void addRandomPoint() {
    float x = random(0.0, maxX);
    float y = random(maxY, 0.0);
    float z = classify(x, y);
    
    data.add(new PVector(x, y, z));
    
    p.train(x, y, z);
    
    
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
        fill(color(204, 42, 10));
      }
      else {
        fill(color(34, 232, 50));
      }
      
      float xCoord = map(data.get(i).x, 0.0, maxX, 0.0, float(width-60));
      float yCoord = map(data.get(i).y, 0.0, maxY, 0.0, -(float)(height-60));
      
      ellipse(xCoord, yCoord, 5, 5);
      
      
    }
    
    float planeX1 = 0;
    float planeX2 = maxX;
    
    float planeY1 = p.getBoundary(planeX1);
    float planeY2 = p.getBoundary(planeX2);
    
    float xCoord1 = map(planeX1, 0.0, maxX, 0.0, float(width-60));
    float yCoord1 = map(planeY1, 0.0, maxY, 0.0, -(float)(height-60));
    
    float xCoord2 = map(planeX2, 0.0, maxX, 0.0, float(width-60));
    float yCoord2 = map(planeY2, 0.0, maxY, 0.0, -(float)(height-60));
    
    line(xCoord1, yCoord1, xCoord2, yCoord2);
    
    
  popMatrix();
  
  if (frameCount % 1 == 0) {
    // We are choosing to send in an input every 30 frames.
    addRandomPoint();
  }
  
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
  return -((3 * x) - 5);
}