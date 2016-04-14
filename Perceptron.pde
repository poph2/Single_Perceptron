class Perceptron {
  
  float[] inputs;
  float[] weights;
  
  float bias;
  
  float output;
  
  int inputCount;
  
  Perceptron(int inputC) {
    
    inputCount = inputC;
    
    inputs = new float[inputCount];
    weights = new float[inputCount];
    
    for(int i = 0; i < inputCount; i++) {
      inputs[i] = 0;
      weights[i] = random(1);
    }
    
    bias = 1.0;
    output = 0.0;
  }
  
  void setInput(float[] inputArr) {
     inputs = inputArr;
  }
  
  float getOutput() {
    return 1/(1 + exp(getSum()));
  }
  
  float getSum() {
    float sum = bias;
    
    for (int i = 0; i < inputCount; i++) {
      sum = sum + (inputs[i] * weights[i]);
    }
    
    return sum;
  }
  
}