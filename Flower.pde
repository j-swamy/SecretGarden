class Flower {
  float x1;
  float y1;
  float size;
  color c;
  ArrayList<Flower> flowers = new ArrayList<Flower>();
  //constructor
  Flower(float xf, float yf) {
    x1 = xf;
    y1 = yf;
    size = 0.01;
    c = color(250, 153, 153);
  }
  
  //add flower to arraylist for display purposes
  void createFlower(Flower f) {
    flowers.add(f);
  }
  
  //display all flowers
  void display(float xf1, float yf1, float fsize) {
    //if (random(1) <= 0.5) {
    //  fill(c);
    //}
    //else {
    //  fill(252, 255, 215);
    //}
    //fill(c);
    flower(xf1, yf1, fsize);
  }
  
  //return flower arraylist
  ArrayList<Flower> getlist() {
    return flowers;
  }
  
  void flower(float x, float y, float size) {
  //push matrix to generate ellipses that look like flower petals
  pushMatrix();

  fill(c);
  translate(x,y);
  for (int i = 0; i <= 20; i++){
    //flowers change depend on size, which is randomly generated in setup
    ellipse(0, size*3, size, size*4);
    //rotate to make petals
    rotate(radians(20));
  }
  
  popMatrix();
  fill(0);
  //middle of flower, laid on top
  circle(x, y, size*2.5);
}
  
 

}
