/* 
 * File:   PF906main.c
 * 
 * Version: 4b - working to start and run motor at preset speeds
 * Version: 4a - working but has superflous stuff
 * 
 * Author: Happymacer
 * 
 * Developed in MPLAB X IDE 6 to document DS-50002027F dated 2022
 * Compiled in XC8 V2.36 to document 50002737D dated 2021
 * References to page numbers and registers refers to document DS40001262F 
 * dated 2005-2015
 * 
 * PIC 16F690 silicon revisions document DS80243M dated 2010
 * 
 * Started on 21 March 2021....
 * 
 * "input" and "output" is relative to the PIC 16F690
 * 
 * This version assumes that the max no load motor voltage is 180VDC which is 
 * 56% of the available voltage of 320VDC.  At no load max voltage is 180V DC.
 * 
 * Also, minimum RPM is probably in the order of 1000RPM (arbitrary choice) and 
 * max is 4700RPM (motor rating) for motor heating reasons (low airflow at low 
 * speeds) and motor speed control accuracy (too few pulses for accuracy at 
 * slow speeds).  
 * 
 * For button pushing convenience lets say we want 10 pushes from min to max 
 * speed - (4700-1000)/10 = step increment per button push = 370RPM/step 
 * 
 * Rounding down to 350rpm/step makes the math nice, and leaves some margin 
 * at the top end, so top speed is 3500rpm 
 * 
 * Minimum no load duty cycle => (180/320)*(1000/4700) = 0.12 
 * Max no load duty cycle => (180/320)*(4500/4700) = 0.54
 * where:
 *  180 is motor max voltage,
 *  320 is system supply voltage 
 *  4700 is max motor speed
 * 
 * So how do we get RPM reading from the actualSpeedPulses pulse count?
 * 
 * CCPR1L is just an 8 bit register and is set by the code to define the PWM
 * pulse width, with the 2 bits from the CCP1CON register tacked on as LSB
 * 
 * Now pulse width = 0 for 0rpm, and FF for 4500rpm and RPM increases 
 * in steps of 350rpm for every button press, ie 11 steps plus "off"
 *  
 * where DCR = Duty cycle ratio = (180/320)*(1000/4700) at 1000rpm
 *                              = 0.5625*0.213 = 12%            
 * 
 * Duty cycle varies between 12% and 54% at no load
 *
 * The spinning disk on the motor has 36 openings
 * 
 * If we measure in 0.1s and scale that up then any measurement errors are
 * magnified by the scale factor.  However if we work backwards starting at 
 * the desired rpm, there are no errors.
 * 
 * For example 1000RPM with 36 openings in the disk means 36000 pulses per 
 * minute.  In 1/10s there are 36000/600 pulses = 60pulses.  Hence in 1/10th 
 * second units we need to count 60 pulses.  
 * 
 * At 4500RPM, we need to count 270 pulses in 1/10s.  
 * 
 * Due to the speed being proportional to voltage the speed is linear between
 * 60 and 270 pulse counts
 * 
 * This is set out below where the RPM is in column E, and column B is the 
 * calculated count in 1/10s and column C is that calculated count but allowing 
 * for rounding errors in the PWM setup using integers
 * 
 * 
* 	osc freq =	8000000					
*	prescale val =	1	PWM period=	0.000051			
*	PR2	65[hex]	101[decimal]		PWM freq	19607.84314	kHz
*	page 129		Remember the objective is to work in integers only							
*
*A	 B  C	D	 E    F      G       H   I       J          K        L   M
*off 0			 0	  0	     0	     0	 0       0	        0	     0   0
*1	60		10	3C	1000 0.11968085	49	31	0.00000613	0.12009804	1003 60
*2	81	10	10	51	1350 0.16156915	66	42	0.00000825	0.16176471	1351 81
*3	102	10	10	66	1700 0.20345745	83	53	0.00001038	0.20343137	1699 102
*4	123	10	10	7B	2050 0.24534574	100	64	0.00001250	0.24509804	2047 123
*5	144	10	10	90	2400 0.28723404	117	75	0.00001463	0.28676471	2396 144
*6	165	10	10	A5	2750 0.32912234	134	86	0.00001675	0.32843137	2744 165
*7	186	10	10	BA	3100 0.37101064	151	97	0.00001888	0.37009804	3092 186
*8	207	10	10	CF	3450 0.41289894	168	A8	0.00002100	0.41176471	3440 206
*9	228	10	10	E4	3800 0.45478723	186	BA	0.00002325	0.45588235	3809 229
*10	249	10	10	F9	4150 0.49667553	203	CB	0.00002538	0.49754902	4157 249
*11	270	10		10E	4500 0.53856383	220	DC	0.00002750	0.53921569	4505 270
* 
* set up the desired speed array: desiredSpeed[column A] = {column E}
* 
* A = step
* B = design pulse count	(desiredSpeedCtr)
* C = Delta speed down
* D = Delta speed up	
* E = Design Pulse count [hex]	
* F = Design N [RPM]	
* G = design duty cycle ratio (DCR) as a ratio
* H = CCPR1L:CCP1CON<5:4>   =   DCR*4*(PR2+1) [decimal]
* I = CCPR1L:CCP1CON<5:4>   =   DCR*4*(PR2+1) [hex value]
* J = actual pulse width 
* K = actual duty cycle
* L = actual speed assuming voltage ration 180/320
* M = actual pulse count (count adjusted for conversion factors etc)
* 
* Refer Excel spreadsheet for more detail 
*  
* 
*/
 
