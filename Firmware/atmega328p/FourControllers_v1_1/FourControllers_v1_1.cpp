#include <MsTimer2.h>

#include "WProgram.h"
void setup();
void pollController(byte controllerID);
boolean readController();
void reportController(byte controllerID);
void reportEmptyController(byte controllerID);
void pollCycle();
void loop();
struct {
  uint8_t reportid;
  uint8_t buttons1;
  uint8_t buttons2;
  uint8_t joystickx;
  uint8_t joysticky;
  uint8_t cstickx;
  uint8_t csticky;
  uint8_t ltrigger;
  uint8_t rtrigger;
} gcReport;

const int RESPONSE_BYTES = 8;
const int RESPONSE_BITS = 8*RESPONSE_BYTES;
const int BUFFER_BITS = RESPONSE_BITS+1;
const int POLL_INTERVAL = 2; //In ms CHANGE

const int POLL_SHORT_LEN = 14;
const int POLL_LONG_LEN = 46;
const int POLL_TOTAL = POLL_SHORT_LEN + POLL_LONG_LEN;

const int CONTROLLER_COUNT = 4; //CHANGE
const byte BIT_ON[CONTROLLER_COUNT] = { B1, B10, B100, B1000 }; //CHANGE
const byte BIT_OFF[CONTROLLER_COUNT] = { B11111110, B11111101, B11111011, B11110111 }; //CHANGE
byte activePins;
byte currentPinZero;
byte currentController;

char pollMessage[26] = "0100000000000011000000001";
unsigned int lowTimeBuffer[BUFFER_BITS];
unsigned int highTimeBuffer[BUFFER_BITS];

void setup()
{
  int i;
  byte turnOnInactive;
  
  Serial.begin(115200);
  
  for(i = 0; i < 6; i++)
  {
    if(i < CONTROLLER_COUNT)
    {
      //Prepare all used pins.
      DDRB &= BIT_OFF[i]; // input
      PORTB &= BIT_OFF[i]; //write LOW
  	
      activePins |= BIT_ON[i];
    }
    else
    {
      //Make all unused pins always report high
      turnOnInactive = (B1 << i);
      DDRB |= turnOnInactive;
      PORTB |= turnOnInactive;
      
      activePins |= turnOnInactive;
    }
  }
  
  currentController = 1; //Sets the current controller as the first.
  
  TIMSK1 = 0x00; //disabled interrupt
  TCCR1A = 0x00; // normal operation page 148 (mode0);
  TCCR1B = 0x01; // start timer/ set clock
  
  MsTimer2::set(POLL_INTERVAL, pollCycle);
  MsTimer2::start();
}

//Polls the controller on the Pin associated with the provided controllerID
void pollController(byte controllerID)
{
  //WRITE VARS
  int i;
  int msg_len = strlen(pollMessage);
  byte bitOn = BIT_ON[controllerID - 1];
  byte bitOff = BIT_OFF[controllerID - 1];
  
  currentPinZero = activePins & BIT_OFF[controllerID - 1]; //Set the value of what a 0 should look like when we will be reading the controller result
  
  //WRITE BLOCK
  for(i = 0; i < msg_len; i++)
  {
     if(pollMessage[i] == '0')
     {
       TCNT1 = 0;
       //Set output 0
       PORTB &= bitOff;
       DDRB |= bitOn;
       while(TCNT1 < POLL_LONG_LEN);
       
       //Set input (Will set line to 3.3v)
       PORTB &= bitOff; //write LOW
       DDRB &= bitOff; //input
       while(TCNT1 < POLL_TOTAL);
     }
     else
     {
       TCNT1 = 0;
       //Set output 0
       PORTB &= bitOff;
       DDRB |= bitOn;
       while(TCNT1 < POLL_SHORT_LEN);
       
       //Set input (Will set line to 3.3v)
       PORTB &= bitOff; //write LOW
       DDRB &= bitOff; //input
       while(TCNT1 < POLL_TOTAL);
     } 
  }
}

