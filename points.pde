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

    positionSpeed.x = positionCurrent.x - positionPrev.x;
    positionPrev.x = positionCurrent.x;
    positionCurrent.x = positionCurrent.x + (positionSpeed.x*0.999) + ((positionTarget.x-positionCurrent.x)*0.00008);

    positionSpeed.y = positionCurrent.y - positionPrev.y;
    positionPrev.y = positionCurrent.y;
    positionCurrent.y = positionCurrent.y + (positionSpeed.y*0.999) + ((positionTarget.y-positionCurrent.y)*0.00008);

    cableLength.x = (sqrt(pow((origina.x-positionCurrent.x), 2) + pow((origina.y-positionCurrent.y), 2)));
    cableLength.y = (sqrt(pow((originb.x-positionCurrent.x), 2) + pow((originb.y-positionCurrent.y), 2)));

    stroke(255);
    if (cableLength.x>600.0)stroke(255,0,0);
    line(origina.x, origina.y, positionCurrent.x, positionCurrent.y);

    stroke(255);
    if (cableLength.y>600.0)stroke(255,0,0);
    line(originb.x, originb.y, positionCurrent.x, positionCurrent.y);

    stroke(255);
    fill(120);
    ellipse(positionCurrent.x, positionCurrent.y, ballr, ballr);
    text("x: "+ cableLength.x, positionCurrent.x, positionCurrent.y+30);
    text("y: "+ cableLength.y, positionCurrent.x, positionCurrent.y+45);



    stroke(255,50);
    strokeWeight(2);
    line(origina.x, origina.y, position.x, position.y);
    line(originb.x, originb.y, position.x, position.y);
    fill(120,50);
    ellipse(position.x, position.y, ballr, ballr);

}


  //// This checks to see if we clicked on the pendulum ball
  void clicked(int mx, int my) {
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
  void updateStrand(int val, float distance, int time){
    int steps = lengthConvertion(distance);
    String command = "stepperInter " + 100 + " " + steps + " " + time;
    if (val ==0){//motor 1
      //stepperDirect("10.0.2.2", "abcd", steps, time);
      udpBroadcastDirect(command, "10.0.2.2");
    }
    if (val ==1){//motor 1
      //stepperDirect("10.0.2.3", "abcd", steps, time);
      udpBroadcastDirect(command, "10.0.2.3");

    }
  }
}