#include "PF906header.h"


/* 
 * 
 * Some notes on the ADC for those of us who are not familiar:
 * refer
 * https://learn.sparkfun.com/tutorials/analog-to-digital-conversion/all
 * 
 * Resolution of the ADC    =   ADC reading
 * ---------------------        --------------------
 * Sampling ref voltage         Analog volt measured
 * 
 * Rearranging and substitution to find the value the ADC should read:
 * ADC reading  =   1023*3.37
 *                  ---------
 *                      5     
 *    
 * Note, actual tests seem that the voltage peaks at 2.8V so lets close 
 * the relay contacts at 2.2V instead.  Also the 5V is actually 4.8V
 * so that works out to be 1D5 read in hex.
 * 
 */  
// note that LOW or HIGH does not imply false and true.  "True" is a 
// logic state, not a voltage level.
#define  LOW 0x00
#define HIGH 0x01  

/* Port A */
#define FR6out                PORTAbits.RA1 // feedback link - active low
// lift motor wind direction - high is one way, low is the other.  Not used   
#define RaiseLower_output     PORTAbits.RA4       
// belt motor on/off via totem control
#define TotemControl_output   PORTAbits.RA5     

/* Port B */
#define LiftMotorUp_input     PORTBbits.RB4 // assumed FR3 in - active low not used
#define SpeedDown_input       PORTBbits.RB5 // assumed FR2 in - active low
#define SpeedUp_input         PORTBbits.RB6 // assumed FR1 in - active low

/* 
 * see the circuit diagram...
 * https://github.com/happymacer/PF906-treadmill-motor-controller-
 * the default value for FR7 LED (opto LED) is off, so Q8 default is on, 
 * hence UserPowerOn_input is LOW.  
 * 
 * To change the UserPowerOn_input state Q8 must turn off, 
 * Q11 must turn on and hence the opto transistor must be on, ie the opto LED 
 * must be on.  
 *   
 * To make the opto LED turn on, J3 pin3 must be low.
 *        
 * The PIC input itself is LOW in the default state as Q8 is on, so at the PIC
 * it must be an active high input, even if the user control is active low.    
*/
// PIC control of the motor DC power supply:
#define PowerPermissive_output PORTBbits.RB7 //output 

/* Port C */
#define LiftMotorDown_input   PORTCbits.RC2 // assumed FR4 in - active low not used
#define RPM_input             PORTCbits.RC3 // RPM counter input 
#define LED1                  PORTCbits.RC4 // LED 1 - active low
#define LiftPower_output      PORTCbits.RC6 // supply power to lift motor             
// power input by user - active high - assumed to remain on till user pushes
// the screen board POWER button again. If that happens then the signal goes 
// low again
#define UserPowerOn_input     PORTCbits.RC7 

/* Global constants */
const int TestVoltage = 0x214; // min voltage to be measured before closing the relay
const int minimumVoltage = 0x10E; // voltage to me measured during run time

/* Global variables */
// analog voltage conversions
int HV = 0, IV = 0, MV = 0; // 16 bits each

