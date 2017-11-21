/*
    Name: SocketServer
    Coder: YuanSyun
    Date: 2017/11/21
    Purpose: Test processing Server api.
*/

//------------------------------------------------------------
import processing.net.*;

//------------------------------------------------------------
Server myServer;
String recMsg="";

//------------------------------------------------------------
void setup() {
  size(200, 200);
  // Starts a myServer on port 5204
  myServer = new Server(this, 5204); 
}

//------------------------------------------------------------
void draw() {
    if(myServer.active()){
        Client c = myServer.available();
        if((c!=null)){
            //Connect.
            while(true){
                
                //Receive data.
                if(c.available()>0){
                    recMsg += c.readString();
                }
                
                //Break connection.
                if(!c.active()){
                    c.stop();
                    break;
                }
            }//end while
        }else{
            //Disconnect.
            if(recMsg!=""){
                print(c + " data length is " + recMsg.length() +".\n");
                print("-------------------------------------------\n");
                recMsg="";
            }//end if
        }//end if
    }//end if
}