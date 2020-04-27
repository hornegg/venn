float bigRadius;
int alpha = 128;
float myTextSize = 20;

void setup() {
  size(1000, 750);
  // println("Aspect ratio", (float)width / (float)height);

  bigRadius = 0.24 * width;
  
  background(255);
  noStroke();
  ellipseMode(RADIUS);
  translate(0.5 * width, 0.5 * height);
  textSize(myTextSize);
  
  fill(255, 0, 0, alpha);
  ellipse(-bigRadius, 0, bigRadius, bigRadius);
  blackText("Theism", -bigRadius - (0.18 * width), 0);
  
  fill(0, 255, 0, alpha);
  ellipse(0, 0, bigRadius, bigRadius);
  blackText("Secularism", 0, (1.5 * myTextSize) - bigRadius);
  
  fill(0, 0, 255, alpha);
  ellipse(bigRadius, 0, bigRadius, bigRadius);
  blackText("Atheism", bigRadius + (0.18 * width), 0);

  worldReligion(6, "Judaism");
  worldReligion(5, "Christianity");
  worldReligion(4, "Islam");
  worldReligion(3, "Sikhism");
  worldReligion(2, "Hinduism");
  worldReligion(1, "Buddhism");

  // CoS
  push();
  fill(0);
  translate(0.11 * width, 0);
  float radius = 0.035 * height;
  ellipse(0, 0, radius, radius);
  stroke(255);
  noFill();
  beginShape();
  rotate(HALF_PI);
  for (float angle = 0; angle <= 4*PI; angle += (4*PI) / 5) {
    vertex(radius * cos(angle), radius * sin(angle));   
  }
  endShape();
  
  pop();
  blackText("CoS", 0.11 * width, (-0.035 * height) - (0.5 * myTextSize));

  // TST
  fill(64, 0, 64, alpha);
  ellipse(0.04 * width, 0, 0.050 * width, 0.035 * height);
  blackText("TST", 0.04 * width, 0);

  // ToS
  fill(255, 255, 0, 200);
  ellipse(-0.1 * width, 0, 0.035 * height, 0.035 * height);
  blackText("ToS", -0.1 * width, 0);
}

void blackText(String text, float x, float y) {
  push();
  stroke(0);
  fill(0);
  text(text, x - (0.5 * textWidth(text)), y + (0.3 * myTextSize));
  pop();
}

float clock(float hour) {
  return ((hour * PI) / 6) - HALF_PI;
}

void worldReligion(float index, String text) {
  float w = 0.080 * width;
  float h = 0.035 * width;
  float count = 6;
  push();
  fill(255, 0, 255, alpha);
  rotate(map(index, 1, count, clock(7.6), clock(10.4)));
  translate(bigRadius + (0.25 * w), 0);
  ellipse(0, 0, w, h);
  scale(-1, -1);
  blackText(text, 0, 0);
  pop();
}
