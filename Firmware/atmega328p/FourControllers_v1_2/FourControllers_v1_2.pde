#include <MsTimer2.h>

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

const int RESPONSE_BYTES = 8; //Number of bytes of GC controller response
const int RESPONSE_BITS = 8*RESPONSE_BYTES; //Number in bits
const int BUFFER_BITS = RESPONSE_BITS+1; //Size of buffer required to store entire response
const int POLL_INTERVAL = 2; //Number of milliseconds in between controller polls. If there are
                             //4 controllers, each controller is polled every POLL_INTERVAL*4 ms

//Information about the GC protocol can be found here: http://www.int03.co.uk/crema/hardware/gamecube/gc-control.htm
//These constants are used to create similar length high's and low's as an actual Gamecube.
const int POLL_SHORT_LEN = 14; //Amount of TCNT time for short side of signal
const int POLL_LONG_LEN = 46; //Amount of TCNT time for long side of signal
const int POLL_TOTAL = POLL_SHORT_LEN + POLL_LONG_LEN; //Total time of one bit

const int CONTROLLER_COUNT = 4; //Amount of controllers supported by the device
const byte BIT_ON[CONTROLLER_COUNT] = { B1, B10, B100, B1000 }; //Indicates which I/O pin each controller is plugged into
const byte BIT_OFF[CONTROLLER_COUNT] = { B11111110, B11111101, B11111011, B11110111 }; //Should be !BIT_ON
byte activePins; //Which pins are currently in use by a controller
byte currentPinZero; //Used for quick comparison with PINB register
byte currentController; //Indicates the current controller being polled

char pollMessage[26] = "0100000000000011000000001"; //Message to poll a controller with
unsigned int lowTimeBuffer[BUFFER_BITS]; //Defined here for quick use. Stores amount of time I/O pin is detected as low
unsigned int highTimeBuffer[BUFFER_BITS]; //Defined here for quick use. Stores amount of time I/O pin is detected as high

void setup()
{
  int i;
  byte turnOnInactive;
  
  Serial.begin(115200);
  
  //Iterate through every I/O pin described by PINB/DDRB/PORTB registers and initialize them
  //Pins 6/7 are not initialized because: "The two high bits (6 & 7) map to the crystal pins and are not usable" (Arduino website)
  //Pins 6/7 will always report high
  for(i = 0; i < 6; i++)
  {
    if(i < CONTROLLER_COUNT)
    {
      //Prepare all used pins.
      DDRB &= BIT_OFF[i]; //Sets I/O pin input
      PORTB &= BIT_OFF[i]; //write LOW
  	
      activePins |= BIT_ON[i]; //Keep a byte indicating which pins are used
    }
    else
    {
      //Set all unused pins to always output high.
      //NOTE: I think this code is not as general as I initially intended. The code will likely only
      //      work if the active pins are all the lowest pins (0, 1, 2, 3).
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

//This function attempts to read the response from the controller. Bits from the controller are sent every microsecond.
//As such, this function is extremely time critical. The reason the reads seem coded in a strange way was to address
//this fact. The structure used allows for extremely fast pin reads while still allowing for a timeout if the
//response does not come.
boolean readController()
{
  int i;
  
  //A line empty of data is always high. In order to know data is starting to be transmitted, we look for the first low...
  //Wait for first low
  if(PINB == currentPinZero) goto flowread;
  if(PINB == currentPinZero) goto flowread;
  if(PINB == currentPinZero) goto flowread;
  if(PINB == currentPinZero) goto flowread;
  if(PINB == currentPinZero) goto flowread;
  if(PINB == currentPinZero) goto flowread;
  if(PINB == currentPinZero) goto flowread;
  if(PINB == currentPinZero) goto flowread;
  if(PINB == currentPinZero) goto flowread;
  if(PINB == currentPinZero) goto flowread;
  return false;
  
  flowread:
  lowTimeBuffer[0] = TCNT1; //Record time of first low
  
  for(i = 1; i < BUFFER_BITS; i++)
  {
    //Following a time interval of low comes a high, so we wait for it...
    //Wait for high
    if(PINB != currentPinZero) goto highread;
    if(PINB != currentPinZero) goto highread;
    if(PINB != currentPinZero) goto highread;
    if(PINB != currentPinZero) goto highread;
    if(PINB != currentPinZero) goto highread;
    if(PINB != currentPinZero) goto highread;
    if(PINB != currentPinZero) goto highread;
    if(PINB != currentPinZero) goto highread;
    if(PINB != currentPinZero) goto highread;
    if(PINB != currentPinZero) goto highread;
    if(PINB != currentPinZero) goto highread;
    if(PINB != currentPinZero) goto highread;
    if(PINB != currentPinZero) goto highread;
    if(PINB != currentPinZero) goto highread;
    if(PINB != currentPinZero) goto highread;
    if(PINB != currentPinZero) goto highread;
    if(PINB != currentPinZero) goto highread;
    if(PINB != currentPinZero) goto highread;
    if(PINB != currentPinZero) goto highread;
    if(PINB != currentPinZero) goto highread; 
    return false; 
    
    highread:
    highTimeBuffer[i] = TCNT1; //Record time of high
    
    //After a high comes another low...
    //Wait for low
    if(PINB == currentPinZero) goto lowread;
    if(PINB == currentPinZero) goto lowread;
    if(PINB == currentPinZero) goto lowread;
    if(PINB == currentPinZero) goto lowread;
    if(PINB == currentPinZero) goto lowread;
    if(PINB == currentPinZero) goto lowread;
    if(PINB == currentPinZero) goto lowread;
    if(PINB == currentPinZero) goto lowread;
    if(PINB == currentPinZero) goto lowread;
    if(PINB == currentPinZero) goto lowread;
    if(PINB == currentPinZero) goto lowread;
    if(PINB == currentPinZero) goto lowread;
    if(PINB == currentPinZero) goto lowread;
    if(PINB == currentPinZero) goto lowread;
    if(PINB == currentPinZero) goto lowread;
    if(PINB == currentPinZero) goto lowread;
    if(PINB == currentPinZero) goto lowread;
    if(PINB == currentPinZero) goto lowread;
    if(PINB == currentPinZero) goto lowread;
    if(PINB == currentPinZero) goto lowread;  
    return false;
    
    lowread:
    lowTimeBuffer[i] = TCNT1; //Record time of low
  }
  
  //If the code makes it here it means we were able to detect the correct amount of bits.
  //We now have a buffer containing time times of each low/high and we can decipher this into the bits of the response
  return true;
}

//First decodes the low/high times into bits making up the controller response.
//Once complete, it translates this into which buttons are pressed as defined on the protocol website linked earlier.
//Sends this information via serial communication to the the atmega8u2 which is handling USB operations.
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

//This method should only be for debugging purposes. I was trying to send empty reports thinking that
//each device HAD to send a report, this is not case.
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

//Main operation - this method is called by timer
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

//Main loop does nothing other than wait to be interrupted by timer
void loop()
{
  
}
