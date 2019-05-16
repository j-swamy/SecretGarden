class Star {
  //Star class variables
  float sx;
  float sy;
  int ssize;
  ArrayList<Star> stars = new ArrayList<Star>(); 
  ArrayList<PVector> concoor = new ArrayList<PVector>();
  //constructor
  Star(float x, float y, int d) {
    sx = x;
    sy = y;
    ssize = d;
  }
  
  //place stars randomly in sky, add to arraylist
  void makeStars() {
    for (int i = 0; i < 100; i++) {
      float sx = random(0, width);
      float sy = random(0, height/2);
      int sd = (int) random(2, 10);
      Star s = new Star(sx, sy, sd);
      stars.add(s);  
    }    
  }
  //display stars in arraylist  
  void displayStar() {
    fill(#0B1E3A, 150);
    rect(0, 0, width, height);
    for (Star s : stars) {
      fill(255);
      noStroke();
      circle(s.sx, s.sy, s.ssize);
    } 
  }
  
  //get arraylist
  ArrayList<Star> getStars() {
    return stars;
  }
  
  //get arraylist of constellations made
  ArrayList<PVector> getConst() {
    return concoor;
  }
   
  //add new coordinates of star part of constellation to pvector array
  void connect(Star s) {
    fill(255);
    concoor.add(new PVector(s.sx, s.sy));
  }
  
  //check if user is clicking on a star
  boolean getArea(float x, float y) {
    if ((x > sx - ssize) && (x < sx + ssize) && (y > sy - ssize) && (y < sy + ssize)) {
       return true;
    }       return false; 
  }
  
}
