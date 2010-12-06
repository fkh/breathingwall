int sequencePulses() {

    reportStatus("Sequence: Pulses");
 
 
 int cycleLoop = 1;
 
 //one to start with 
 
 for (int cycle = 0; cycle < cycleLoop; cycle++) {
      
     digitalWrite(relay[0],HIGH);
     delay(3000);
      
     digitalWrite(relay[0],LOW);
     delay(4000);
      
 } 
 
 
 // 2
  for (int cycle = 0; cycle < cycleLoop; cycle++) {
      
     digitalWrite(relay[0],HIGH);
     digitalWrite(relay[1],HIGH); 
     delay(3000);
      
     digitalWrite(relay[0],LOW);
     digitalWrite(relay[1],LOW);     
     delay(4000);
      
 } 
 
 
 // 3
   for (int cycle = 0; cycle < cycleLoop; cycle++) {
      
     digitalWrite(relay[0],HIGH);
     digitalWrite(relay[1],HIGH);
     digitalWrite(relay[2],HIGH);
     delay(3000);
      
     digitalWrite(relay[0],LOW);
     digitalWrite(relay[1],LOW); 
     digitalWrite(relay[2],LOW);     
     delay(4000);
      
 } 
 
 // 4
   for (int cycle = 0; cycle < cycleLoop; cycle++) {
     
      
     digitalWrite(relay[0],HIGH);
     digitalWrite(relay[1],HIGH);
     digitalWrite(relay[2],HIGH);
     digitalWrite(relay[3],HIGH);
     delay(3000);
      
     digitalWrite(relay[0],LOW);
     digitalWrite(relay[1],LOW); 
     digitalWrite(relay[2],LOW);     
     digitalWrite(relay[3],LOW);     
     delay(4000);
      
 } 
 
 // 5
    for (int cycle = 0; cycle < cycleLoop; cycle++) {
     
      
     digitalWrite(relay[0],HIGH);
     digitalWrite(relay[1],HIGH);
     digitalWrite(relay[2],HIGH);
     digitalWrite(relay[3],HIGH);
     digitalWrite(relay[4],HIGH);
     delay(3000);
      
     digitalWrite(relay[0],LOW);
     digitalWrite(relay[1],LOW); 
     digitalWrite(relay[2],LOW); 
     digitalWrite(relay[3],LOW); 
     digitalWrite(relay[4],LOW);     
     delay(4000);
      
 } 
 
 
}
