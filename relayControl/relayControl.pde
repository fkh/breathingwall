/*
  relayControl
 
 */

/* configuration */

//how long will each pattern last?
int countdown = 0; 

// how long is a tick? 
int tick = 1000; //1000 = 1 second per loop. Lower values run faster.

//how many relays? index 0...
int relayCount = 4; // i.e. 5

// configure data for the relay times
int relayBreathe[5], relayPause[5], relayDuration[5] ;
boolean relayClosed[5];

//are we in a sequence?
boolean inSequence = false;

void setup() {
  Serial.println("Hello world");
  Serial.begin(9600);
  pinMode(13, OUTPUT);
  delay(2000);
}

void loop() {

  //  digitalWrite(13, HIGH);
  setPattern();

  reportStatus("");

  incrementRelays();

  //wait a bit...
  delay(tick);
}









