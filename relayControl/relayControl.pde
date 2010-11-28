/*
  relayControl
 
 */


/* configuration */

//how long will each pattern last?
int countdown = 0; 

// how long is a tick? 
int tick = 1000; //1000 = 1 second per loop. Lower values run faster.

//how many relays? index 0...
int relayCount = 4; // i.e. 5

// configure data for the relay times
int relayBreathe[5], relayPause[5], relayDuration[5] ;
boolean relayClosed[5];

void setup() {
  Serial.println("Hello world");
  Serial.begin(9600);
  pinMode(13, OUTPUT);
  delay(2000);
}

void loop() {

  //  digitalWrite(13, HIGH);

  setPattern();

  reportStatus("");

  incrementRelays();

  //wait a bit...
  delay(tick);
}


/* set the type of breathing for all the relays */
int setPattern() {

  //what's the overall status of all patterns?
  if (countdown < 1) {
   // reportStatus("Finding a new pattern");


    if (inSequence) { // just do what the sequence wants
      
      
    } else { //time to pick a new seauence   
      
    int seedType = random(1, 5);

    //all breathing together
    if (seedType < 3) { 

      // breathe in duration
      setRelay("all", "in", 3);    

      // breathe out duration
      setRelay("all", "out", 2);    

      //set the pattern length  
      countdown = (30); // + random(60 * 2); // at least 30 ticks and up to 2 mins.

    }
    
    //slowing down, longer and longer gaps
    
    if (seedType == 4) {
      
      //flag this group
      inSequence = true;
      
            // breathe in duration
      setRelay("all", "in", 3);    

      // breathe out duration
      setRelay("all", "out", 2);  
    }
    
    }
  }

  countdown--; // count down this pattern.

  return 0; 
}


/* general logging */
int reportStatus(String comment) {

  if (comment != "") {
    Serial.println(comment);     
  } 
  else {
    
    String wallStatus = "";
    
    
    for (int j=0; j <= relayCount; j++) {
      if (relayClosed[j]) {
         wallStatus += "X";       
      } else {
        wallStatus += "-";
      }
     
    } 
    
   Serial.print(wallStatus);
    
    Serial.print("    ");
    Serial.print(countdown);
    Serial.print(" | " );
      
    //what's going on with each relay?
    for (int i=0; i <= relayCount; i++) {
      Serial.print(i+1);
      Serial.print(":");
      Serial.print(relayBreathe[i]);
      Serial.print("/");
      Serial.print(relayPause[i]);
      Serial.print("-");
      Serial.print(relayDuration[i]);
      Serial.print(" ");      
    }

    Serial.println(". "); 

  }

}


/* set relay */
// use this to set one or all relays, for phase and duration.
// duration in ticks
int setRelay(String relayName, String phase, int duration) {

  // work out which relay is the target

  int relay;

  if (relayName == "all") { 
    relay = 0; 
  }

  if (relayName == "1") { 
    relay = 1; 
  }
  if (relayName == "2") { 
    relay = 2; 
  }
  if (relayName == "3") { 
    relay = 3; 
  }
  if (relayName == "4") { 
    relay = 4; 
  }
  if (relayName == "5") { 
    relay = 5; 
  }

  if (relay == 0) {
    // set all of them

    //reportStatus("Setting all relays");

    for (int i=0; i <= relayCount; i++) { // loop through all five relays
      if (phase == "in" || phase == "both") {
        relayBreathe[i] = duration;
      }  

      if (phase == "out" || phase == "both") {
        relayPause[i] = duration;
      }  

    }

  } 
  else { // we only have one relay to set up


    reportStatus("Setting relay:");
    reportStatus(relay);

    if (phase == "in" || phase == "both") {
      relayBreathe[relay] = duration;
    }  

    if (phase == "out" || phase == "both") {
      relayPause[relay] = duration;
    }  

  }

}



/* */
int incrementRelays() {

  //for each relay, go through and tick down the counter
  for (int r=0; r <= relayCount; r++) { 
    
    relayDuration[r]-- ;

    //if the current increment is zero, take action
    if (relayDuration[r] < 1) {

      if (relayClosed[r] == true ) { //relay is closed, fan is on
        
    //    reportStatus("Opening ");
    //    reportStatus(r);
        //set relay to be open 
        relayClosed[r] = false;
        //TODO send pin down
          
        //set the increment to the pause length
        relayDuration[r] = relayPause[r];
        
      } else {
      
        //close relay (i.e. fan on)
        relayClosed[r] = true;
        //TODO send pin up
        
        //set the increment to the blow length
        relayDuration[r] = relayBreathe[r];
        
      }
    }
  }
}





