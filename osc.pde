import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

String BROADCAST_IP = "10.0.2.255";//this is the main brodcast port
String IP = "10.0.2.10";//this is the main brodcast port
int BROADCAST_PORT = 8888;//for casting to .255
int INCOMING_PORT = 9999;//incoming port for host pc

void oscSetup(){
  oscP5 = new OscP5(this, INCOMING_PORT);//my ip address
  myRemoteLocation = new NetAddress(BROADCAST_IP, BROADCAST_PORT);//broadsast e.g 192.168.1.255 port 8888
}

void broadcast(OscMessage myMessage) {//main BROADCAST fuction
  int sendHowManyTimes = 2;
  for (int i=0; i < sendHowManyTimes; i++){
    oscP5.send(myMessage, myRemoteLocation);
    delay(20);
  }
}

void broadcastToLocation(OscMessage myMessage, NetAddress myLocation) {//main BROADCAST fuction
  for (int i = 0; i < 2; i++){
    oscP5.send(myMessage, myLocation);
    delay(20);
  }
  println("Updated " + myLocation);
}

void broadcastMessage(String CALL, int MESSAGE){
  int randomVal = int(random(1, 1000));
  OscMessage myMessage = new OscMessage(CALL);
  myMessage.add(randomVal);
  myMessage.add(MESSAGE);
  broadcast(myMessage);
  
  String typetag = myMessage.addrPattern();
  println(typetag);
}
void OSC_5(String CALL, int a, int b, int c, int d, int e){
  int randomVal = int(random(1, 1000));
  OscMessage myMessage = new OscMessage(CALL);
  myMessage.add(randomVal);
  myMessage.add(a);
  myMessage.add(b);
  myMessage.add(c);
  myMessage.add(d);
  myMessage.add(e);
  broadcast(myMessage);
  
  String typetag = myMessage.addrPattern();
  println(typetag);
}

void stepperDirect(String IP, String MAC, int steps, int time) {//osc to set the devices location.
  NetAddress deviceLocation;
  //deviceLocation = new NetAddress(BROADCAST_IP, BROADCAST_PORT);//deviceLocation = new NetAddress(BROADCAST_IP, BROADCAST_PORT);
   deviceLocation = new NetAddress(IP, BROADCAST_PORT);//deviceLocation = new NetAddress(BROADCAST_IP, BROADCAST_PORT);

  int randomVal = int(random(1, 1000));
  OscMessage myOscMessage = new OscMessage("/stepperMove");
  myOscMessage.add(randomVal);
  
  //myOscMessage.add(MAC);//might be required to filter out in future
  myOscMessage.add(100);//time before it should start
  myOscMessage.add(steps);//new location
  myOscMessage.add(time);//time to move 
  
  broadcastToLocation(myOscMessage, deviceLocation);
}

/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  print("### received an osc message.");
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage.typetag());
}
