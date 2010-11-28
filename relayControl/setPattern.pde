/* set the type of breathing for all the relays */

int setPattern() {

  //what's the overall status of all patterns?
  if (countdown < 1) {
   // reportStatus("Finding a new pattern");

    if (inSequence) { // just do what the sequence wants
      
    } else { //time to pick a new seauence   
      
    int seedType = random(1, 5);

    //all breathing together
    if (seedType <= 3) { 

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

