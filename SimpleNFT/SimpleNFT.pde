
//Cat and gadgets generated thanks to Stable Diffusion.




//the code is so terrible. change to switch...


//should be a precise counter database of images (features), than created images. Not probability...

PShape cat;
float chanceToHaveHat = 0.1; //layer 6,7
float chanceToHaveGlasses = 0.2; //layer 8 okular
float chanceToHaveDifferntEyes = 0.2; //layer 4,5 eyes
int howManyImages = 9;


void setup() {
  size(500, 500);
  cat = loadShape("cat.svg");
}

void draw() {
  background(0);
  noStroke();
  scale(width/cat.width);
  cat.disableStyle();

  float hat = random(1);
  float eyes = random(1);
  float glasses = random(1);

  //0- square
  //1- bg under cat
  //2 - bg around cat
  //3 ??
  //4 eye
  //5 eye
  // 6 hat
  //7 hat
  // 8 glasses
  for (int i = 0; i < cat.getChildCount(); i++) {




    if ((i == 4 ) &&  (eyes < chanceToHaveDifferntEyes) ) {

      fill(random(255), random(255), random(255));
      shape(cat.getChild(i), 0, 0);
      fill(random(255), random(255), random(255));
      shape(cat.getChild(i+1), 0, 0);
    } else if ((i == 4 ) && (eyes > chanceToHaveDifferntEyes) ) {

      fill(random(255), random(255), random(255));
      shape(cat.getChild(i), 0, 0);
      shape(cat.getChild(i+1), 0, 0);
    } else if (i == 5 ) {
      //drawn in i == 4;
    }

    //hat
    else if ((i == 6 ) && (hat < chanceToHaveHat) ) {

      //terrible. because 2 parts of hat are 2 objext. should be grouped or on another layer together

      PShape hat1 = cat.getChild(i);
      hat1.enableStyle();
      PShape hat2 = cat.getChild(i+1);
      hat2.enableStyle();
      shape(hat1, 0, 0);
      shape(hat2, 0, 0);
    } else if ((i == 6 ) && (hat > chanceToHaveHat) ) {
    }
    //part of hat
    else if (i == 7 ) {
      //drawn in i == 6;
    } else if ((i == 8 ) && (glasses < chanceToHaveGlasses) ) {

      fill(random(255), random(255), random(255));
      shape(cat.getChild(i), 0, 0);
    } else if ((i == 8 ) && (glasses > chanceToHaveGlasses) ) {
    } else {

      fill(random(255), random(255), random(255));
      shape(cat.getChild(i), 0, 0);
    }
  }
  if (howManyImages == 0) {
    noLoop();
  } else {
    saveFrame("cat-######.png");
  }
  howManyImages--;
}
