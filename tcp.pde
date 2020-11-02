//tcp
import processing.net.*;
Client c;//tcp setup
Server s;//tcp setup
String tcpInput;
int tcpData[];

void tcpSetup(){
  c = new Client(this, "10.0.2.10", 2704); // Replace with your server's IP and port
  //s = new Server(this, 2704); // Replace with your server's IP and port

}

void tcp(){
  if (c.available() > 0) {
        tcpInput = c.readString();
        tcpData = int(split(tcpInput, ' ')); // Split values into an array
        String message = tcpInput;
        println(message);
    }

}
void tcpBroadcastDirect(String command, String ip){
  c = new Client(this, ip, 2704); // Replace with your server's IP and port
  c.write(command);
  println("Sent " + ip + " Command: " + command);
  //c.stop();
}
