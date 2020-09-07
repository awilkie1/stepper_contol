  import hypermedia.net.*;

UDP udp;  // the UDP object

int INCOMING_PORT = 9999;//incoming port for host pc
String BROADCAST_IP = "10.0.255.255";//this is the main brodcast port
String IP = "10.0.2.10";//this is the main brodcast port
int BROADCAST_PORT = 8888;//for casting to .255


void udpSetup(){
  udp = new UDP(this, INCOMING_PORT, "10.0.2.10");
  udp.listen(true);
  udp.broadcast(true);
}


void udpBroadcast(String command){
  int sendHowManyTimes = 1;
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
  String[] list = split(message, ' ');
  
  //for (int l = 0; l<list.length; l++){
  //  println("command" + l +" : " +list[l]);
  //}
  if (list[0].equals("boot")){
      String DEVICE_MAC = list[1];
      String DEVICE_IP = list[2];
      println("login: " + DEVICE_MAC + " @ " + DEVICE_IP);
  }
  if (list[0].equals("accel")){
      println("accel " + list[1]);
  }
  if (list[0].equals("update")){
      String DEVICE_MAC = list[1];
      String DEVICE_IP = list[2];
      if (DEVICE_IP.equals(MOTORA)){
        p.udpUpdate(float(list[3]), float(list[4]), float(list[5]), 0);
      }
      if (DEVICE_IP.equals(MOTORB)){
        p.udpUpdate(float(list[3]), float(list[4]), float(list[5]), 1);
      }
    
      if (DEVICE_IP.equals(MOTORC)){
        p2.udpUpdate(float(list[3]), float(list[4]), float(list[5]), 0);
      }
      if (DEVICE_IP.equals(MOTORD)){
        p2.udpUpdate(float(list[3]), float(list[4]), float(list[5]), 1);
      }
      
      println("max " + float(list[1]) + "IP " + float(list[2]) +"Length " + float(list[3]) + " Min " + float(list[4]) + " Max " + float(list[5]));
  }
  if (list[0].equals("home")){
      String DEVICE_MAC = list[1];
      String DEVICE_IP = list[2];
      if (DEVICE_IP.equals(MOTORA)){
       
      }
      if (DEVICE_IP.equals(MOTORB)){

      }
      
      println("Length " + float(list[3]) + " Min " + float(list[4]) + " Max " + float(list[5]));
  }
  else {
    println(message);
  }
}
void eventCall10(String call, int a, int b, int c, int d, int e, int f, int g, int h, int i) {
  String command = call + " " + a + " " + b + " " + c + " " + d + " " + e + " " + f + " " + g + " " + h + " " + i;
  udpBroadcast(command);
}
