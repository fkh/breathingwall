/* count relays down or up as needed */

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