uint8_t button_history_speedUP = 0b11111111; // look for a low input so start with all 1's
uint8_t button_history_speedDN = 0b11111111;
uint8_t button_history_UserPowerOn_input = 0b00000000; // looks for a high input
// these are arbitrary but convenient speeds - see spreadsheet extract col I
uint8_t desiredSpeed[] = {0x0,0x31,0x42,0x53,0x64,0x75,0x86,0x97,0xA8,0xBA,0xCB,0xDC};

//where the index is desiredSpeedCtr - see spreadsheet extract above
uint8_t desiredSpeedCtr = 0;
int8_t speedError = 0; // can be both pos or neg
// updated in the ISR:
volatile int actualSpeedPulses = 0;  // count of the actual pulses 

//Function Prototypes...
void FlashLED1 (uint8_t times, uint8_t period);
//void FlashLED5 (uint8_t times, uint8_t period);

//set up the chip features
void doSetup(void);
//Measure the motor voltage
int CheckMV (void);
//measure the motor current
int CheckIV (void);
//measure the incoming source voltage after the caps, before the IGBTs
int CheckHV (void);
//set up the comparator to measure rpm
void setupactualSpeedPulses(void);

void startPWM(void);
// All interrupt routines
void __interrupt() Isr(void);
   
    
void main(void) {

    doSetup();  //set up the chip peripherals 

    // set up LED output (active low) on RC4 
    // flash the LED then leave it on to indicate all ok.  If it turns off 
    // then something is wrong.  It flashes regularly when the loop ends  
    LED1 = LOW;

    // set up the lift motor to do nothing
    RaiseLower_output = LOW;  // lift relay coil is not activated
    LiftPower_output = HIGH;  // lift motor power off 
    
    // Disable the belt (main DC) motor 
    PowerPermissive_output = LOW; 
    TotemControl_output = LOW; 

    /* 
     * Now wait for the caps to charge 
     * The question is what voltage to let the caps change to.  It takes about
     * 3 minutes to fully charge the caps via the R55 resistor (47k) but its 
     * probably enough to trigger the relay at say 90s.  The NGSpice model says 
     * the HV measurement point will be (scaled to) about 3.37V in 90s. 
     * This is mostly arbitrary but if your voltage is too low the relay 
     * contacts will burn over time due to the surge current.
     * 
     * Remember this is a treadmill so its probably left on all day in the gym, 
     * so the caps remain charged so a user doesn't see the delay.  In a 
     * workshop its a bit painful to wait 3 minutes.  Reduce the resistor 
     * value if you cant live with the time delay. 
     * 
     * Max value HV gets to is about 4.2V allowing for errors in my NGSpice 
     * models in Kicad
     * 
     * I dont know if this is right, but lets attempt to put some math to it.
     * 
     * The relay is a 953-1A and is TUV rated at 2HP/250VAC PF=0.6
     * Assuming a 2HP motor starts up in say 1s and has 6x FLA at start 
     * P=2.5hp => 10.5A FLA. so I=6x10.6 and  I^2t=(6*10.5)^2x1=3969A^2t 
     * assuming i takes 0.055s to charge the caps when the relay closes peak 
     * charging current is sqrt(3969/0.055)=sqrt(72164)=269A
     * 
     * So roughly speaking the relay will handle about 270A peak current for 
     * 55ms and experience the same heating as a allowed 2hp motor start taking 
     * 6xFLA for 1s
     *    
     */ 

    HV = CheckHV();    
    while (HV <= TestVoltage) {// wait for cap charging - takes about 40s 
        __delay_ms(250);
        HV = CheckHV();
    };
    // ... when caps charged then...
    FR6out = LOW; 
    PowerPermissive_output = HIGH;

    // energise RLA2 to apply mains voltage.  Drop PowerPermissive_output 
    // if something is wrong
    
    /* 
     * Now wait for the user to request motor power on
     * Polling is generally considered wasteful as the processor does nothing
     * other than poll.  In this case it really doesn't matter as we wont do 
     * anything else anyway
     * 
     * The User power on must stay on to ensure that the RLA2 stays closed.  
     * If it drops off then the power circuit opens cutting off the motor supply
     * 
     * The button is debounced by the OPTO and the capacitor on the output side
     * before Q8 but I want more debounce for my button input.  When it has an 
     * upstream driver I can remove this debounce
     * 
     * 
    */

    while (button_history_UserPowerOn_input != 0b01111111) { 
       // Poll the input pin using debounce
       button_history_UserPowerOn_input = button_history_UserPowerOn_input << 1;
       button_history_UserPowerOn_input |= UserPowerOn_input;
    };
    
    /* 
     * To get here the user power input must have been triggered and the caps 
     * are charged so by the design of the circuit, RLA2 will close its 
     * contacts provided PowerPermissive_output is true (HIGH) 
     * 
     * We are now ready to start turning the belt motor 
     * (and/or the incline motor)
     * 
    */     

    INTCON = 0b11000000; 

    // turn on the totemcontrol to allow PWM to run the motor
    TotemControl_output = HIGH;   
 
    /*******************************************************
     *                                                     *
     * From here everything happens in the operating loop  *
     *                                                     *
     *******************************************************/        
    
    while (UserPowerOn_input && PowerPermissive_output) {   
      
/*
 * Since all is OK, set the speed the user wants when the user 
 * pushes the "speed" button.
 * 
 * Speed up and down buttons work by polling
 * Note that the motor does nothing after power on as the speed = 0.  
 * To do this apply a debounce routine to the speed buttons and just 
 * read the port pins
 * This is the users speed selection between 1000 and 4500rpm 
 * 
 *  
 * desiredSpeedCtr is a counter for the user to select the speed steps 
 * -> the desired speed step.
 * 
 * actualSpeedPulses is the counted pulses for speed feedback 
 * 
 * 
 * ***BEWARE*****BEWARE*****BEWARE*****BEWARE*****BEWARE*****BEWARE*****
 * The motor is rated for 180VDC max, and the power supply at 100% PWM 
 * is 320VDC, hence max time on is (18000/320)% = 56% at no load
 * *********************************************************************
 * (see PWM setup)
 *
 * In this loop we must start the timer 1 for 0.1s so we can do pulse 
 * counts and PID....
 * 
 * Now poll for the speed buttons - remember to debounce
 * 
 * Debounce works as follows:
 * https://hackaday.com/2015/12/10/embed-with-elliot-debounce-your-noisy-buttons-part-ii/#more-180185
 * 
 * Keep in mind that the board has a small cap across the OPTO LED.  
 * This somewhat forms a hardware debouncer but I think we need 
 * more debounce
 * 
 * We are in a fast loop, so it will read the 2 speed buttons
 * every cycle to keep a history.
 * 
 * We are looking for an active LOW signal so opposite to the website
 * description...
 * 
 * We look for a 0b10000000 pattern which means a button is 
 * pressed.  Pressed means a low input (0x00)
 * 
 * If the pattern matches then update a variable, if not then do 
 * nothing till the next read.
 * 
 * As the history starts at 0b11111111, it takes 7 loops with a button 
 * pressed before it is registered as a press on the 8th
 * 
 * the entire routine just checks to see if button_history is 
 * 0b10000000. Detecting a release is then a test for 0b00000001 
 * and the button up and down states are 0b11111111 and 0b00000000
 * respectively. 
 * 
*/
        // setup for FR6 to output RPM pulses
        FR6out = HIGH;  //turn it off
        
        //read the speed buttons
        button_history_speedUP = button_history_speedUP << 1;
        button_history_speedUP |= SpeedUp_input;
        button_history_speedDN = button_history_speedDN << 1;
        button_history_speedDN |= SpeedDown_input;
        //act on button pressed
        if (button_history_speedUP == 0b10000000)   { //RB6 - speed up triggered
            if (desiredSpeedCtr < 11) ++desiredSpeedCtr; 
            //do we need to reset the timer1 and the speed test counter????
            //button_history_speedUP = 0b11111111;
        };
        if (button_history_speedDN == 0b10000000) { //RB5 - speed down triggered
            if (desiredSpeedCtr > 0) --desiredSpeedCtr;
            //do we need to reset the timer1 and the speed test counter????
            //button_history_speedDN = 0b11111111;
        };
        
        // enable the port interrupts if needed       
        // INTCONbits.RABIE = 0x01; 
        
        // Set the PWM speed... by adjusting the PWM duty cycle
        // Get the lowest 2 bits
        CCP1CONbits.DC1B = (desiredSpeed[desiredSpeedCtr] & 0x3); 
        // Get the rest of the bits and set the register
        CCPR1L = (desiredSpeed[desiredSpeedCtr] >> 2);      
   
        //check that everything is OK...       
//        HV = CheckHV();
//        if ((HV < minimumVoltage)) { // add in other safety tests 
//            // HV is measured across the IGBTs so it reads different 
//            // when they are switching
//            // something has gone wrong or user power off: turn off everything
//            // changes to the pin state will make electronics shut down
//            // ...cycle power to reset
//            CCP1CONbits.DC1B = 0; // set the RPM to 0
//            CCPR1L = 0;
//            TotemControl_output = LOW;
//            PowerPermissive_output = LOW;
//            FlashLED5(2,5);
//        };

    };
    
    // and we are done....shut everything down and power cycle to reset
    CCP1CONbits.DC1B = 0; // set the RPM to 0
    CCPR1L = 0;
    TotemControl_output = LOW;
    PowerPermissive_output = LOW;
    LED1 = HIGH;

    /*
     * When "main(){};" ends, the compiler adds code to soft reset the code, 
     * so to stop the device it must stay in this loop.  Microchip recommends 
     * to never let the device exit the main loop
    */
     while (1){
         FlashLED1(1,4);
     };    
    };    



