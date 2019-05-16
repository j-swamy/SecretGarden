//creating grass that waves in the wind

int xspacing = 7;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave

float theta = 0.0;  // Start angle at 0
float amplitude = 75.0;  // Height of wave
float period = 500.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave


void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.02;

  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 30; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

//variable that moves grass vertically depending on where it is on canvas
int h = 100;

void renderWave() {
  noStroke();
  fill(#35605A);
  for(int i = 0; i < 30; i++){
    if (i >= 5 && i <= 25) {
        h = 70;
      }
      else {
        h = 75;
      }
    // A simple way to draw the wave with an ellipse at each location
    for (int x = 30; x < yvalues.length; x++) {
      
      ellipse(height/2+yvalues[(x+1)%yvalues.length] + (i * 30 - 450), x*xspacing + h, 16*((x-20)*0.05), 16*((x-20)*0.05));
    }
  }
}
