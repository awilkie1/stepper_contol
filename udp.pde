import hypermedia.net.*;

UDP udp;  // the UDP object

void udpSetup(){
  udp = new UDP(this, INCOMING_PORT, "10.0.2.10");
  udp.listen(true);
  udp.broadcast(true);
}


void udpBroadcast(String command){
  int sendHowManyTimes = 2;
  //int timeStamp = int((System.currentTimeMillis() - timeDiff) * 1000);
  int random = int(random(0,20000));
  println("Sent Command: " + command);
  for (int i=0; i < sendHowManyTimes; i++) {
    //udp.send(timeStamp + " " + command, "224.1.1.10", 2704);
    udp.send(random + " " + command, BROADCAST_IP, 2704);
  }
}
void udpBroadcastDirect(String command, String ip){
  //int timeStamp = int((System.currentTimeMillis() - timeDiff) * 1000);
  int random = int(random(0,20000));
  udp.send(random + " " + command, ip, 2704);
  //udp.send(command, ip, 2704);
  println("Sent " + ip + " Command: " + command);
}

void receive( byte[] data ) {       // <-- default handler
  data = subset(data, 0, data.length);
  String message = new String( data );

  if (message.substring(0, 4).equals("boot")) {
      String DEVICE_MAC = message.substring(5, 22);
      String DEVICE_IP = message.substring(25);
  }
  else {

  }
}

//void stepperUDPDirect(String IP, String MAC, int steps, int time) {//osc to set the devices location.
//  NetAddress deviceLocation;
//  //deviceLocation = new NetAddress(BROADCAST_IP, BROADCAST_PORT);//deviceLocation = new NetAddress(BROADCAST_IP, BROADCAST_PORT);
//   deviceLocation = new NetAddress(IP, BROADCAST_PORT);//deviceLocation = new NetAddress(BROADCAST_IP, BROADCAST_PORT);

//  int randomVal = int(random(1, 1000));
//  OscMessage myOscMessage = new OscMessage("/stepperMove");
//  myOscMessage.add(randomVal);
  
//  //myOscMessage.add(MAC);//might be required to filter out in future
//  myOscMessage.add(100);//time before it should start
//  myOscMessage.add(steps);//new location
//  myOscMessage.add(time);//time to move 
  
//  broadcastToLocation(myOscMessage, deviceLocation);
//}
