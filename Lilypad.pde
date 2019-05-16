class Lilypad {
  boolean lilylock;
  color lilycolor = color(41, 73, 54);
  int lix;
  int liy;
  ArrayList<Lilypad> lilies = new ArrayList<Lilypad>();
  
  //constructor
  Lilypad(int x, int y) {
    lix = x;
    liy = y;
    lilylock = false;
  }
  
  //add lilypads to arraylist for display purposes
  void createLily(Lilypad l) {
    lilies.add(l);
  }
  
  //display lilypads in current position
  void displayLil(int x, int y) {
    strokeWeight(2);
    stroke(134, 222, 183);
    fill(41, 73, 54);
    arc(x, y, 75, 75, 0, PI+QUARTER_PI+HALF_PI+PI/8, PIE);
    
  }
  
  //return arraylist of lilypads
  ArrayList<Lilypad> getLilies() {
    return lilies;
  }

}
