//objects from classes made
Star s = new Star(2, 3, 8);
Flower flow = new Flower(0,0);
Lilypad lil = new Lilypad(400,655);

float flowsize= 0.01;  //rate to make flowers grow
boolean grow = false; //check if flower should grow or not
boolean mp = false; //check mousepressed

//for displaying constellations
int countConst = 0;
ArrayList<PVector> displayC = new ArrayList<PVector>();

//variables for displaying grass and lake
int gx = width/2;
int gy = height/2+ 300;
int gdx = width + 500;
int gdy = height;


int lx = width/2 + 350;
int ly = height/2+450;
int ldx = width + 50;
int ldy = height;


void setup() {
  background(0);
  //setting up moving grass
  w = width+10;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
  
  //creating moving lilypads
  lil.createLily(new Lilypad(185, 700));
  lil.createLily(new Lilypad(380, 555));
  lil.createLily(new Lilypad(700, 650));
  lil.createLily(new Lilypad(555, 600));
  
  //establish stars
  s.makeStars();
  
  //make initial grass and lake
  size(800, 800);
  fill(#35605A);
  arc(width/2, height/2+300, width + 500, height, PI, 2*PI);
  fill(#29335C);
  arc(width/2, height/2+400, width + 50, height, PI, 2*PI);
  smooth();
  

}

void draw() {
  //display stars
  s.displayStar();
  //make moving grass
  calcWave();
  renderWave();
  //lake and grass
  arc(width/2, height/2+300, width + 500, height, PI, 2*PI);
  fill(#244083);
  arc(width/2, height/2+450, width + 50, height, PI, 2*PI);

  //on mouse press, make flower grow (while pressed, grows bigger)
  if (mp) {
    Flower add = new Flower(mouseX, mouseY);
    if (grow && flowsize <= 4) {
      flowsize+=0.1;
    }
    add.size = flowsize;
    flow.createFlower(add);
  }
  
  //display current flowers
  for (Flower flower : flow.getlist()) {
    fill(flower.c);
    flow.display(flower.x1, flower.y1, flower.size);
  }
  
  for (Lilypad lp : lil.getLilies()){
    lil.displayLil(lp.lix, lp.liy);
  }
  
  //make/display constellations
  if (countConst != 0) {
    stroke(255);
    for (int i = 0; i < s.getConst().size(); i+=2) {
      if (i >= s.getConst().size()) {
        break;
      }     
      if (i+1 >= s.getConst().size()) {
        break;
      }
      if(countConst >= 2){
        line(s.getConst().get(i).x, s.getConst().get(i).y, s.getConst().get(i+1).x, s.getConst().get(i+1).y);
      }
    }
  }
}

void mousePressed() {
  //variables for considering "center" of lake and grass
  int llx = 400;
  int lly = 800;
  //println(dist(mouseX, mouseY, llx, lly));
  
  //check if mouse pressed in lake
  if (dist(mouseX, mouseY, llx, lly) < 370) {
    //unlock lily to move (if pressed)
    for (Lilypad ll : lil.getLilies()) {
      if (dist(mouseX, mouseY, ll.lix, ll.liy) <= 75) {
          ll.lilylock = true;
      }
    }
  }
  
  //mouse pressed on grass
  else if (dist(mouseX, mouseY, llx, lly) >= 370 && dist(mouseX, mouseY, llx, lly) <= 510) {
    //booleans to unlock flower growth
    grow = true;
    mp = true;
  }
  
  //mouse pressed in sky
  else {
    for (Star str : s.getStars()) {
      //add star to constellation array to display later
      if (str.getArea(mouseX, mouseY)) {
        //s.addStar(str);
        s.connect(str);
        countConst++;
        return;
      }
    }
  }
}


void mouseReleased() {
  //set all unlock vars to false
  mp = false;
  grow = false;
  flowsize = 0.01;
  for (Lilypad ll : lil.getLilies()) {
    ll.lilylock = false;
  }
}

void mouseDragged() {
  mp = false;
  //move lilypad with mouse
   if (dist(mouseX, mouseY, 400, 800) < 300) {
    for (Lilypad ll : lil.getLilies()) {
      if (ll.lilylock) {
        ll.lix = mouseX;
        ll.liy = mouseY;
      }
    }
   }
}
