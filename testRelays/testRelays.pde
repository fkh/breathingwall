/*
  
 
 */


int sequence = 2;

//what pims are the relays on?
int relay[5];

void setup() {                
  // initialize the digital pin as an output.


  relay[0] = 2;
  relay[1] = 3;
  relay[2] = 4;
  relay[3] = 5;
  relay[4] = 6;

  for (int i = 0; i < 5 ; i++ ) {
    pinMode(relay[i], OUTPUT);
  }

  Serial.println("Hello world");
  Serial.begin(9600);

  //led
  pinMode(13, OUTPUT); 
}


void loop() {


  switch (sequence) {

  case 1:
    for (int i = 2; i < 7; i++) {
      digitalWrite(i, HIGH);
      digitalWrite(13,HIGH);
      Serial.println(i);
      delay(20000);
      digitalWrite(i, LOW);
      digitalWrite(13,LOW);
      delay(5000);
    }

    Serial.println("---");
    break;


  case 2:

    for (int r = 0; r <= 5; r++) {
      digitalWrite(relay[r], HIGH);
      digitalWrite(13,HIGH);
    }


    delay(6000);

    for (int r = 1; r <= 5 ; r++) {
      digitalWrite(relay[r], LOW);
      digitalWrite(13,LOW);
    }

    delay(10000);

    break;


  case 3: // testing short pulses

    digitalWrite(4,HIGH);
    delay(100);
    digitalWrite(4,LOW);
    delay(2000);

    digitalWrite(4,HIGH);
    delay(100);
    digitalWrite(4,LOW);
    delay(2000);  

    digitalWrite(4,HIGH);
    delay(100);
    digitalWrite(4,LOW);
    delay(2000);
    
    digitalWrite(4,HIGH);
    delay(100);
    digitalWrite(4,LOW);
    delay(2000);
    
    delay(5000);
     
    break;


  case 4: // sequence
  
  for (int r = 1 ; r <= 5 ; r++) {
  
     digitalWrite(relay[r],HIGH);
     
     delay(2000);
    
  }

  delay(2000);

  for (int r = 5 ; r >= 0 ; r--) {
  
     digitalWrite(relay[r],LOW);
     
     delay(3000);
    
  }
  
  delay(10000);
  
  break;

  }
  

}

