#include <Arduino.h>
#include <TM1637Display.h>
#include <EEPROM.h>

#define CLK 3
#define DIO 4

TM1637Display display(CLK, DIO);

int DisplayTime1=0, DisplayTime2=0, minutes1=0, minutes2=0;
byte LastState=0, LastButton1=1, LastButton2=1, LastMinutes1 =0, LastMinutes2 =0, filtering=0, field=1;
unsigned long TimeMark = 0, TimeMark2 =0 , TimeMark3=0 ;
uint8_t rectangle[]={
  SEG_A|SEG_F|SEG_E|SEG_D,
  SEG_A|SEG_B|SEG_C|SEG_D,
};

void setup() {
  pinMode (8, OUTPUT);                  //small field relay
  pinMode (9, OUTPUT);                  //big field relay
  pinMode (5, INPUT_PULLUP);            //button small field
  pinMode (6, INPUT_PULLUP);            //button big field
  pinMode (2, INPUT_PULLUP);            //coin signal
  Serial.begin(500000);                 // comunitation speed
  display.setBrightness(0x0f);
  display.clear();
  byte LastState = digitalRead (2);
  }
void FieldCheck (){
  
  }
void ImpulseCheck () {
  byte state = digitalRead(2);
  if ((state != LastState) && (state == 0) && (filtering == 0)) {
    filtering = 1;
    TimeMark=millis();                                            //Start timer for impulse lenght
  }
  if (filtering == 1 && (95 <= (millis()-TimeMark) <= 105)) {     //filter all signal with lenght <98, 102> ms
    if ((state != LastState) && (state == 1)) {                   // if state has changed to 1 do
      if (field ==1){
        minutes1+= 4;
      }
      if (field ==2){
        minutes2+= 4;
      }      
      filtering=0;
      }
    }
  LastState = state;
  }



// /////////////////////////////////

  
void loop() {
  ImpulseCheck ();

  if (minutes1>0){                                      //          TIME COUNTER FOR FIELD1
    if (TimeMark2 ==0) {
      TimeMark2 = millis();                                         //start timer counting one minute
      digitalWrite(8, LOW);
      }
    if ((millis()-TimeMark2) >= 60000){                             //check if one minute elapsed
      minutes1--;
      TimeMark2 = millis();                                         // if minute elapsed then zero Timer2 to count next minute
      }
    }
  if (minutes1 == 0) {
    digitalWrite(8, HIGH);                                           //turn off the light
    TimeMark2 = 0;                                                  //zero timer2 (minute counter)        
  }

  if (minutes2>0){                                       //          TIME COUNTER FOR FIELD2
    if (TimeMark3 ==0) {
      TimeMark3 = millis();                                         //start timer counting one minute
      digitalWrite(9, LOW);
      }
    if ((millis()-TimeMark3) >= 60000){                             //check if one minute elapsed
      minutes2--;
      TimeMark3 = millis();                                         // if minute elapsed then zero Timer2 to count next minute
      }
    }
  if (minutes2 == 0) {
    digitalWrite(9, HIGH);                                           //turn off the light
    TimeMark3 = 0;                                                  //zero timer2 (minute counter)  
  }



  if (((digitalRead(6)) != (LastButton1)) && (digitalRead(6) == 0)){              //left button check
    field = 1;    
    display.clear();
    display.setSegments(rectangle, 2, 0); 
  }
  if (((digitalRead(5)) != (LastButton2)) && (digitalRead(5) == 0)){              //right button check
    field = 2;
    display.clear();
    display.setSegments(rectangle, 2, 2); 
  }
  LastButton1 = digitalRead(6);
  LastButton2 = digitalRead(5);


  
                                                                    // WHAT TO DISPLAY
  
  DisplayTime1= ((minutes1/60)*100)+(minutes1%60);                 //count 4 digit time format hh:mm
  DisplayTime2= ((minutes2/60)*100)+(minutes2%60);                 //count 4 digit time format hh:mm                                                                   
  
  if (field ==1){                                                  // if the button of field 1 is pressed than it display field 1 time
    if (minutes1 > 0){
      display.showNumberDecEx(DisplayTime1, 0b01000000, true, 4, 0);       
    }
    if  (((minutes1) != (LastMinutes1)) && (minutes1 == 0)){
      display.clear();
      display.setSegments(rectangle, 2, 0);                         //display left rectangle
    }
  }
  if (field == 2){
    if (minutes2 > 0){
      display.showNumberDecEx(DisplayTime2, 0b01000000, true, 4, 0);       
    }
    if  (((minutes2) != (LastMinutes2)) && (minutes2 == 0)){
      display.clear();
      display.setSegments(rectangle, 2, 2);                         //display right rectangle
    }
  }
  LastMinutes1 = minutes1;
  LastMinutes2 = minutes2;
}
