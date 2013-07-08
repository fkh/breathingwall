/* set relay */
// use this to set one or all relays, for phase and duration.
// duration in ticks
int setRelay(int relayName, String phase, int duration) {

  // work out which relay is the target

  int relay;

  if (relayName == 0) { 
    relay = 0; 
  }

  if (relayName == 1) { 
    relay = 1; 
  }
  if (relayName == 2) { 
    relay = 2; 
  }
  if (relayName == 3) { 
    relay = 3; 
  }
  if (relayName == 4) { 
    relay = 4; 
  }
  if (relayName == 5) { 
    relay = 5; 
  }

  if (relay == 0) {
    // set all of them

    for (int i=0; i <= relayCount; i++) { // loop through all five relays
      if (phase == "in" || phase == "both") {
        relayBreathe[i] = duration;
      }  

      if (phase == "out" || phase == "both") {
        relayPause[i] = duration;
      }  

    }

  } else { 
    // we only have one relay to set up

    if (phase == "in" || phase == "both") {
      relayBreathe[relay] = duration;
    }  

    if (phase == "out" || phase == "both") {
      relayPause[relay] = duration;
    }  

  }

}