//This function attempts to read the response from the controller. Bits from the controller are sent ever microsecond.
//As such, this function is extremely time critical. The reason the reads seem coded in a strange way was to address
//this fact. The structure used allows for extremely fast pin reads while still allowing for a timeout if the
//response does not come.
boolean readController()
{
  int i;
  
  //Wait for first low
  while(1)
  {
    if(PINB == currentPinZero) break;
    if(PINB == currentPinZero) break;
    if(PINB == currentPinZero) break;
    if(PINB == currentPinZero) break;
    if(PINB == currentPinZero) break;
    if(PINB == currentPinZero) break;
    if(PINB == currentPinZero) break;
    if(PINB == currentPinZero) break;
    if(PINB == currentPinZero) break;
    if(PINB == currentPinZero) break;
    return false;
  }
  lowTimeBuffer[0] = TCNT1;
  
  for(i = 1; i < BUFFER_BITS; i++)
  {
    //Wait for high
    while(1)
    {
      if(PINB != currentPinZero) break;
      if(PINB != currentPinZero) break;
      if(PINB != currentPinZero) break;
      if(PINB != currentPinZero) break;
      if(PINB != currentPinZero) break;
      if(PINB != currentPinZero) break;
      if(PINB != currentPinZero) break;
      if(PINB != currentPinZero) break;
      if(PINB != currentPinZero) break;
      if(PINB != currentPinZero) break;
      if(PINB != currentPinZero) break;
      if(PINB != currentPinZero) break;
      if(PINB != currentPinZero) break;
      if(PINB != currentPinZero) break;
      if(PINB != currentPinZero) break;
      if(PINB != currentPinZero) break;
      if(PINB != currentPinZero) break;
      if(PINB != currentPinZero) break;
      if(PINB != currentPinZero) break;
      if(PINB != currentPinZero) break; 
      return false; 
    }
    highTimeBuffer[i] = TCNT1;
    
    //Wait for low
    while(1)
    {
      if(PINB == currentPinZero) break;
      if(PINB == currentPinZero) break;
      if(PINB == currentPinZero) break;
      if(PINB == currentPinZero) break;
      if(PINB == currentPinZero) break;
      if(PINB == currentPinZero) break;
      if(PINB == currentPinZero) break;
      if(PINB == currentPinZero) break;
      if(PINB == currentPinZero) break;
      if(PINB == currentPinZero) break;
      if(PINB == currentPinZero) break;
      if(PINB == currentPinZero) break;
      if(PINB == currentPinZero) break;
      if(PINB == currentPinZero) break;
      if(PINB == currentPinZero) break;
      if(PINB == currentPinZero) break;
      if(PINB == currentPinZero) break;
      if(PINB == currentPinZero) break;
      if(PINB == currentPinZero) break;
      if(PINB == currentPinZero) break;  
      return false;
    }
    lowTimeBuffer[i] = TCNT1;
  }
  
  return true;
}

void reportController(byte controllerID)
{
  int i;
  byte readResults[RESPONSE_BYTES];
  int lowLength, highLength;
  byte bitMask = B10000000;
  int readIndex = 0;
  
  readResults[readIndex] = 0; //reset result before setting
  //Set results
  for(i = 1; i < BUFFER_BITS; i++)
  {
    lowLength = highTimeBuffer[i] - lowTimeBuffer[i-1];
    highLength = lowTimeBuffer[i] - highTimeBuffer[i];
    
    if(lowLength <= highLength) readResults[readIndex] |= bitMask;
    
    bitMask = bitMask >> 1;
    if(bitMask == 0)
    {
      bitMask = B10000000;
      readIndex++;
      
      readResults[readIndex] = 0;
    }
  }
  
  gcReport.reportid = controllerID;
  gcReport.buttons1 = (readResults[0] & B00011111);
  gcReport.buttons2 = (readResults[1] & B01111111);
  gcReport.joystickx = readResults[2];
  gcReport.joysticky = ~readResults[3]; //Y joystick is not'ed because axis was reversed
  gcReport.cstickx = readResults[4];
  gcReport.csticky = readResults[5];
  gcReport.ltrigger = readResults[6];
  gcReport.rtrigger = readResults[7];
  
  Serial.write((uint8_t *)&gcReport, 9);
  
  //Debug
//  Serial.print("(" + String(gcReport.reportid, DEC) + ")");
//  for(i = 0; i < RESPONSE_BYTES; i++) Serial.print(readResults[i], BIN);
//  Serial.println();
}

//This method should only be for debuggin purposes. I was trying to send empty reports thinking that
//each device HAD to send a report, I hope this is not case.
void reportEmptyController(byte controllerID)
{
  gcReport.reportid = controllerID;
  gcReport.buttons1 = 0;
  gcReport.buttons2 = 0;
  gcReport.joystickx = B1111111;
  gcReport.joysticky = B1111111;
  gcReport.cstickx = B1111111;
  gcReport.csticky = B1111111;
  gcReport.ltrigger = B11001000;
  gcReport.rtrigger = B11001000;
  
  Serial.write((uint8_t *)&gcReport, 9);
  
//  Serial.println("(" + String(gcReport.reportid, DEC) + ")EMPTY");
}

void pollCycle()
{
  boolean successfulRead;

  pollController(currentController);
  successfulRead = readController();
  if(successfulRead) reportController(currentController);
  //else reportEmptyController(currentController);
  
  currentController++;
  if(currentController > CONTROLLER_COUNT) currentController = 1;
}

void loop()
{
  
}

