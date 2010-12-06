int sequenceAll () {

   //run them all together
   
     reportStatus("Sequence: All");
     
  for (int cycle = 0; cycle < 10; cycle++) {

    for (int r = 0; r <= 5; r++) {
      digitalWrite(relay[r], HIGH);
      digitalWrite(13,HIGH);
    }


    delay(5000);

    for (int r = 0; r <= 5 ; r++) {
      digitalWrite(relay[r], LOW);
      digitalWrite(13,LOW);
    }

    delay(8000);

  } 
  
}

