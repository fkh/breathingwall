int sequenceAlternate () {
  
    reportStatus("Sequence: Alternate");

  int delayCounter = 1000;
 
  for (int cycle = 0; cycle < 5; cycle++) {

      digitalWrite(relay[0], HIGH);
      digitalWrite(relay[1], LOW);
      digitalWrite(relay[2], HIGH);
      digitalWrite(relay[3], LOW);
      digitalWrite(relay[4], HIGH);

    delay(delayCounter);

      digitalWrite(relay[0], LOW);
      digitalWrite(relay[1], HIGH);
      digitalWrite(relay[2], LOW);
      digitalWrite(relay[3], HIGH);
      digitalWrite(relay[4], LOW);

    delay(delayCounter);
    
    delayCounter = delayCounter + 500;

  } 


}
