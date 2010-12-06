/* a random set of pulses */


int sequenceRandom ()  {

  //work out what each relay will be doing in this sequence

  int randomType = random(1,4);

  int duration, inLow, inHigh, outLow, outHigh;  
  
  switch (randomType) {
  
    case 1: //short breathe, long gap
    inLow = 1000;
    inHigh = 3000;
    outLow = 5000;
    outHigh = 10000;
    duration = (10 * 1000);
    reportStatus("Sequence: Random -- short breath, long gap");
    break;
    
    case 2: //long breathe, short gap
    inLow = 3000;
    inHigh = 7000;
    outLow = 1000;
    outHigh = 3000;
    duration = (10 * 1000);
    reportStatus("Sequence: Random -- long breath, short gap");
    break;

    case 3: //crazy stuff
    inLow = 100;
    inHigh = 300;
    outLow = 2000;
    outHigh = 3000;
    duration = (15 * 1000);
    reportStatus("Sequence: Random -- shadow effects");
    break;
    
  }
  
  // breathe in 
  for (int i = 0; i <= 5; i++) {
    setRelay(i, "in", random(inLow,inHigh));
  }   

  // breathe out 
  for (int i = 0; i <= 5; i++) {
    setRelay(i, "out", random(outLow,outHigh));    
  }

  



  for (long clock = 0; clock < duration ; clock++) {
    
    incrementRelays();
    delay(1);

  } 

}

