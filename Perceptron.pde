class Perceptron {
  
  float[] inputs;
  float[] weights;
  
  float bias;
  
  float output;
  
  int inputCount;
  
  float learningRate = 0.001;
  
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
    //return 1/(1 + exp(getSum()));
    float sum = getSum();
    if(sum >= 0) {
      return 1.0;
    }
    else {
      return -1.0;
    }
  }
  
  float getSum() {
    float sum = bias;
    
    for (int i = 0; i < inputCount; i++) {
      sum = sum + (inputs[i] * weights[i]);
    }
    
    return sum;
  }
  
  float getBoundary(float input) {
    
    return (-bias - (weights[0] * input)) / weights[1];  
  }
  
  void train(float input1, float input2, float desiredOutput) {
    inputs[0] = input1;
    inputs[1] = input2;
    
    float output = getOutput();
    
    weights[0] = weights[0] + (learningRate * (desiredOutput - output) * inputs[0]);
    weights[1] = weights[1] + (learningRate * (desiredOutput - output) * inputs[1]);
    
    bias = bias + (learningRate * (desiredOutput - output));
  }
  
}