/**
 Bauhaus pattern generator.
 
 @Tech Processing.org
 @Author P.Dymala
 */

import java.util.*;

//grid size, cell is square
int gridSize = 100;

//color pallete
color[] colors = {
  #F8FCF6,
  #EB9F3E,
  #DCAEA8,
  #BB3865,
  #552E58
};
void setup() {
  size(500, 500);
  noLoop();
  noStroke();
}

void draw() {

  for ( int i = 0; i < height; i+=gridSize) {
    for ( int j = 0; j < width; j+=gridSize) {

      
      //customize the look of the grid in this switch statement. Add more effects, pick few etc.
      int a = (int) random(4);
      switch(a) {
      case 0:
        sqq(j, i);
        arcc(j, i);
        break;
      case 1:
        sqq(j, i);
        sqqSm(j, i);
        break;
      case 2:
        sqq(j, i);
        twoCircles(j, i);
        break;
      case 3:
        sqq(j, i);
        triang(j, i);
        break;
      }
    }
  }
  
  //save("pattern.png");
}

void sqq(int x, int y) {
  pushMatrix();
  rectMode(CENTER);
  fill(colors[(int)random(colors.length)]);
  translate(x+gridSize/2, y+gridSize/2);
  rect(0, 0, gridSize, gridSize);

  popMatrix();
}


void sqqSm(int x, int y) {
  pushMatrix();
  rectMode(CENTER);
  fill(colors[(int)random(colors.length)]);
  translate(x+gridSize/2, y+gridSize/2);
  rect(0, 0, gridSize*0.5, gridSize*0.5);

  popMatrix();
}



void arcc(int x, int y) {
  pushMatrix();
  noStroke();
  rectMode(CENTER);
  fill(colors[(int)random(colors.length)]);
  int a = (int) random(4);
  switch(a) {
  case 0:
    translate(x+gridSize, y);
    arc(0, 0, gridSize*2, gridSize*2, HALF_PI, PI);
    break;
  case 1:
    translate(x, y+gridSize);
    arc(0, 0, gridSize*2, gridSize*2, HALF_PI+PI, TWO_PI);
    break;
  case 2:
    translate(x, y);
    arc(0, 0, gridSize*2, gridSize*2, 0, HALF_PI);
    break;
  case 3:
    translate(x+gridSize, y+gridSize);
    arc(0, 0, gridSize*2, gridSize*2, PI, HALF_PI+PI);
    break;
  }


  popMatrix();
}
void twoCircles(int x, int y) {

  pushMatrix();
  translate(x+gridSize/2, y+gridSize/2);
  noStroke();
  rectMode(CENTER);
  fill(colors[(int)random(colors.length)]);
  circle(0, 0, gridSize*0.8);


  fill(colors[(int)random(colors.length)]);
  circle(0, 0, gridSize*0.4);


  popMatrix();
}



void triang(int x, int y) {
  pushMatrix();
  translate(x, y);
  noStroke();

  fill(colors[(int)random(colors.length)]);

  beginShape();


  List<PVector> list= new LinkedList<PVector>();

  list.add( new PVector(0, 0));
  list.add(new PVector(gridSize, 0));
  list.add( new PVector(0, gridSize));
  list.add( new PVector(gridSize, gridSize));

  for (int i = 0; i < 3; i++) {

    int a = (int) random(list.size());
    vertex(list.get(a).x, list.get(a).y);
    list.remove(a);
  }

  endShape(CLOSE);



  popMatrix();
}
