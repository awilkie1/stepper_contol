 Point p;

int time = 6000;
int currentTime = 0;
int startTime = 0;
boolean start = false;

int distance = 1000;
float DISTANCETOP = 200.0;
String MOTORA = "10.0.2.2";
String MOTORB = "10.0.2.3";

float scale = 0.5;
 

void setup() {
  size(1200,900);
  //oscSetup();
  udpSetup();
  p = new Point(new PVector(0,0), new PVector(DISTANCETOP,0),new PVector(width/2,150));
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
  p.clicked(mouseX/scale,mouseY/scale);
}

void keyPressed(){
 if (key=='r') { udpBroadcast("reset");}
 //if (key=='1') { time = 1000;}
 //if (key=='2') { time = 5000;}
 //if (key=='3') { time = 10000;}
 //if (key=='1') { udpBroadcast("speed 1000");}
 //if (key=='2') { udpBroadcast("speed 2000");}
 //if (key=='3') { udpBroadcast("speed 2500");}
 //if (key=='4') { udpBroadcast("speed 3000");}
 //if (key=='5') { udpBroadcast("speed 3200");}
 //if (key=='6') { udpBroadcast("speed 7000");}
 //if (key=='7') { udpBroadcast("speed 8000");}
 //if (key=='8') { udpBroadcast("speed 9000");}
 
 //if (key=='1') { udpBroadcastDirect("stepperMin", MOTORA);}
 //if (key=='2') { udpBroadcastDirect("stepperMax", MOTORA);}
 //if (key=='9') { udpBroadcastDirect("stepperMin", MOTORB);}
 //if (key=='0') { udpBroadcastDirect("stepperMax", MOTORB);}
 if (key=='1') { udpBroadcast("transitSpeed 1");}
 if (key=='2') { udpBroadcast("transitSpeed 2");}
 if (key=='3') { udpBroadcast("transitSpeed 3");}
 if (key=='4') { udpBroadcast("transitSpeed 4");}
 if (key=='5') { udpBroadcast("transitSpeed 5");}
 if (key=='6') { udpBroadcast("transitSpeed 6");}
 if (key=='7') { udpBroadcast("transitSpeed 7");}
 if (key=='8') { udpBroadcast("transitSpeed 83");}

 if (key=='h') { udpBroadcast("home");}
 if (key=='g') { udpBroadcastDirect("home", MOTORA);}
 if (key=='j') { udpBroadcastDirect("home", MOTORB);}

 if (key=='c') { udpBroadcast("center");}
// if (key=='s') { udpBroadcast("stop");}

 if (key=='0') { p.clicked(20,20);}
 if (key=='-') { p.clicked(width/2,150);}
 if (key=='=') { p.clicked(680,20);}

 if (key=='q') { udpBroadcastDirect("stepperMove " + -distance, MOTORA);}
 if (key=='w') { udpBroadcastDirect("stepperMove " + distance, MOTORA);}
 if (key=='z') { udpBroadcastDirect("stepperMove " + -distance, MOTORB);}
 if (key=='x') { udpBroadcastDirect("stepperMove " + distance, MOTORB);}
 
 if (key=='a') { udpBroadcastDirect("stepperShiftP" + (distance), MOTORA);}
 if (key=='s') { udpBroadcastDirect("stepperShiftN" + (distance), MOTORA);}
 if (key=='d') { udpBroadcastDirect("stepperShiftP" + (distance), MOTORB);}
 if (key=='f') { udpBroadcastDirect("stepperShiftN" + (distance), MOTORB);}
 
 if (key=='h') { udpBroadcastDirect("moveMin -10", MOTORA);}
 if (key=='j') { udpBroadcastDirect("moveMin 10", MOTORA);}
 if (key=='k') { udpBroadcastDirect("moveMax -10", MOTORA);}
 if (key=='l') { udpBroadcastDirect("moveMax 10", MOTORA);}
 
 if (key=='v') { udpBroadcastDirect("moveMin -10", MOTORB);}
 if (key=='b') { udpBroadcastDirect("moveMin 10", MOTORB);}
 if (key=='n') { udpBroadcastDirect("moveMax -10", MOTORB);}
 if (key=='m') { udpBroadcastDirect("moveMax 10", MOTORB);}

 if (key==' ') {
   //if (start) start = false;
   //if (start==false) start = true;
   udpBroadcast("update");
 }
 if (key=='`') {udpBroadcast("print");}
 if (key=='/') {udpBroadcast("udpPole");}

 if (key=='a') { udpBroadcast("motorON");}
 if (key=='s') { udpBroadcast("motorOFF");}
 if (key=='o') { udpBroadcast("ota");}
 if (key== CODED) {
    if (keyCode== LEFT){
      udpBroadcast("stepperMove -3000");
    }
    if (keyCode== RIGHT){
      udpBroadcast("stepperMove 3000");
    }
  }
}
