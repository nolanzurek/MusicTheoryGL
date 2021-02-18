ChordDisplay myDisplay = new ChordDisplay(13);

PFont font;

void setup() {

  background(#f4f1de);
  size(1920, 1080);
  
  font = loadFont("Montserrat-Medium-100.vlw");
  textFont(font);
  
  noLoop();
  
}

void draw() {
    
  myDisplay.drawCircleFifths(width/2, height/2, 300, 300, "0,2,6,8,10,12");

}
