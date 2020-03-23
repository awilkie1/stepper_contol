Point p;

int time = 3000;

void setup() {
  size(750,400);
  //oscSetup();
  udpSetup();
  p = new Point(new PVector(20,20), new PVector(680,20),new PVector(width/2,150));
}

void draw() {
  background(255);
  p.display();
}

void mousePressed(){
  p.clicked(mouseX,mouseY);
}

void keyPressed(){
 if (key=='r') {
   udpBroadcast("pixel 255 0 0 0");
 }
 if (key=='1') { time = 1000;}
 if (key=='2') { time = 5000;}
 if (key=='3') { time = 10000;}
 if (key== CODED) {
    if (keyCode== LEFT){
      udpBroadcast("stepperN 10");
    }
    if (keyCode== RIGHT){
      udpBroadcast("stepperP 10");
    }
  }
}
