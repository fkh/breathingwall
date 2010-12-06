/*
  relayControl
 
 Types of relay sequence:
 
 -- all on/off together
 use increment relay for this.
 
 -- randomly on/off (each pair with own duration)
 use increment relay
 
 -- slowly starting up
 use increment relay and add to the duration between each one.
 
 -- sequence between the different fans (one after another)
 not sure how best to do this with this approach.
 
/* configuration */

//count down to the end of the sequence
unsigned long countdown = 1000; 

// how long is a tick? 
int tick = 1; //1 millisecond per loop. All values should be given in milliseconds.

//how many relays? index 0...
int relayCount = 4; // i.e. 5

// configure data for the relay times
int relayBreathe[5], relayPause[5], relayDuration[5] ;
boolean relayClosed[5];

//are we in a sequence?
boolean inSequence = false;

//what pims are the relays on?
int relay[5];

//what's the sequence?
int seedType;

int reportTimer = 1000;

void setup() {
  Serial.println("Hello.");
  Serial.begin(9600);
  pinMode(13, OUTPUT);
  delay(2000);

  relay[0] = 4;
  relay[1] = 10;
  relay[2] = 2;
  relay[3] = 8;
  relay[4] = 6;

  for (int i = 0; i < 5 ; i++ ) {
    pinMode(relay[i], OUTPUT);
  }


}

void loop() {

  
  // pulse sequence
  sequencePulses();
  
  //all full 
  sequenceAll();
  
  //random
  sequenceRandom();

  //all full 
  sequenceAll();
  
  //bobbing
  sequenceAlternate();
   
  //all full 
  sequenceAll();
  
   //random
  sequenceRandom();
   
  //all full 
  sequenceAll();
  
  //scatter
  sequenceScatter();
  
  //all full 
  sequenceAll();
  
}












