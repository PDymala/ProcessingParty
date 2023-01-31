/**
 Another simple pseudo nft generator.
 
 @Tech Processing.org
 @Author P.Dymala
 */


float specialCollectable = 0.1; //%
int lines = 7;
int howManyImages = 9;

boolean special = false;

void setup() {
  size(500, 500);
  noLoop();
}


void draw() {
  if (random(1) < specialCollectable) special = true;

  background(0);
  float startingStroke = random(20)+10;
  strokeWeight(startingStroke);
  stroke(random(255), random(255), random(255), 200);
  PVector current = new PVector(random(width), random(height));

  for (int i = 0; i < lines; i++) {
    if (special)  stroke(random(255), random(255), random(255), 200);

    strokeWeight(startingStroke -= startingStroke/lines);
    PVector end = new PVector(random(width), random(height));

    line(current.x, current.y, end.x, end.y);

    current = end;
  }
  filter(BLUR, 3);

  if (howManyImages == 0) {
    noLoop();
  } else {
    saveFrame("line-######.png");
  }
  howManyImages--;
}
