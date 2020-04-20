Point p;

int time = 6000;
int currentTime = 0;
int startTime = 0;
boolean start = false;
void setup() {
  size(700,500);
  //oscSetup();
  udpSetup();
  p = new Point(new PVector(20,20), new PVector(680,20),new PVector(width/2,150));
}

void draw() {
  background(0);
  p.display();
  currentTime = millis();
  if (start){
    if ((currentTime - startTime) >= 12000){
      p.clicked(int(random(0, 300)),int(random(0, 300)));
      startTime = millis();
    }
  }

}

void mousePressed(){
  p.clicked(mouseX,mouseY);
}

void keyPressed(){
 if (key=='r') {
   udpBroadcast("reset");
 }
 //if (key=='1') { time = 1000;}
 //if (key=='2') { time = 5000;}
 //if (key=='3') { time = 10000;}
 if (key=='1') { udpBroadcast("speed 1000");}
 if (key=='2') { udpBroadcast("speed 3200");}
 if (key=='3') { udpBroadcast("speed 3600");}
 if (key=='4') { udpBroadcast("speed 5000");}
 if (key=='5') { udpBroadcast("speed 6000");}
 if (key=='6') { udpBroadcast("speed 7000");}
 if (key=='7') { udpBroadcast("speed 8000");}
 if (key=='8') { udpBroadcast("speed 9000");}
 if (key=='h') { udpBroadcast("home");}
 if (key=='0') { p.clicked(20,20);}
 if (key=='-') { p.clicked(width/2,150);}
 if (key=='=') { p.clicked(680,20);}


 if (key==' ') {
   if (start) start = false;
   if (start==false) start = true;
 }

 if (key=='a') { udpBroadcast("motorON");}
 if (key=='s') { udpBroadcast("motorOFF");}
 if (key=='o') { udpBroadcast("ota");}
 if (key== CODED) {
    if (keyCode== LEFT){
      udpBroadcast("stepperN 3000");
    }
    if (keyCode== RIGHT){
      udpBroadcast("stepperP 3000");
    }
  }
}