/*** end of main code *****************************/


void FlashLED1 (uint8_t times, uint8_t period) {  
    //period in multiples of 50ms    
    uint8_t p = period;
    if (times > 5) {times = 5;} // limit to 5 flashes
    if (period > 10) {period = 10;} // limit the delay length to 1s
    do {
        LED1 = HIGH;    // Turn LED off as its already on
        do {__delay_ms(50); 
           } while (--p);
        p = period;
        LED1 = LOW;     // Turn LED on
        do {__delay_ms(50); 
           } while (--p);
        p = period;
        } while (--times);    
       LED1 = HIGH;  //always finish with the LED OFF
    // LED1 = LOW;  //always finish with the LED solid on 
};

//void FlashLED5 (uint8_t times, uint8_t period) {  // also flashes opto FR6
//    //period in multiples of 50ms
//    uint8_t p = period;
//    if (times > 5) {times = 5;} // limit to 5 flashes
//    if (period > 5) {period = 5;} // limit the delay length
//        do {
//        FR6out = HIGH;    // Turn LED off as its already on
//        do {__delay_ms(50); 
//           } while (--p);
//        p = period;
//        FR6out = LOW;     // Turn LED on
//        do {__delay_ms(50); 
//           } while (--p);
//        p = period;
//        } while (--times);    
//        FR6out = HIGH;  //always finish with the LED OFF
//    //    FR6out = LOW;  //always finish with the LED solid on 
//};



