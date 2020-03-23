class Point {

  PVector position;    // position of pendulum ball
  PVector originb;      // position of arm origin
  PVector origina;      // position of arm origin
  float ra;             // Length of arm
  float rb;             // Length of arm

  float ballr;         // Ball radius
  float damping;       // Arbitary damping amount

  boolean dragging = false;

  // This constructor could be improved to allow a greater variety of pendulums
  Point(PVector origina_, PVector originb_, PVector position_) {
    // Fill all variables
    origina = origina_;
    originb = originb_;
    position = position_;
    ra = (sqrt(pow((origina.x-position.x), 2) + pow((origina.y-position.y), 2)));
    rb = (sqrt(pow((originb.x-position.x), 2) + pow((originb.y-position.y), 2)));
    ballr = 20.0;      // Arbitrary ball radius
  }
  
  void update() {
    // As long as we aren't dragging the pendulum, let it swing!
    //if (!dragging) {
       //println("UPDATE");
       ra = (sqrt(pow((origina.x-position.x), 2) + pow((origina.y-position.y), 2)));
       rb = (sqrt(pow((originb.x-position.x), 2) + pow((originb.y-position.y), 2)));
       println("New Position " + ra +" : "+ rb);
       updateStrand(0, ra, time);
       updateStrand(1, rb, time);
   // }
  }
  
  void display() {
   
    stroke(0);
    strokeWeight(2);
    // Draw the arm
    line(origina.x, origina.y, position.x, position.y);
    line(originb.x, originb.y, position.x, position.y);
    ellipseMode(CENTER);
    fill(175);
    if (dragging) fill(0);
    // Draw the ball
    ellipse(position.x, position.y, ballr, ballr);
  }


  //// This checks to see if we clicked on the pendulum ball
  void clicked(int mx, int my) {
     position.x = mx;
     position.y = my;
     //println("new Position " + mx +" : "+ my);
     update();
     
  }
  
  int lengthConvertion(float distance){
   int steps = int (distance * 15);//the calculations from length(cm) to steps
   return steps;
  }
  void updateStrand(int val, float distance, int time){
    int steps = lengthConvertion(distance);
    String command = "stepperMove " + 100 + " " + steps + " " + time;
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
