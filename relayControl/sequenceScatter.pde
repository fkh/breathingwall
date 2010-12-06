int sequenceScatter () {

  //sometimes short, sometimes long...

  int cyclePace = random(1,3);

  int cycleLow, cycleHigh;
  
  if (cyclePace == 1) {
    cycleLow = 0; 
    cycleHigh = 1000;
  reportStatus("Sequence: Scatter fast");
  } 
  else {
    cycleLow = 5000;
    cycleHigh = 10000;  
    reportStatus("Sequence: Scatter slow");
  }

  int cycleLength = random(1,10);
  


  for (int cycle = 0; cycle < cycleLength; cycle++) { 
    digitalWrite(relay[random(0,5)], HIGH);
    delay(random(cycleLow,cycleHigh));
    digitalWrite(relay[random(0,5)], LOW);
    delay(random(cycleLow,cycleHigh));
  }

}