void doSetup(){
    // set up the internal oscillator to 8Mhz and use the internal oscillator
    OSCCON = 0b01110001; //8MHz 
    
    // Make sure the PORT bits are all reset after PIC power up or reset
    // refer datasheet page 200 that says they are undefined on power up
    // BEWARE some things turn on when low - low is not always a safe state
    PORTA = 0b00000010;
    PORTB = 0b00000000;
    PORTC = 0b01110000;
    
    // set the ADC conversion rate to 4uS- set here as it only needs to be 
    // done once  
    ADCON1 = 0b00100000;  
    
    // disable global, peripheral and IOC port A & B
    INTCON = 0b00000000; // was 0b11001000 

    // disable interrupts on Port B
    IOCA = 0b00000000; // no interrupts on port A
    IOCB = 0b00000000; // was 0b01100000 for just 2 on port B    
    // set up the interrupt enables of used interrupts
    PIR1 = 0x00; // reset all the Interrupt flags
    PIR2 = 0x00;
    //turn off the second comparator and its interrupt
    CM2CON0bits.C2ON = 0x00;
    PIE2bits.C2IE =0x00;
    
    /*    P             - 1 is input 0 is output
     *    O  
     * T  R  
     * R  T  
     * I  @Power on  
     * S        
     * 
     * 1  0 RA0 = ICSP data
     * 0  1 RA1 = ICSP clock and FR6 output active low
     * 1  0 RA2 = MV analog input
     * 1  0 RA3 = VPP/MCLR input
     * 0  0 RA4 = lift motor raise/lower relay coil active high
     * 0  0 RA5 = Totem control output active high
     * 
     * 0  0 RB0 to RB3 unimplemented on PIC - set arbitrarily to input
     * 1  0 RB4 = FR3 control input - assumed lift motor up active low
     * 1  0 RB5 = FR2 control input - assumed speed down active low
     * 1  0 RB6 = FR1 control input - assumed speed up active low
     * 0  0 RB7 = Relay 2 main DC power control output active high
     *  
     * 1  0 RC0 = IV analog input
     * 1  0 RC1 = HV analog input
     * 1  0 RC2 = FR4 control input - assumed lift motor down active low
     * 1  0 RC3 = RPM input wave to comparator
     * 0  1 RC4 = LED 1 output active low
     * 0  1 RC5 = PWM output active LOW (ie when low the MOSFETs are on)
     * 0  1 RC6 = Power to lift motor enable output active low
     * 1  0 RC7 = FR7 user system power-on request input - when opto LED is on,
     *            then FR7 pin 2 was driven LOW (so active low) 
     *            then power-on input to the PIC is ON (active high)
     *
     * To make FR4 on RC2 interrupt driven use Comparator 2.  Not required 
     * here so not implemented
     * 
     *  
    */
    
    
    // set up the data direction to match PF906 board - see text above
    TRISA = 0b00001101; 
    TRISB = 0b01110000;
    TRISC = 0b10001111; 
    
    /* 
     * set all the Port (A, B & C) pins as digital as a configuration  
     * starting point
     * 
    */
    ANSEL = 0x00;
    ANSELH = 0x00;
    //then set up the analog inputs ...
    ANSELbits.ANS2 = 0x01;  // MV this is an analog input
    ANSELbits.ANS4 = 0x01;  // IV 
    ANSELbits.ANS5 = 0x01;  // HV
    
    
    //set up and start PWM on RC5
    startPWM(); // always starts at 0rpm by default

    // Timer 2 is used in PWM, Timer 1 is 0.1s cycle timer
    // and Timer 0 available
    
    // setup Timer 1 IE for RPM counter read
    /* Instruction cycle is 1/4 of 8MHz and an interrupt every 0.1s means we 
     * need a count of 200000 so prescaler of 4 means a 16 bit timer gets to 
     * 50000 then overflows
     * 
     * The T1CON register sets the TMR1 prescale... 
     * 
     *            bit:  7  6  5  4  3  2  1  0
     * T1CON register   0  0  1  0  0  0  0  0 ... see page 87 - timer is off
     * 
     * The TMR1H and TMR1L must be pre-loaded - overflow is at 65535, counter
     * value required is 50000, so the difference is loaded into the registers
     *  15535 = 0x3CAF so
     * TMR1L = 0xAF
     * TMR1H = 0x3C
     * 
    */ 
    T1CON = 0b00100000; //timer is off
    TMR1L = 0xAF;
    TMR1H = 0x3C;
    PIE1bits.CCP1IE = 0x00; // disable capture and compare 1
    PIE1bits.TMR1IE = 0x01; // enable interrupt from Timer 1 
    
    //Timer 1 setup for 0.1s timer is done and is not running
 
    
    //set up the RPM counter actualSpeedPulses
    setupactualSpeedPulses();  
    
};
   
