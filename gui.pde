import controlP5.*;
ControlP5 gui;
Textarea myTextarea;//to display prints to on screen console
Println console;//to display prints to on screen console

int[] row  = {25, 75, 125, 175, 225, 275, 325, 375, 425, 475, 525, 575, 625, 675, 725};
int[] col  = {950, 1075};
int param = 0;
int shift = 500;
boolean all = false;

String CURRENTMOTOR = MOTORA;

void guiSetup(){
  gui = new ControlP5(this);//instalize gui
  gui();
}
void guiDraw(){
}

void gui() {
  
   //PFont pfont = createFont("font.ttf", 10, true);
   //ControlFont font = new ControlFont(pfont,18);
   //gui.setFont(font);

  // ----- TABS ------//
  
  gui.addButton("reboot")
     .setPosition(col[0], row[0])
     .setSize(200, 25)
     .setColorBackground(color(0, 80, 220))
     .setLabel("Reboot");
     
  gui.addButton("initiateOTA")
     .setPosition(col[0], row[1])
     .setSize(200, 25)
     .setColorBackground(color(0, 100, 200))
     .setLabel("Initiate OTA");
   
  gui.addButton("print")
     .setPosition(col[0], row[2])
     .setSize(75, 25)
     .setColorBackground(color(0, 120, 180))
     .setLabel("Print");
     
  gui.addButton("pole")
     .setPosition(col[1], row[2])
     .setSize(75, 25)
     .setColorBackground(color(0, 120, 180))
     .setLabel("Pole");
     
  gui.addButton("MOTORA")
    .setPosition(col[0], row[3])
    .setSize(75, 25)
    .setColorBackground(color(0, 120, 180))
    .setLabel("MOTOR A");
     
  gui.addButton("MOTORB")
     .setPosition(col[1], row[3])
     .setSize(75, 25)
     .setColorBackground(color(0, 120, 180))
     .setLabel("MOTOR B");
     
   gui.addButton("MOTORC")
    .setPosition(col[0], row[4])
    .setSize(75, 25)
    .setColorBackground(color(0, 120, 180))
    .setLabel("MOTOR A");
     
  gui.addButton("MOTORD")
     .setPosition(col[1], row[4])
     .setSize(75, 25)
     .setColorBackground(color(0, 120, 180))
     .setLabel("MOTOR B");
  
     
  gui.addButton("min")
     .setPosition(col[0], row[5])
     .setSize(75, 25)
     .setColorBackground(color(0, 120, 180))
     .setLabel("Min");
     
  gui.addButton("max")
     .setPosition(col[1], row[5])
     .setSize(75, 25)
     .setColorBackground(color(0, 120, 180))
     .setLabel("Max");
     
  gui.addButton("subtract")
     .setPosition(col[0], row[6])
     .setSize(75, 25)
     .setColorBackground(color(0, 120, 180))
     .setLabel("Subtract");
     
  gui.addButton("add")
     .setPosition(col[1], row[6])
     .setSize(75, 25)
     .setColorBackground(color(0, 120, 180))
     .setLabel("ADD");

   gui.addSlider("minSlider")
    .setPosition(col[0], row[7])
    .setBroadcast(false)
    .setSize(200, 30)
    .setRange(0, 1000)//44100
    .setLabelVisible(true)
    .setValue(50)
    .setBroadcast(true)
    .setLabel("Min Slider")
    .setColorForeground(color(0, 160, 140))
    .setColorBackground(color(0, 200, 100));
    
  
   gui.addSlider("maxSlider")
      .setPosition(col[0], row[8])
      .setBroadcast(false)
      .setSize(200, 30)
      .setRange(1000, 5000)//44100
      .setLabelVisible(true)
      .setValue(50)
      .setLabel("Max Slider")
      .setColorForeground(color(0, 160, 140))
      .setColorBackground(color(0, 220, 80))
      .setBroadcast(true);
      
    gui.addSlider("partnerSlider")
      .setPosition(col[0], row[10])
      .setBroadcast(false)
      .setSize(200, 30)
      .setRange(1000, 5000)//44100
      .setLabelVisible(true)
      .setValue(50)
      .setLabel("Patner Slider")
      .setColorForeground(color(0, 160, 140))
      .setColorBackground(color(0, 220, 80))
      .setBroadcast(true);
      
   gui.addSlider("distanceBetween")
      .setPosition(col[0], row[9])
      .setBroadcast(false)
      .setSize(200, 30)
      .setRange(1000, 5000)//44100
      .setLabelVisible(true)
      .setValue(50)
      .setLabel("Distance Between")
      .setColorForeground(color(0, 160, 140))
      .setColorBackground(color(0, 220, 80))
      .setBroadcast(true);
   
   
    gui.addSlider("relativeMove")
      .setPosition(col[0], row[12])
      .setBroadcast(false)
      .setSize(200, 30)
      .setRange(250, 3000)//44100
      .setLabelVisible(true)
      .setNumberOfTickMarks(12)
      .setValue(50)
      .setLabel("Relative Move")
      .setColorForeground(color(0, 160, 140))
      .setColorBackground(color(0, 220, 80))
      .setBroadcast(true);
      
   gui.addButton("all")
     .setPosition(col[0], row[13])
     .setSize(200, 25)
     .setColorBackground(color(0, 80, 220))
     .setLabel("All");
    
   gui.addButton("shiftSub")
     .setPosition(col[0], row[14])
     .setSize(75, 25)
     .setColorBackground(color(0, 120, 180))
     .setLabel("-");
     
   gui.addButton("shiftPlus")
     .setPosition(col[1], row[14])
     .setSize(75, 25)
     .setColorBackground(color(0, 120, 180))
     .setLabel("+");

 


}

