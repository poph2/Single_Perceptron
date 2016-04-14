
Perceptron p;

void setup() {
  size(640, 360);
  
  p = new Perceptron(2);
  
}

void draw() {
  
}

float y(float x) {
  return (3 * x) + 5;
}