/*
 * Measure the motor voltage...  
 * I expect it measures the motor voltage under load.  This can then be 
 * multiplied by the IV value to ensure the motor is not operating beyond 
 * its power limits
 * 
 * As load increases, torque required increases, current increases 
 * proportionally, and due to R8 & R8A and other internal resistance, 
 * the motor voltage drops.  If it drops then the speed-torque curve drops too
 * 
 * This can be a secondary control loop to maintain 180V on the motor 
 * 
 */
int CheckMV (){
    // turn off the ADC before making changes
     ADCON0bits.ADON = 0x0;
    //set up analog input on RA2 AN2 (MV) - range 0-3.6V = 0-200VDC
    ADCON0 = 0b10000101; // right justified, VDD volt ref, channel AN2, 
                         // not in progress, ADC on
    __delay_ms(5);
    ADCON0bits.GO_nDONE = HIGH; // start the ADC
    while (ADCON0bits.GO_nDONE) {}; //wait for the conversion
    return (ADRESL | (ADRESH<<8));
};

/*
 * 
 * Measure the motor current...
 * Note torque is proportional to current
 * 
 * The motor power is 2.5HP (1900W) so max continuous current = 10.7A @ 180V
 * 
 * This can also be a secondary control loop
 * 
 */
int CheckIV (){
    // turn off the ADC before making changes
     ADCON0bits.ADON = 0x0;
    //set up analog input on RC0 AN4 (IV) - range 0- 3.2V = 0 - 10.5A
    ADCON0 = 0b10010001; // right justified, VDD volt ref, channel AN4, 
                         // not in progress, ADC on
    __delay_ms(5);
    ADCON0bits.GO_nDONE = HIGH; // start the ADC
    while (ADCON0bits.GO_nDONE) {}; //wait for the conversion
    return (ADRESL | (ADRESH<<8));
};

