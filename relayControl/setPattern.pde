/* set the type of breathing for all the relays */

int setPattern() {

  //what's the overall status of all patterns?
  if (countdown < 1) {
    // reportStatus("Finding a new pattern");

    reportStatus("");
  
      seedType = random(1, 4); //pick a sequence

      /*
      PATTERN #1
      All random, with long off times.
      */      
      if (seedType == 1) { 

        // breathe in duration
        for (int i = 1; i <= 5; i++) {
          setRelay(i, "in", random(1000,4000));
        }   

        // breathe out duration
        for (int i = 1; i <= 5; i++) {
          setRelay(i, "out", random(5000,15000));    
        }

        //set the pattern length  
        countdown = (10 * 1000); // one min of this pattern
      }


      /* 
       PATTERN #2
       All in sync for a few secs in and out each.    
       
       */
      if (seedType == 2) {

        // breathe in duration
        setRelay("all", "in", 5000);    

        // breathe out duration
        setRelay("all", "out", 8000);  

        countdown = (10 * 1000);  // only lasts for 30 secs
        
      }
      
      /*
      PATTERN #3
      Shadow effects
      
      */
      
      if (seedType == 3) {
        // breathe in duration
        for (int i = 1; i <= 5; i++) {
          setRelay(i, "in", 150);
        }   

        // breathe out duration
        for (int i = 1; i <= 5; i++) {
          setRelay(i, "out", random(1000,10000));    
        }
        
        
        countdown = (10 * 1000); 
          
      }
  }

  countdown--; // count down this pattern.

  return 0; 
}




