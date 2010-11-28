
/* general logging */
int reportStatus(String comment) {

  if (comment != "") {
    Serial.println(comment);     
  } 
  
  else {
    
    String wallStatus = "";
    
    for (int j=0; j <= relayCount; j++) {
      if (relayClosed[j]) {
         wallStatus += "X";       
      } else {
        wallStatus += "-";
      }
     
    } 
    
   Serial.print(wallStatus);
    
    Serial.print("    ");
    Serial.print(countdown);
    Serial.print(" | " );
      
    //what's going on with each relay?
    for (int i=0; i <= relayCount; i++) {
      Serial.print(i+1);
      Serial.print(":");
      Serial.print(relayBreathe[i]);
      Serial.print("/");
      Serial.print(relayPause[i]);
      Serial.print("-");
      Serial.print(relayDuration[i]);
      Serial.print(" ");      
    }

    Serial.println(". "); 

  }

}


