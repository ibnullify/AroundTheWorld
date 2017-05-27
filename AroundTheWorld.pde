Player player;
PImage map;
ArrayList<Button> placeButtons = new ArrayList<Button>();
String miniGame;
boolean mainGame;
boolean flint, syria, antarctic, china, madagascar;
boolean areYouSure;

//Flint: collect lead from water //199 197
//Syria: transport refugees safely across map / like frogger //513 229
//Arctic: Polar Bears losing ice / walk polar bears through thin ice to safety //454 524
//China: pollution / plant trees //690 251
//Africa: hunger / grow food ie: farmville / diner dash (soup kitchen) //533 384

void setup() {
  map = loadImage("Earth.png");
  size(900, 550);
  player = new Player();
  makePlaceButtons();
  mainGame = true;
  flint = syria = antarctic = china = madagascar = false;
  areYouSure = false;
}

void makePlaceButtons() {
  placeButtons.add(new Button(199, 197, 20, 20, color(120, 0, 0), color(0, 0, 120), "Flint Water Crisis", 1));
  placeButtons.add(new Button(513, 229, 20, 20, color(120, 0, 0), color(0, 0, 120), "Syrian Refugee Crisis", 1));
  placeButtons.add(new Button(454, 524, 20, 20, color(120, 0, 0), color(0, 0, 120), "Arctic Global Warming", 1));
  placeButtons.add(new Button(690, 251, 20, 20, color(120, 0, 0), color(0, 0, 120), "Chinese Pollution", 1));
  placeButtons.add(new Button(533, 384, 20, 20, color(120, 0, 0), color(0, 0, 120), "Madagascar's Need for Food", 1));
}

void draw() {
  drawMap();
  if (areYouSure) {
    areYouSure(miniGame);
  }
}

void mouseClicked() {
  //for (Button button : buttons) {
  //  if (button.active) {
  //    if (mouseX < environment.rain.length) {
  //      if (button.name == "Plant") {
  //        plants.add(new Plant(mouseX, mouseY));
  //        allPlants.add(plants.get(plants.size()-1));
  //        print("planted");
  //      }
  //      if (button.name == "Bacteria") {
  //        bacteria.add(new Bacteria(mouseX, mouseY));
  //        allBacteria.add(bacteria.get(bacteria.size()-1));
  //        print("bacteriaed");
  //      }
  //    }
  //  }
  //}
  for (Button button : placeButtons) {
    if (button.mouseOver()) {
      areYouSure = true;
      areYouSure(button);
      //if (button.name == "Rain") {
      //  rain = true;
      //} else if (button.name == "Sunlight") {
      //  sunlight = true;
      //} else {
      //  //else if (button.name == "Plant"){
      //  //button.active = !button.active;
      //  //} else {
      //  button.click();
      //}
    }
  }
}

void areYouSure( String miniGame ) {
  fill(0);
  rect(width/4, height/4, width/2, height/2);
  fill(255);
  text(placeButton.name, (int)(width/3), (int)(height/3));
}


void drawMap() {
  image(map, 0, 0);
  runPlaceButtons();
  fill(color(120, 0, 0));
  //ellipse(199, 197, 15, 15);
  //ellipse(513, 229, 15, 15);
  //ellipse(454, 524, 15, 15);
  //ellipse(690, 251, 15, 15);
  //ellipse(533, 384, 15, 15);
  //fill(0);
  //text("F", 199, 197);
  //text("S", 513, 229);
  //text("A", 454, 524);
  //text("C", 690, 251);
  //text("M", 533, 384);
}
void runPlaceButtons() {
  for (int i = 0; i < placeButtons.size(); i++) {
    placeButtons.get(i).update();
  }
}





float distance(int x1, int y1, int x2, int y2) {
  return sqrt( pow(x1-x2, 2) + pow(y1-y2, 2));
}