/*
 * Measure the incoming source voltage after the caps, before the IGBTs
 * so that the caps are charged gently.  When charged sufficiently the relay 
 * closes making mains power available to the motor circuit
 * 
 * It prevents all motor control till the voltage from the mains is available
 * 
 * 
 */
int CheckHV (){  
    // 16 bits is plenty, 8 is too few as maxes out at 255
    // steps as per sect 9.2.6 page 109
    ADRESL = 0x00;
    ADRESH = 0x00;
    // turn off the ADC before making changes
    ADCON0bits.ADON = 0x0;
     
    //step 1
    //done in main program
    
    //step 2
    //ADC clock set in main program
    //set up analog input on RC1 AN5 (HV) 
    ADCON0 = 0b10010101; // right justified, VDD volt ref, channel AN5, 
                         // not in progress, ADC on
    

    // step 3 not used

    // step 4
    __delay_ms(5); // data acquisition time is estimated at 4.4us per bit
    // there is a error on this page (114) as it changes from us in the 
    // derivation to ms in the final formula.  Looking at page 250 Tacq is 
    // 5us 
    
    //step 5 - start the ADC
    ADCON0bits.GO_nDONE = HIGH;
    
    //step 6 - wait for the conversion
    while (ADCON0bits.GO_nDONE) {};  
    
    //step 7    
    return (ADRESL | (ADRESH<<8));  

};

void setupactualSpeedPulses() {  
/* 
 * Set up pulse counter on RC3 (RPM) Volatile variable actualSpeedPulses
 *
 * The RPM counter setup is a bit unusual.
 * 
 * First the RPM signal is connected to RC3, which is not an interrupt pin.
 * The RPM signal is similar to a sine wave rather than a square wave, as 
 * it is formed by light from a LED crossing through a hole in a spinning 
 * disk on the motor shaft to a light dependent transistor, much like we 
 * have sunrise, daytime, then dusk.  The signal passes low pass filters 
 * that further reduce the rise time of the wave.
 * 
 * To make this wave a reliable counter it is input through the RC3 pin to 
 * the inverting input of the #1 comparator.  This comparator then 
 * triggers the counter interrupt where it increments the RPMctr.
 * 
 * The comparator output is triggered when the RPM signal exceeds 0.6V
 * and the interrupt is triggered by the change of the comparator output, 
 * making it edge triggered.  Due to the 2 state changes per light pulse
 * the counter may count double what we want (TBC)
 * 
 * Side note, the motor is rated at 4700rpm, so limiting the max controlled 
 * speed to 4500rpm for a little margin and a convenient multiple of 350
 * 
 * 
 * To measure the speed, timing is critical so we need to use an accurate time 
 * base (ie timer1) timing as accurately as possible.   
 * 
 *   
 * Additional motor protection could be to to check if the count exceeds a 
 * particular number.  If so then something went wrong and we can shut down
 * the motor
 * 
 */
    
    // enable the interrupt 
    PIE2bits.C1IE =0x01;
    
  //refer  fig 8.2 page 92 and register 8.1 page 96
  //   bits   7  6  5  4  3  2  1  0
  //CM1CON0 = 0  1  0  0  0  1  1  1-comp off, inverted, pin off ,C12IN3- input
    CM1CON0 = 0b01000111;
    
    //refer  fig 8.2 page 92 and register 8.5 page 104
    //      bits   7  6  5  4  3  2  1  0
    // VRCON  =    0  0  0  1  0  0  0  0 -0.6v ref enabled         
    VRCON = 0b00010000;
    
    //remember to reset the interrupt C1IF when it return from the ISR 
    

    };
    
