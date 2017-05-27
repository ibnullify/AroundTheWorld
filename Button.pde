class Button {
  int x, y;      // Position of square button
  int rectSize;     // Diameter of rect
  int w, h; //width/height
  color rectColor, baseColor;
  color rectHighlight;
  color currentColor;
  boolean rectOver = false;
  String name;
  boolean active = false;
  int shape; //0 is rect, 1 is circle

  //deafult construcot, specifies location, size, color, and name
  Button(int x, int y, int w, int h, color rectColor, color rectHighlight, String name, int shape) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.rectColor = rectColor;
    this.rectHighlight = rectHighlight;
    this.name = name;
    this.shape = shape;
  }

  //returns whether or not the mouse is over the button
  boolean mouseOver() {
    if (shape == 0) {
      if (mouseX >= x && mouseX <= x+w && 
        mouseY >= y && mouseY <= y+h) {
        return true;
      } else {
        return false;
      }
    } else {
      if (distance(mouseX, mouseY, x, y) < w) {
        return true;
      } else { 
        return false;
      }
    }
  }

  //shows the button on the display window
  //updates to show a different color if the mouse is over
  void display() {
    stroke(255);
    fill(rectColor);
    if (mouseOver()) {
      fill(color(200, 255, 200));
      rect(width*0.7, 0, width*0.3, 60);
      fill(0);
      text(name, width *0.8 + 10, 30);
      fill(rectHighlight);
    }
    if ( shape == 0) {
      rect(x, y, w, h);
      fill(255);
      text(name, x+(int)(w/2)-(name.length()*4), y+(int)(h/2));
    } else if (shape ==1 ) {
      ellipse(x, y, w, h);
      fill(255);
      //text(name, x-(name.length()*4), y);
    }
  }


  //Clicking the button leads to the button becoming active

  void click() {
    if (mouseOver()) {
      if (name == "Rain") {
        active = true;
      } else {
        active = !active;
      }
    } else {
      text("Put the mouse on the button please", 5, 5);
    }
  }

  void update() {
    display();
  }
}