void initiateOTA() {//will start OTA on all devices
  udpBroadcast("ota");
}
void reboot() {
  udpBroadcast("reset");
}

void MOTORA() { CURRENTMOTOR = MOTORA;println("MOTORA " + MOTORA);}
void MOTORB() { CURRENTMOTOR = MOTORB;println("MOTORB " + MOTORB);}
void MOTORC() { CURRENTMOTOR = MOTORC;println("MOTORC " + MOTORC);}
void MOTORD() { CURRENTMOTOR = MOTORD;println("MOTORD " + MOTORD);}
void min(){ param = 0;}
void max(){ param = 1;}
void print(){udpBroadcast("print");}
void pole(){udpBroadcast("udpPole");}

void subtract(){ 
  if (param == 0){
    udpBroadcastDirect("moveMin -10", CURRENTMOTOR);
  }
  if (param == 1){
    udpBroadcastDirect("moveMax -10", CURRENTMOTOR);
  }
}
void add(){ 
  if (param == 0){
    udpBroadcastDirect("moveMin 10", CURRENTMOTOR);
  }
  if (param == 1){
    udpBroadcastDirect("moveMax 10", CURRENTMOTOR);
  }
}
void minSlider(float minSlider){
  udpBroadcastDirect("setMin " + int(minSlider), CURRENTMOTOR);
  //tcpBroadcastDirect("setMin " + int(minSlider), CURRENTMOTOR);
}
void maxSlider(float maxSlider){
  udpBroadcastDirect("setMax " + int(maxSlider), CURRENTMOTOR);
  //tcpBroadcastDirect("setMax " + int(maxSlider), CURRENTMOTOR);
}
void partnerSlider(float partnerSlider){
  udpBroadcastDirect("partnerMin " + int(partnerSlider), CURRENTMOTOR);
}
void distanceBetween(float distanceSlider){
  udpBroadcast("setDistance " + int(distanceSlider));
}

void relativeMove(float Shift){
  shift = int(Shift);
}


void shiftSub(){
  if (all){
    udpBroadcast("stepperMove " + -shift);
  } else {
    udpBroadcastDirect("stepperMove " + -shift, CURRENTMOTOR);
  }
}
void shiftPlus(){
   if (all){
    udpBroadcast("stepperMove " + shift);
  } else {
    udpBroadcastDirect("stepperMove " + shift, CURRENTMOTOR);
  }
}
void all(){
  if (all){all=false;} else { all=true;}
}
