class Point {

  PVector position;    // position of pendulum ball
  PVector originb;      // position of arm origin
  PVector origina;      // position of arm origin
  float ra;             // Length of arm
  float rb;             // Length of arm

  float ballr;         // Ball radius
  float damping;       // Arbitary damping amount

  PVector cableLength;// position of pendulum ball
  PVector positionTarget;// position of pendulum ball
  PVector positionCurrent;// position of pendulum ball
  PVector positionPrev;// position of pendulum ball
  PVector positionSpeed;// position of pendulum ball

  float udpCableLengthA;
  float udpCableLengthB;
  
  float udpCableMaxA, udpCableMaxB;
  float udpCableMinA, udpCableMinB;

  boolean cableTentionState;
  boolean lastCableTentionState;
  
  

  // This constructor could be improved to allow a greater variety of pendulums
  Point(PVector origina_, PVector originb_, PVector position_) {
    // Fill all variables
    origina = origina_;
    originb = originb_;
    position = position_;
    ra = (sqrt(pow((origina.x-position.x), 2) + pow((origina.y-position.y), 2)));
    rb = (sqrt(pow((originb.x-position.x), 2) + pow((originb.y-position.y), 2)));
    ballr = 20.0;      // Arbitrary ball radius

    positionTarget = position_;
    positionCurrent = new PVector(0.0, 0.0);
    positionPrev = new PVector(0.0, 0.0);
    positionSpeed = new PVector(0.0, 0.0);

    cableLength = new PVector(ra, rb);

    udpCableLengthA = ra;
    udpCableLengthB = ra;

  }

  void update(){
       ra = (sqrt(pow((origina.x-position.x), 2) + pow((origina.y-position.y), 2)));
       rb = (sqrt(pow((originb.x-position.x), 2) + pow((originb.y-position.y), 2)));
       println("New Position " + ra +" : "+ rb);
       updateStrand(0, ra, time);
       updateStrand(1, rb, time);

  }

