# PF906-treadmill-motor-driver-control-code
Version 4b (first public release) Control code for the 16F690 PIC controller on the motor control board.  It is intended to replace the treadmill controller code to make it more useful in machine tool applications like a lathe. Use at your own risk. Do ***NOT*** use it for a treadmill!

Im making this code public under the GNU AFFERO GENERAL PUBLIC LICENSE - https://choosealicense.com/licenses/agpl-3.0/.  If anyone cares to help me develop it further I would be grateful!  None of this code can be used in closed-source applications.

There are no safeties built into the code yet.  It simply generates PWM power for the DC motor.  Please dont use with it if you are inexperienced with mains powered  circuits. Also make sure to bolt the motor down before starting it - I didn't and it jumped off the desk and luckily only broke things and not me.  You may not be so lucky.  Again - **use at your own risk**.

I've extensively commented the code for my own benefit to remind me what Ive done and why.  I hope you will find it easy to follow.  Happy to answer questions through Github "issues".

This code uses discrete speed steps to step the motor through a range of speeds from ~1000RPM to ~3500RPM in 10 equal steps.  These steps can be adjusted in the code. It does 1 step from 0-1000RPM.

This is basic code that allows the motor to run at the speed point selected.  Speed can be changed while running by pressing the "speed +" or "speed -" buttons.  It does not use PID yet to maintain the speed under load, and Im hoping to add that as the next release.

To run the motor it is necessary to connect a set of control switches as described in the schematic of the PF906 motor controller board.  Simple tactile switches are best to limit switch bounce - although I have included swuitch deounce code (... and it may have a bug!) I have run this code live and it works as expected.

To compile the code you will need MPLAB X for PIC16F690 with the XC8 free C compiler.  The original PIC on the board can be rewritten with new code but not read.  Once you upload this code to the 16F690 there is no way to recover the original code so choose carefully.  A way around that is to remove the original chip and replace it with a new one. 



```- Happymacer ```
 
