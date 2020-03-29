float[] values; // array for random values

int s = 0;
int j = 0;

int operationCount = 0;

int rectSize = 10; // size of the graph rectangles
int sWidth; // count of values according to react and screen width size

float keyValue;

void setup() {
  size(800, 300);
  frameRate(120);
  sWidth = width/rectSize;
  values = new float[sWidth];
  setUpRandomValues();
}

void draw() {
  background(0);
  insertSort();
  drawGraph();
}

void setUpRandomValues() {
  for (int i = 0; i < values.length; i++) {
    values[i] = random(height);
  }
}

// Performed once per frame
void insertSort() {
  if (j > 0 && values[j-1]>keyValue) {
    values[j] = values[j-1];
    j--;
    operationCount++;
  } else {
    values[j] = keyValue;
    s++;
    if (s < values.length) {
      keyValue = values[s];
      j = s;
    } else {
      j = -1; // For the final draw sets the pointer position to none
      println("Done, total operations: ", operationCount, ". The size of the array: ", sWidth);
      noLoop();
    }
  }
}

void drawGraph() {
  for (int i = 0; i < sWidth; i++) {
    int x = i*rectSize;

    // Graph colors can be changed here
    fill(230, 255-int(values[i]), noise(int(values[i])), 240);

    // Pointer
    if (i == j) {
      fill(255, 255, 255, 240);
    }

    if (i != j) {
      rect(x, height, rectSize, -(values[i]));
    } else {
      rect(x, height, rectSize, -(keyValue));
    }
  }
}