  void display() {

    ellipseMode(CENTER);

    //positionSpeed.x = positionCurrent.x - positionPrev.x;
    //positionPrev.x = positionCurrent.x;
    //positionCurrent.x = positionCurrent.x + (positionSpeed.x*0.999) + ((positionTarget.x-positionCurrent.x)*0.00008);
    
    //positionCurrent.x = lerp(positionPrev.x, positionTarget.x, 0.01);

    // float lerp(float v0, float v1, float t) {
    //     return v0 + t * (v1 - v0);
    //   }

    //positionSpeed.y = positionCurrent.y - positionPrev.y;
    //positionPrev.y = positionCurrent.y;
    //positionCurrent.y = positionCurrent.y + (positionSpeed.y*0.999) + ((positionTarget.y-positionCurrent.y)*0.00008);
    
    //positionCurrent.y = lerp(positionPrev.y, positionTarget.y, 0.01);

    cableLength.x = (sqrt(pow((origina.x-positionCurrent.x), 2) + pow((origina.y-positionCurrent.y), 2)));
    cableLength.y = (sqrt(pow((originb.x-positionCurrent.x), 2) + pow((originb.y-positionCurrent.y), 2)));
    
    stroke(255, 0, 0);
    //fill(0);
    noFill();
    ellipse((origina.x*scale), (origina.y*scale), ((udpCableMaxA*2)*scale), ((udpCableMaxA*2)*scale));
    ellipse((originb.x*scale), (originb.y*scale), ((udpCableMaxB*2)*scale), ((udpCableMaxB*2)*scale));
    
    ellipse((origina.x*scale), (origina.y*scale), ((udpCableMinA*2)*scale), ((udpCableMinA*2)*scale));
    ellipse((originb.x*scale), (originb.y*scale), ((udpCableMinB*2)*scale), ((udpCableMinB*2)*scale));
    
    //cables
    stroke(255);
    line((origina.x*scale), (origina.y*scale), (positionCurrent.x*scale), (positionCurrent.y*scale));
    line((originb.x*scale), (originb.y*scale), (positionCurrent.x*scale), (positionCurrent.y*scale));

    //ball
    fill(120);
    ellipse((positionCurrent.x*scale), (positionCurrent.y*scale), ballr, ballr);
    text("x: "+ cableLength.x, (positionCurrent.x*scale), ((positionCurrent.y)*scale)+30);
    text("y: "+ cableLength.y, (positionCurrent.x*scale), ((positionCurrent.y)*scale)+45);

    stroke(255,50);
    strokeWeight(2);
    line((origina.x*scale), (origina.y*scale), (position.x*scale), (position.y*scale));
    line((originb.x*scale), (originb.y*scale), (position.x*scale), (position.y*scale));
    fill(120,50);
    ellipse((position.x*scale), (position.y*scale), ballr, ballr);


    ellipse((origina.x*scale), (origina.y*scale), ((udpCableLengthA*2)*scale), ((udpCableLengthA*2)*scale));
    ellipse((originb.x*scale), (originb.y*scale), ((udpCableLengthB*2)*scale), ((udpCableLengthB*2)*scale));
    
    fill(255);
    text("min A: "+ udpCableMinA, width-200, 20);
    text("max A: "+ udpCableMaxA, width-100, 20);
    text("min B: "+ udpCableMinB, width-200, 40);
    text("max B: "+ udpCableMaxB, width-100, 40);
    //theta = acos(((length1*length1)+(width1*width1)-(length2*length2))/(2*length1*width1));
    //float ballY = length1*sin(theta);
    //float ballX = sqrt((length1*length1)-(ballY*ballY));
    
    //PYTHA
    //float angleA = acos((sq(udpCableLengthA) + sq(DISTANCETOP) - sq(udpCableLengthB))/(2*(udpCableLengthA*DISTANCETOP)));
    //float angleB = acos((sq(udpCableLengthB) + sq(DISTANCETOP) - sq(udpCableLengthA))/(2*(udpCableLengthB*DISTANCETOP)));

    ////float angleA = acos(((udpCableLengthA*udpCableLengthA) + (DISTANCETOP*DISTANCETOP) - (udpCableLengthB*udpCableLengthB))/(2*(udpCableLengthA*DISTANCETOP))));
    //float Height = (udpCableLengthA)*sin(angleA);
    //float Width = sqrt((udpCableLengthA*udpCableLengthA)-(Height*Height));
    ////println(angleA + " : " + angleB);
    ////println(cableLength.x + " : " + udpCableLengthA);

    //float HeightB = (udpCableLengthB)*sin(angleB);
    //float WidthB = sqrt((udpCableLengthB*udpCableLengthB)-(HeightB*HeightB));

//    fill(255);
//    text("L: "+udpCableLengthA, origina.x + 50, origina.y+30);
//    text(degrees(angleA), origina.x + 50, origina.y+10);

//    text("L: "+udpCableLengthB, originb.x - 50, originb.y+30);
//    text(degrees(angleB), originb.x - 50, originb.y+10);

//    text(Height, positionCurrent.x/2, positionCurrent.y/2);
//    line(Width, 0, Width, Height);
//    ellipse(position.x, Height, 10, 10);

//    text(HeightB, positionCurrent.x/2, positionCurrent.y/2);
//    line(600-WidthB, 0, 600-WidthB, HeightB);
//    ellipse(position.x, HeightB, 10, 10);

//    line(originb.x/2, 0, originb.x/2, height);

    //float cableTention = (udpCableLengthA+udpCableLengthB)-DISTANCETOP;
    //println(cableTention);

    //cable testion code
    // if (cableTention<=10){
    //   //println("STOP!!!!");
    //   cableTentionState = true;
    //   udpBroadcastDirect("active 1", MOTORA);
    //   udpBroadcastDirect("active 1", MOTORB);
    // } else {
    //   cableTentionState = false;
    //   udpBroadcastDirect("active 0", MOTORA);
    //   udpBroadcastDirect("active 0", MOTORB);
    // }
    //
    //if(cableTentionState != lastCableTentionState){
    //  //if (cableTentionState){
    //  //  udpBroadcastDirect("active 0", MOTORA);
    //  //  udpBroadcastDirect("active 0", MOTORB);
    //  //} else {
    //  //  udpBroadcastDirect("active 1", MOTORA);
    //  //  udpBroadcastDirect("active 1", MOTORB);
    //  //}
    //  lastCableTentionState = cableTentionState;
    // }



}


  //// This checks to see if we clicked on the pendulum ball
  void clicked(float mx, float my) {
     position.x = mx;
     position.y = my;

     positionTarget.x = mx;
     positionTarget.y = my;

     //println("new Position " + mx +" : "+ my);
     update();

  }

  int lengthConvertion(float distance){
   int steps = int (distance);//the calculations from length(cm) to steps
   return steps;
  }
  
  float getMaxA(){ return udpCableMaxA;}
  float getMaxB(){ return udpCableMaxB;}
  float getMinA(){ return udpCableMinA;}
  float getMinB(){ return udpCableMinB;}

  void updateStrand(int val, float distance, int time){
    int steps = lengthConvertion(distance);
    String command = "stepperInter " + steps + " " + 0.1 + " " + 0.97 + " " + 0.1 + " " + 0.0;
    if (val ==0){//motor 1
      //stepperDirect(MOTORA, "abcd", steps, time);
      udpBroadcastDirect(command, MOTORA);

    }
    if (val ==1){//motor 1
      //stepperDirect(MOTORB, "abcd", steps, time);
      udpBroadcastDirect(command, MOTORB);

    }
  }
  void udpUpdate(float distance, float min, float max, int val){
    if (val ==0){//motor 1
      udpCableLengthA = distance;
      udpCableMinA = min;
      udpCableMaxA = max;
      //println(distance + " : " + udpCableLength);
    }
    if (val ==1){//motor 1
      udpCableLengthB = distance;
      udpCableMinB = min;
      udpCableMaxB = max;
    }
  }
}