void startPWM(){
    /* 
     * The PWM duty cycle relative to 320V sets the motor speed
     * 
     * FOR PWM output on P1A then:
     * Tris for P1A must be cleared -> pin RC5 = 0 to output PWM
     * CCP1CON register must be 00xx1100 where xx is the LSB of the duty cycle
     * PR2 value = 0x65
     * prescale = 1
     * 
     * Following steps section 11.3.7 page 130 of the 16F690 datasheet...
     * 
     * Remember that chip osc is set to 8MHz so using example data in table 11.3
     * 
    */
    
    //step 1
    TRISCbits.TRISC5 = 0x01; // make it a tri-state to disable output
    
    //step 2
    /*
     * PWM period   = [PR2+1]*4*TMR2 prescale/8000000
     *              = [PR2+1]/2000000
     * therefore
     * PR2 = PWM period*2000000 - 1
     * PR2 = 2000000/PWMfrequency - 1
     * thus PR2 = 2000000/19000 - 1 = (rounded) 103 = 67h, say 65h
     * OR PR2 = 2000000/31000 - 1 = 63 = 3Fh for 31kHz
     * 
     * Also refer spreadsheet extract above
     */
    PR2 = 0x65;     // set the PWM period (ie frequency) ~19kHz
    
    //step 3
    /*
     * For CCP1CON register page 125 Reg 11-1
     * Bit 7-6 set depending on bits 3-0 - 00 means single output to P1A
     * bit 5-4 are LSB of duty cycle - here forced to 00
     * bit 3-0 set to 1110 for PWM mode P1A pin active low (active low means
     * that the lower the pulse width, the lower the eventual load voltage
     * 
     *              bit:  7  6  5  4  3  2  1  0
     * CCP1CON register   0  0  0  0  1  1  1  0
     * 
     */
    CCP1CON = 0b00001110;
    // Note we may want to use pulse steering on P1A, register 11-4 PSTRCON
    // page 144
    PSTRCON = 0b00000001; //only steer signal to pin P1A - this is the default
    
    //step 4

    CCP1CONbits.DC1B = 0; // dont set the RPM yet
    CCPR1L = 0;
    
    // step 5 - set up TMR2
    // clear the interrupt flag
    PIR1bits.TMR2IF = 0x00;
    
    /*
     * Set the prescale value
     * 
     * the T2CON register sets the TMR2 prescale... 
     * 
     *            bit:  7  6   5   4   3  2  1  0
     * T2CON register   -  0   0   0   0  1  0  0 so 
     * 1:1 post scaler bits 6-3
     * timer 2 is on bit 2
     * prescaler bit 1-0 is set to 1 Register 7-1 page 90
     * 
     */
    T2CONbits.T2CKPS = 0x00; // timer 2 prescale set to 1x
    
    //turn TMR2 on
    T2CONbits.TMR2ON = 0x01; 
    
    //step 6
    //wait for TMR2 overflow flag to set
    while (!PIR1bits.TMR2IF) {}; // wait for the TMR2 overflow
    
    //enable PWM output 
    TRISCbits.TRISC5 = 0x00; // enable output 
    
    // done with PWM setup, now change CCP1CON and CCPR1L as required 
    };

    
void __interrupt() Isr(void) {
    // On PIC devices all the interrupts get handled by this ISR
    // common code to all interrupts
    
    INTCONbits.GIE = LOW; // disable all interrupts in this routine as we are 
                           // already responding to an interrupt
        
    // this is the ISR for the RPM counter on Comparator 1 Interrupt flag
    if (PIE2bits.C1IE && PIR2bits.C1IF) { 
        ++actualSpeedPulses;
        PIR2bits.C1IF = LOW; // reset the counter interrupt flag
    };
    
    // this is the ISR for Timer1 - the RPM cycle timer
    if (PIE1bits.TMR1IE && PIR1bits.TMR1IF) { 
        //turn off comparator 1
        CM1CON0bits.C1ON = LOW; //actualSpeedPulses is now a valid count
        T1CONbits.TMR1ON = LOW; //turn the timer off again
        // note reset the timer 1 interrupt in the main loop to allow the 
        //read of the data and other calcs to get RPM
    };
    
    
    
    // these are port B interrupt responses - not used
//    if (INTCONbits.RABIE && INTCONbits.RABIF) {  
//        /* 
//         * RABIF is an "Interrupt on Change" 
//         * 
//        */       
//        if (IOCBbits.IOCB6)   { //RB6 
//          //do something  
//        };
//
//        if (IOCBbits.IOCB5) { //RB5 
//          //do something 
//        };
//        INTCONbits.RABIF = 0x00; // reset the interrupt
//    };
   
    // this is the ISR for the Timer 0 overflow IF
    
//    INTCONbits.GIE = 0x01; //enable all interrupts again
};


