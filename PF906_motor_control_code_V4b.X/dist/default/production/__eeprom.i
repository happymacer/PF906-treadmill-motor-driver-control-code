# 1 "C:\\Program Files\\Microchip\\xc8\\v2.36\\pic\\sources\\c90\\pic\\__eeprom.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 288 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "C:\\Program Files\\Microchip\\xc8\\v2.36\\pic\\sources\\c90\\pic\\__eeprom.c" 2
# 1 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\xc.h" 1 3
# 18 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\xc.h" 3
extern const char __xc8_OPTIM_SPEED;

extern double __fpnormalize(double);



# 1 "C:\\Program Files\\Microchip\\xc8\\v2.36\\pic\\include\\c90\\xc8debug.h" 1 3
# 13 "C:\\Program Files\\Microchip\\xc8\\v2.36\\pic\\include\\c90\\xc8debug.h" 3
#pragma intrinsic(__builtin_software_breakpoint)
extern void __builtin_software_breakpoint(void);
# 24 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\xc.h" 2 3



# 1 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\pic.h" 1 3




# 1 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\htc.h" 1 3



# 1 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\xc.h" 1 3
# 5 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\htc.h" 2 3
# 6 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\pic.h" 2 3







# 1 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\pic_chip_select.h" 1 3
# 293 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\pic_chip_select.h" 3
# 1 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 1 3
# 44 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
# 1 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\__at.h" 1 3
# 45 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 2 3







extern volatile unsigned char INDF __attribute__((address(0x000)));

__asm("INDF equ 00h");




extern volatile unsigned char TMR0 __attribute__((address(0x001)));

__asm("TMR0 equ 01h");




extern volatile unsigned char PCL __attribute__((address(0x002)));

__asm("PCL equ 02h");




extern volatile unsigned char STATUS __attribute__((address(0x003)));

__asm("STATUS equ 03h");


typedef union {
    struct {
        unsigned C :1;
        unsigned DC :1;
        unsigned Z :1;
        unsigned nPD :1;
        unsigned nTO :1;
        unsigned RP :2;
        unsigned IRP :1;
    };
    struct {
        unsigned :5;
        unsigned RP0 :1;
        unsigned RP1 :1;
    };
    struct {
        unsigned CARRY :1;
        unsigned :1;
        unsigned ZERO :1;
    };
} STATUSbits_t;
extern volatile STATUSbits_t STATUSbits __attribute__((address(0x003)));
# 159 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
extern volatile unsigned char FSR __attribute__((address(0x004)));

__asm("FSR equ 04h");




extern volatile unsigned char PORTA __attribute__((address(0x005)));

__asm("PORTA equ 05h");


typedef union {
    struct {
        unsigned RA0 :1;
        unsigned RA1 :1;
        unsigned RA2 :1;
        unsigned RA3 :1;
        unsigned RA4 :1;
        unsigned RA5 :1;
    };
} PORTAbits_t;
extern volatile PORTAbits_t PORTAbits __attribute__((address(0x005)));
# 216 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
extern volatile unsigned char PORTB __attribute__((address(0x006)));

__asm("PORTB equ 06h");


typedef union {
    struct {
        unsigned :4;
        unsigned RB4 :1;
        unsigned RB5 :1;
        unsigned RB6 :1;
        unsigned RB7 :1;
    };
} PORTBbits_t;
extern volatile PORTBbits_t PORTBbits __attribute__((address(0x006)));
# 255 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
extern volatile unsigned char PORTC __attribute__((address(0x007)));

__asm("PORTC equ 07h");


typedef union {
    struct {
        unsigned RC0 :1;
        unsigned RC1 :1;
        unsigned RC2 :1;
        unsigned RC3 :1;
        unsigned RC4 :1;
        unsigned RC5 :1;
        unsigned RC6 :1;
        unsigned RC7 :1;
    };
} PORTCbits_t;
extern volatile PORTCbits_t PORTCbits __attribute__((address(0x007)));
# 317 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
extern volatile unsigned char PCLATH __attribute__((address(0x00A)));

__asm("PCLATH equ 0Ah");




extern volatile unsigned char INTCON __attribute__((address(0x00B)));

__asm("INTCON equ 0Bh");


typedef union {
    struct {
        unsigned RABIF :1;
        unsigned INTF :1;
        unsigned T0IF :1;
        unsigned RABIE :1;
        unsigned INTE :1;
        unsigned T0IE :1;
        unsigned PEIE :1;
        unsigned GIE :1;
    };
} INTCONbits_t;
extern volatile INTCONbits_t INTCONbits __attribute__((address(0x00B)));
# 386 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
extern volatile unsigned char PIR1 __attribute__((address(0x00C)));

__asm("PIR1 equ 0Ch");


typedef union {
    struct {
        unsigned TMR1IF :1;
        unsigned TMR2IF :1;
        unsigned CCP1IF :1;
        unsigned SSPIF :1;
        unsigned TXIF :1;
        unsigned RCIF :1;
        unsigned ADIF :1;
    };
    struct {
        unsigned T1IF :1;
        unsigned T2IF :1;
    };
} PIR1bits_t;
extern volatile PIR1bits_t PIR1bits __attribute__((address(0x00C)));
# 456 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
extern volatile unsigned char PIR2 __attribute__((address(0x00D)));

__asm("PIR2 equ 0Dh");


typedef union {
    struct {
        unsigned :4;
        unsigned EEIF :1;
        unsigned C1IF :1;
        unsigned C2IF :1;
        unsigned OSFIF :1;
    };
} PIR2bits_t;
extern volatile PIR2bits_t PIR2bits __attribute__((address(0x00D)));
# 495 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
extern volatile unsigned short TMR1 __attribute__((address(0x00E)));

__asm("TMR1 equ 0Eh");




extern volatile unsigned char TMR1L __attribute__((address(0x00E)));

__asm("TMR1L equ 0Eh");




extern volatile unsigned char TMR1H __attribute__((address(0x00F)));

__asm("TMR1H equ 0Fh");




extern volatile unsigned char T1CON __attribute__((address(0x010)));

__asm("T1CON equ 010h");


typedef union {
    struct {
        unsigned TMR1ON :1;
        unsigned TMR1CS :1;
        unsigned nT1SYNC :1;
        unsigned T1OSCEN :1;
        unsigned T1CKPS :2;
        unsigned TMR1GE :1;
        unsigned T1GINV :1;
    };
    struct {
        unsigned :4;
        unsigned T1CKPS0 :1;
        unsigned T1CKPS1 :1;
    };
} T1CONbits_t;
extern volatile T1CONbits_t T1CONbits __attribute__((address(0x010)));
# 587 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
extern volatile unsigned char TMR2 __attribute__((address(0x011)));

__asm("TMR2 equ 011h");




extern volatile unsigned char T2CON __attribute__((address(0x012)));

__asm("T2CON equ 012h");


typedef union {
    struct {
        unsigned T2CKPS :2;
        unsigned TMR2ON :1;
        unsigned TOUTPS :4;
    };
    struct {
        unsigned T2CKPS0 :1;
        unsigned T2CKPS1 :1;
        unsigned :1;
        unsigned TOUTPS0 :1;
        unsigned TOUTPS1 :1;
        unsigned TOUTPS2 :1;
        unsigned TOUTPS3 :1;
    };
} T2CONbits_t;
extern volatile T2CONbits_t T2CONbits __attribute__((address(0x012)));
# 665 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
extern volatile unsigned char SSPBUF __attribute__((address(0x013)));

__asm("SSPBUF equ 013h");




extern volatile unsigned char SSPCON __attribute__((address(0x014)));

__asm("SSPCON equ 014h");


typedef union {
    struct {
        unsigned SSPM :4;
        unsigned CKP :1;
        unsigned SSPEN :1;
        unsigned SSPOV :1;
        unsigned WCOL :1;
    };
    struct {
        unsigned SSPM0 :1;
        unsigned SSPM1 :1;
        unsigned SSPM2 :1;
        unsigned SSPM3 :1;
    };
} SSPCONbits_t;
extern volatile SSPCONbits_t SSPCONbits __attribute__((address(0x014)));
# 742 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
extern volatile unsigned short CCPR __attribute__((address(0x015)));

__asm("CCPR equ 015h");




extern volatile unsigned char CCPR1L __attribute__((address(0x015)));

__asm("CCPR1L equ 015h");




extern volatile unsigned char CCPR1H __attribute__((address(0x016)));

__asm("CCPR1H equ 016h");




extern volatile unsigned char CCP1CON __attribute__((address(0x017)));

__asm("CCP1CON equ 017h");


typedef union {
    struct {
        unsigned CCP1M :4;
        unsigned DC1B :2;
        unsigned P1M :2;
    };
    struct {
        unsigned CCP1M0 :1;
        unsigned CCP1M1 :1;
        unsigned CCP1M2 :1;
        unsigned CCP1M3 :1;
        unsigned DC1B0 :1;
        unsigned DC1B1 :1;
        unsigned P1M0 :1;
        unsigned P1M1 :1;
    };
} CCP1CONbits_t;
extern volatile CCP1CONbits_t CCP1CONbits __attribute__((address(0x017)));
# 845 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
extern volatile unsigned char RCSTA __attribute__((address(0x018)));

__asm("RCSTA equ 018h");


typedef union {
    struct {
        unsigned RX9D :1;
        unsigned OERR :1;
        unsigned FERR :1;
        unsigned ADDEN :1;
        unsigned CREN :1;
        unsigned SREN :1;
        unsigned RX9 :1;
        unsigned SPEN :1;
    };
} RCSTAbits_t;
extern volatile RCSTAbits_t RCSTAbits __attribute__((address(0x018)));
# 907 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
extern volatile unsigned char TXREG __attribute__((address(0x019)));

__asm("TXREG equ 019h");




extern volatile unsigned char RCREG __attribute__((address(0x01A)));

__asm("RCREG equ 01Ah");




extern volatile unsigned char PWM1CON __attribute__((address(0x01C)));

__asm("PWM1CON equ 01Ch");


typedef union {
    struct {
        unsigned PDC :7;
        unsigned PRSEN :1;
    };
    struct {
        unsigned PDC0 :1;
        unsigned PDC1 :1;
        unsigned PDC2 :1;
        unsigned PDC3 :1;
        unsigned PDC4 :1;
        unsigned PDC5 :1;
        unsigned PDC6 :1;
    };
} PWM1CONbits_t;
extern volatile PWM1CONbits_t PWM1CONbits __attribute__((address(0x01C)));
# 991 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
extern volatile unsigned char ECCPAS __attribute__((address(0x01D)));

__asm("ECCPAS equ 01Dh");


typedef union {
    struct {
        unsigned PSSBD :2;
        unsigned PSSAC :2;
        unsigned ECCPAS :3;
        unsigned ECCPASE :1;
    };
    struct {
        unsigned PSSBD0 :1;
        unsigned PSSBD1 :1;
        unsigned PSSAC0 :1;
        unsigned PSSAC1 :1;
        unsigned ECCPAS0 :1;
        unsigned ECCPAS1 :1;
        unsigned ECCPAS2 :1;
    };
} ECCPASbits_t;
extern volatile ECCPASbits_t ECCPASbits __attribute__((address(0x01D)));
# 1073 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
extern volatile unsigned char ADRESH __attribute__((address(0x01E)));

__asm("ADRESH equ 01Eh");




extern volatile unsigned char ADCON0 __attribute__((address(0x01F)));

__asm("ADCON0 equ 01Fh");


typedef union {
    struct {
        unsigned ADON :1;
        unsigned GO_nDONE :1;
        unsigned CHS :4;
        unsigned VCFG :1;
        unsigned ADFM :1;
    };
    struct {
        unsigned :1;
        unsigned GO :1;
        unsigned CHS0 :1;
        unsigned CHS1 :1;
        unsigned CHS2 :1;
        unsigned CHS3 :1;
    };
    struct {
        unsigned :1;
        unsigned nDONE :1;
    };
    struct {
        unsigned :1;
        unsigned GO_DONE :1;
    };
} ADCON0bits_t;
extern volatile ADCON0bits_t ADCON0bits __attribute__((address(0x01F)));
# 1175 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
extern volatile unsigned char OPTION_REG __attribute__((address(0x081)));

__asm("OPTION_REG equ 081h");


typedef union {
    struct {
        unsigned PS :3;
        unsigned PSA :1;
        unsigned T0SE :1;
        unsigned T0CS :1;
        unsigned INTEDG :1;
        unsigned nRABPU :1;
    };
    struct {
        unsigned PS0 :1;
        unsigned PS1 :1;
        unsigned PS2 :1;
    };
} OPTION_REGbits_t;
extern volatile OPTION_REGbits_t OPTION_REGbits __attribute__((address(0x081)));
# 1245 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
extern volatile unsigned char TRISA __attribute__((address(0x085)));

__asm("TRISA equ 085h");


typedef union {
    struct {
        unsigned TRISA0 :1;
        unsigned TRISA1 :1;
        unsigned TRISA2 :1;
        unsigned TRISA3 :1;
        unsigned TRISA4 :1;
        unsigned TRISA5 :1;
    };
} TRISAbits_t;
extern volatile TRISAbits_t TRISAbits __attribute__((address(0x085)));
# 1295 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
extern volatile unsigned char TRISB __attribute__((address(0x086)));

__asm("TRISB equ 086h");


typedef union {
    struct {
        unsigned :4;
        unsigned TRISB4 :1;
        unsigned TRISB5 :1;
        unsigned TRISB6 :1;
        unsigned TRISB7 :1;
    };
} TRISBbits_t;
extern volatile TRISBbits_t TRISBbits __attribute__((address(0x086)));
# 1334 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
extern volatile unsigned char TRISC __attribute__((address(0x087)));

__asm("TRISC equ 087h");


typedef union {
    struct {
        unsigned TRISC0 :1;
        unsigned TRISC1 :1;
        unsigned TRISC2 :1;
        unsigned TRISC3 :1;
        unsigned TRISC4 :1;
        unsigned TRISC5 :1;
        unsigned TRISC6 :1;
        unsigned TRISC7 :1;
    };
} TRISCbits_t;
extern volatile TRISCbits_t TRISCbits __attribute__((address(0x087)));
# 1396 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
extern volatile unsigned char PIE1 __attribute__((address(0x08C)));

__asm("PIE1 equ 08Ch");


typedef union {
    struct {
        unsigned TMR1IE :1;
        unsigned TMR2IE :1;
        unsigned CCP1IE :1;
        unsigned SSPIE :1;
        unsigned TXIE :1;
        unsigned RCIE :1;
        unsigned ADIE :1;
    };
    struct {
        unsigned T1IE :1;
        unsigned T2IE :1;
    };
} PIE1bits_t;
extern volatile PIE1bits_t PIE1bits __attribute__((address(0x08C)));
# 1466 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
extern volatile unsigned char PIE2 __attribute__((address(0x08D)));

__asm("PIE2 equ 08Dh");


typedef union {
    struct {
        unsigned :4;
        unsigned EEIE :1;
        unsigned C1IE :1;
        unsigned C2IE :1;
        unsigned OSFIE :1;
    };
} PIE2bits_t;
extern volatile PIE2bits_t PIE2bits __attribute__((address(0x08D)));
# 1505 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
extern volatile unsigned char PCON __attribute__((address(0x08E)));

__asm("PCON equ 08Eh");


typedef union {
    struct {
        unsigned nBOR :1;
        unsigned nPOR :1;
        unsigned :2;
        unsigned SBOREN :1;
        unsigned ULPWUE :1;
    };
} PCONbits_t;
extern volatile PCONbits_t PCONbits __attribute__((address(0x08E)));
# 1544 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
extern volatile unsigned char OSCCON __attribute__((address(0x08F)));

__asm("OSCCON equ 08Fh");


typedef union {
    struct {
        unsigned SCS :1;
        unsigned LTS :1;
        unsigned HTS :1;
        unsigned OSTS :1;
        unsigned IRCF :3;
    };
    struct {
        unsigned :4;
        unsigned IRCF0 :1;
        unsigned IRCF1 :1;
        unsigned IRCF2 :1;
    };
} OSCCONbits_t;
extern volatile OSCCONbits_t OSCCONbits __attribute__((address(0x08F)));
# 1609 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
extern volatile unsigned char OSCTUNE __attribute__((address(0x090)));

__asm("OSCTUNE equ 090h");


typedef union {
    struct {
        unsigned TUN :5;
    };
    struct {
        unsigned TUN0 :1;
        unsigned TUN1 :1;
        unsigned TUN2 :1;
        unsigned TUN3 :1;
        unsigned TUN4 :1;
    };
} OSCTUNEbits_t;
extern volatile OSCTUNEbits_t OSCTUNEbits __attribute__((address(0x090)));
# 1661 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
extern volatile unsigned char PR2 __attribute__((address(0x092)));

__asm("PR2 equ 092h");




extern volatile unsigned char SSPADD __attribute__((address(0x093)));

__asm("SSPADD equ 093h");




extern volatile unsigned char SSPMSK __attribute__((address(0x093)));

__asm("SSPMSK equ 093h");


extern volatile unsigned char MSK __attribute__((address(0x093)));

__asm("MSK equ 093h");


typedef union {
    struct {
        unsigned MSK0 :1;
        unsigned MSK1 :1;
        unsigned MSK2 :1;
        unsigned MSK3 :1;
        unsigned MSK4 :1;
        unsigned MSK5 :1;
        unsigned MSK6 :1;
        unsigned MSK7 :1;
    };
} SSPMSKbits_t;
extern volatile SSPMSKbits_t SSPMSKbits __attribute__((address(0x093)));
# 1740 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
typedef union {
    struct {
        unsigned MSK0 :1;
        unsigned MSK1 :1;
        unsigned MSK2 :1;
        unsigned MSK3 :1;
        unsigned MSK4 :1;
        unsigned MSK5 :1;
        unsigned MSK6 :1;
        unsigned MSK7 :1;
    };
} MSKbits_t;
extern volatile MSKbits_t MSKbits __attribute__((address(0x093)));
# 1797 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
extern volatile unsigned char SSPSTAT __attribute__((address(0x094)));

__asm("SSPSTAT equ 094h");


typedef union {
    struct {
        unsigned BF :1;
        unsigned UA :1;
        unsigned R_nW :1;
        unsigned S :1;
        unsigned P :1;
        unsigned D_nA :1;
        unsigned CKE :1;
        unsigned SMP :1;
    };
    struct {
        unsigned :2;
        unsigned R :1;
        unsigned :2;
        unsigned D :1;
    };
    struct {
        unsigned :2;
        unsigned I2C_READ :1;
        unsigned I2C_START :1;
        unsigned I2C_STOP :1;
        unsigned I2C_DATA :1;
    };
    struct {
        unsigned :2;
        unsigned nW :1;
        unsigned :2;
        unsigned nA :1;
    };
    struct {
        unsigned :2;
        unsigned nWRITE :1;
        unsigned :2;
        unsigned nADDRESS :1;
    };
    struct {
        unsigned :2;
        unsigned R_W :1;
        unsigned :2;
        unsigned D_A :1;
    };
    struct {
        unsigned :2;
        unsigned READ_WRITE :1;
        unsigned :2;
        unsigned DATA_ADDRESS :1;
    };
} SSPSTATbits_t;
extern volatile SSPSTATbits_t SSPSTATbits __attribute__((address(0x094)));
# 1966 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
extern volatile unsigned char WPUA __attribute__((address(0x095)));

__asm("WPUA equ 095h");


extern volatile unsigned char WPU __attribute__((address(0x095)));

__asm("WPU equ 095h");


typedef union {
    struct {
        unsigned WPUA0 :1;
        unsigned WPUA1 :1;
        unsigned WPUA2 :1;
        unsigned :1;
        unsigned WPUA4 :1;
        unsigned WPUA5 :1;
    };
    struct {
        unsigned WPU0 :1;
        unsigned WPU1 :1;
        unsigned WPU2 :1;
        unsigned :1;
        unsigned WPU4 :1;
        unsigned WPU5 :1;
    };
} WPUAbits_t;
extern volatile WPUAbits_t WPUAbits __attribute__((address(0x095)));
# 2047 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
typedef union {
    struct {
        unsigned WPUA0 :1;
        unsigned WPUA1 :1;
        unsigned WPUA2 :1;
        unsigned :1;
        unsigned WPUA4 :1;
        unsigned WPUA5 :1;
    };
    struct {
        unsigned WPU0 :1;
        unsigned WPU1 :1;
        unsigned WPU2 :1;
        unsigned :1;
        unsigned WPU4 :1;
        unsigned WPU5 :1;
    };
} WPUbits_t;
extern volatile WPUbits_t WPUbits __attribute__((address(0x095)));
# 2120 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
extern volatile unsigned char IOCA __attribute__((address(0x096)));

__asm("IOCA equ 096h");


extern volatile unsigned char IOC __attribute__((address(0x096)));

__asm("IOC equ 096h");


typedef union {
    struct {
        unsigned IOCA0 :1;
        unsigned IOCA1 :1;
        unsigned IOCA2 :1;
        unsigned IOCA3 :1;
        unsigned IOCA4 :1;
        unsigned IOCA5 :1;
    };
    struct {
        unsigned IOC0 :1;
        unsigned IOC1 :1;
        unsigned IOC2 :1;
        unsigned IOC3 :1;
        unsigned IOC4 :1;
        unsigned IOC5 :1;
    };
} IOCAbits_t;
extern volatile IOCAbits_t IOCAbits __attribute__((address(0x096)));
# 2211 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
typedef union {
    struct {
        unsigned IOCA0 :1;
        unsigned IOCA1 :1;
        unsigned IOCA2 :1;
        unsigned IOCA3 :1;
        unsigned IOCA4 :1;
        unsigned IOCA5 :1;
    };
    struct {
        unsigned IOC0 :1;
        unsigned IOC1 :1;
        unsigned IOC2 :1;
        unsigned IOC3 :1;
        unsigned IOC4 :1;
        unsigned IOC5 :1;
    };
} IOCbits_t;
extern volatile IOCbits_t IOCbits __attribute__((address(0x096)));
# 2294 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
extern volatile unsigned char WDTCON __attribute__((address(0x097)));

__asm("WDTCON equ 097h");


typedef union {
    struct {
        unsigned SWDTEN :1;
        unsigned WDTPS :4;
    };
    struct {
        unsigned :1;
        unsigned WDTPS0 :1;
        unsigned WDTPS1 :1;
        unsigned WDTPS2 :1;
        unsigned WDTPS3 :1;
    };
} WDTCONbits_t;
extern volatile WDTCONbits_t WDTCONbits __attribute__((address(0x097)));
# 2347 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
extern volatile unsigned char TXSTA __attribute__((address(0x098)));

__asm("TXSTA equ 098h");


typedef union {
    struct {
        unsigned TX9D :1;
        unsigned TRMT :1;
        unsigned BRGH :1;
        unsigned SENDB :1;
        unsigned SYNC :1;
        unsigned TXEN :1;
        unsigned TX9 :1;
        unsigned CSRC :1;
    };
    struct {
        unsigned :3;
        unsigned SENB :1;
    };
} TXSTAbits_t;
extern volatile TXSTAbits_t TXSTAbits __attribute__((address(0x098)));
# 2418 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
extern volatile unsigned char SPBRG __attribute__((address(0x099)));

__asm("SPBRG equ 099h");


typedef union {
    struct {
        unsigned BRG0 :1;
        unsigned BRG1 :1;
        unsigned BRG2 :1;
        unsigned BRG3 :1;
        unsigned BRG4 :1;
        unsigned BRG5 :1;
        unsigned BRG6 :1;
        unsigned BRG7 :1;
    };
} SPBRGbits_t;
extern volatile SPBRGbits_t SPBRGbits __attribute__((address(0x099)));
# 2480 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
extern volatile unsigned char SPBRGH __attribute__((address(0x09A)));

__asm("SPBRGH equ 09Ah");


typedef union {
    struct {
        unsigned BRG8 :1;
        unsigned BRG9 :1;
        unsigned BRG10 :1;
        unsigned BRG11 :1;
        unsigned BRG12 :1;
        unsigned BRG13 :1;
        unsigned BRG14 :1;
        unsigned BRG15 :1;
    };
} SPBRGHbits_t;
extern volatile SPBRGHbits_t SPBRGHbits __attribute__((address(0x09A)));
# 2542 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
extern volatile unsigned char BAUDCTL __attribute__((address(0x09B)));

__asm("BAUDCTL equ 09Bh");


typedef union {
    struct {
        unsigned ABDEN :1;
        unsigned WUE :1;
        unsigned :1;
        unsigned BRG16 :1;
        unsigned SCKP :1;
        unsigned :1;
        unsigned RCIDL :1;
        unsigned ABDOVF :1;
    };
} BAUDCTLbits_t;
extern volatile BAUDCTLbits_t BAUDCTLbits __attribute__((address(0x09B)));
# 2594 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
extern volatile unsigned char ADRESL __attribute__((address(0x09E)));

__asm("ADRESL equ 09Eh");




extern volatile unsigned char ADCON1 __attribute__((address(0x09F)));

__asm("ADCON1 equ 09Fh");


typedef union {
    struct {
        unsigned :4;
        unsigned ADCS :3;
    };
    struct {
        unsigned :4;
        unsigned ADCS0 :1;
        unsigned ADCS1 :1;
        unsigned ADCS2 :1;
    };
} ADCON1bits_t;
extern volatile ADCON1bits_t ADCON1bits __attribute__((address(0x09F)));
# 2643 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
extern volatile unsigned char EEDAT __attribute__((address(0x10C)));

__asm("EEDAT equ 010Ch");


extern volatile unsigned char EEDATA __attribute__((address(0x10C)));

__asm("EEDATA equ 010Ch");




extern volatile unsigned char EEADR __attribute__((address(0x10D)));

__asm("EEADR equ 010Dh");




extern volatile unsigned char EEDATH __attribute__((address(0x10E)));

__asm("EEDATH equ 010Eh");




extern volatile unsigned char EEADRH __attribute__((address(0x10F)));

__asm("EEADRH equ 010Fh");




extern volatile unsigned char WPUB __attribute__((address(0x115)));

__asm("WPUB equ 0115h");


typedef union {
    struct {
        unsigned :4;
        unsigned WPUB :4;
    };
    struct {
        unsigned :4;
        unsigned WPUB4 :1;
        unsigned WPUB5 :1;
        unsigned WPUB6 :1;
        unsigned WPUB7 :1;
    };
} WPUBbits_t;
extern volatile WPUBbits_t WPUBbits __attribute__((address(0x115)));
# 2724 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
extern volatile unsigned char IOCB __attribute__((address(0x116)));

__asm("IOCB equ 0116h");


typedef union {
    struct {
        unsigned :4;
        unsigned IOCB4 :1;
        unsigned IOCB5 :1;
        unsigned IOCB6 :1;
        unsigned IOCB7 :1;
    };
} IOCBbits_t;
extern volatile IOCBbits_t IOCBbits __attribute__((address(0x116)));
# 2763 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
extern volatile unsigned char VRCON __attribute__((address(0x118)));

__asm("VRCON equ 0118h");


typedef union {
    struct {
        unsigned VR :4;
        unsigned VP6EN :1;
        unsigned VRR :1;
        unsigned C2VREN :1;
        unsigned C1VREN :1;
    };
    struct {
        unsigned VR0 :1;
        unsigned VR1 :1;
        unsigned VR2 :1;
        unsigned VR3 :1;
    };
} VRCONbits_t;
extern volatile VRCONbits_t VRCONbits __attribute__((address(0x118)));
# 2833 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
extern volatile unsigned char CM1CON0 __attribute__((address(0x119)));

__asm("CM1CON0 equ 0119h");


typedef union {
    struct {
        unsigned C1CH :2;
        unsigned C1R :1;
        unsigned :1;
        unsigned C1POL :1;
        unsigned C1OE :1;
        unsigned C1OUT :1;
        unsigned C1ON :1;
    };
    struct {
        unsigned C1CH0 :1;
        unsigned C1CH1 :1;
    };
} CM1CON0bits_t;
extern volatile CM1CON0bits_t CM1CON0bits __attribute__((address(0x119)));
# 2898 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
extern volatile unsigned char CM2CON0 __attribute__((address(0x11A)));

__asm("CM2CON0 equ 011Ah");


typedef union {
    struct {
        unsigned C2CH :2;
        unsigned C2R :1;
        unsigned :1;
        unsigned C2POL :1;
        unsigned C2OE :1;
        unsigned C2OUT :1;
        unsigned C2ON :1;
    };
    struct {
        unsigned C2CH0 :1;
        unsigned C2CH1 :1;
    };
} CM2CON0bits_t;
extern volatile CM2CON0bits_t CM2CON0bits __attribute__((address(0x11A)));
# 2963 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
extern volatile unsigned char CM2CON1 __attribute__((address(0x11B)));

__asm("CM2CON1 equ 011Bh");


typedef union {
    struct {
        unsigned C2SYNC :1;
        unsigned T1GSS :1;
        unsigned :4;
        unsigned MC2OUT :1;
        unsigned MC1OUT :1;
    };
} CM2CON1bits_t;
extern volatile CM2CON1bits_t CM2CON1bits __attribute__((address(0x11B)));
# 3002 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
extern volatile unsigned char ANSEL __attribute__((address(0x11E)));

__asm("ANSEL equ 011Eh");


typedef union {
    struct {
        unsigned ANS0 :1;
        unsigned ANS1 :1;
        unsigned ANS2 :1;
        unsigned ANS3 :1;
        unsigned ANS4 :1;
        unsigned ANS5 :1;
        unsigned ANS6 :1;
        unsigned ANS7 :1;
    };
} ANSELbits_t;
extern volatile ANSELbits_t ANSELbits __attribute__((address(0x11E)));
# 3064 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
extern volatile unsigned char ANSELH __attribute__((address(0x11F)));

__asm("ANSELH equ 011Fh");


typedef union {
    struct {
        unsigned ANS8 :1;
        unsigned ANS9 :1;
        unsigned ANS10 :1;
        unsigned ANS11 :1;
    };
} ANSELHbits_t;
extern volatile ANSELHbits_t ANSELHbits __attribute__((address(0x11F)));
# 3102 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
extern volatile unsigned char EECON1 __attribute__((address(0x18C)));

__asm("EECON1 equ 018Ch");


typedef union {
    struct {
        unsigned RD :1;
        unsigned WR :1;
        unsigned WREN :1;
        unsigned WRERR :1;
        unsigned :3;
        unsigned EEPGD :1;
    };
} EECON1bits_t;
extern volatile EECON1bits_t EECON1bits __attribute__((address(0x18C)));
# 3147 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
extern volatile unsigned char EECON2 __attribute__((address(0x18D)));

__asm("EECON2 equ 018Dh");




extern volatile unsigned char PSTRCON __attribute__((address(0x19D)));

__asm("PSTRCON equ 019Dh");


typedef union {
    struct {
        unsigned STRA :1;
        unsigned STRB :1;
        unsigned STRC :1;
        unsigned STRD :1;
        unsigned STRSYNC :1;
    };
} PSTRCONbits_t;
extern volatile PSTRCONbits_t PSTRCONbits __attribute__((address(0x19D)));
# 3198 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
extern volatile unsigned char SRCON __attribute__((address(0x19E)));

__asm("SRCON equ 019Eh");


typedef union {
    struct {
        unsigned :2;
        unsigned PULSR :1;
        unsigned PULSS :1;
        unsigned C2REN :1;
        unsigned C1SEN :1;
        unsigned SR :2;
    };
    struct {
        unsigned :6;
        unsigned SR0 :1;
        unsigned SR1 :1;
    };
} SRCONbits_t;
extern volatile SRCONbits_t SRCONbits __attribute__((address(0x19E)));
# 3264 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\proc\\pic16f690.h" 3
extern volatile __bit ABDEN __attribute__((address(0x4D8)));


extern volatile __bit ABDOVF __attribute__((address(0x4DF)));


extern volatile __bit ADCS0 __attribute__((address(0x4FC)));


extern volatile __bit ADCS1 __attribute__((address(0x4FD)));


extern volatile __bit ADCS2 __attribute__((address(0x4FE)));


extern volatile __bit ADDEN __attribute__((address(0xC3)));


extern volatile __bit ADFM __attribute__((address(0xFF)));


extern volatile __bit ADIE __attribute__((address(0x466)));


extern volatile __bit ADIF __attribute__((address(0x66)));


extern volatile __bit ADON __attribute__((address(0xF8)));


extern volatile __bit ANS0 __attribute__((address(0x8F0)));


extern volatile __bit ANS1 __attribute__((address(0x8F1)));


extern volatile __bit ANS10 __attribute__((address(0x8FA)));


extern volatile __bit ANS11 __attribute__((address(0x8FB)));


extern volatile __bit ANS2 __attribute__((address(0x8F2)));


extern volatile __bit ANS3 __attribute__((address(0x8F3)));


extern volatile __bit ANS4 __attribute__((address(0x8F4)));


extern volatile __bit ANS5 __attribute__((address(0x8F5)));


extern volatile __bit ANS6 __attribute__((address(0x8F6)));


extern volatile __bit ANS7 __attribute__((address(0x8F7)));


extern volatile __bit ANS8 __attribute__((address(0x8F8)));


extern volatile __bit ANS9 __attribute__((address(0x8F9)));


extern volatile __bit BF __attribute__((address(0x4A0)));


extern volatile __bit BRG0 __attribute__((address(0x4C8)));


extern volatile __bit BRG1 __attribute__((address(0x4C9)));


extern volatile __bit BRG10 __attribute__((address(0x4D2)));


extern volatile __bit BRG11 __attribute__((address(0x4D3)));


extern volatile __bit BRG12 __attribute__((address(0x4D4)));


extern volatile __bit BRG13 __attribute__((address(0x4D5)));


extern volatile __bit BRG14 __attribute__((address(0x4D6)));


extern volatile __bit BRG15 __attribute__((address(0x4D7)));


extern volatile __bit BRG16 __attribute__((address(0x4DB)));


extern volatile __bit BRG2 __attribute__((address(0x4CA)));


extern volatile __bit BRG3 __attribute__((address(0x4CB)));


extern volatile __bit BRG4 __attribute__((address(0x4CC)));


extern volatile __bit BRG5 __attribute__((address(0x4CD)));


extern volatile __bit BRG6 __attribute__((address(0x4CE)));


extern volatile __bit BRG7 __attribute__((address(0x4CF)));


extern volatile __bit BRG8 __attribute__((address(0x4D0)));


extern volatile __bit BRG9 __attribute__((address(0x4D1)));


extern volatile __bit BRGH __attribute__((address(0x4C2)));


extern volatile __bit C1CH0 __attribute__((address(0x8C8)));


extern volatile __bit C1CH1 __attribute__((address(0x8C9)));


extern volatile __bit C1IE __attribute__((address(0x46D)));


extern volatile __bit C1IF __attribute__((address(0x6D)));


extern volatile __bit C1OE __attribute__((address(0x8CD)));


extern volatile __bit C1ON __attribute__((address(0x8CF)));


extern volatile __bit C1OUT __attribute__((address(0x8CE)));


extern volatile __bit C1POL __attribute__((address(0x8CC)));


extern volatile __bit C1R __attribute__((address(0x8CA)));


extern volatile __bit C1SEN __attribute__((address(0xCF5)));


extern volatile __bit C1VREN __attribute__((address(0x8C7)));


extern volatile __bit C2CH0 __attribute__((address(0x8D0)));


extern volatile __bit C2CH1 __attribute__((address(0x8D1)));


extern volatile __bit C2IE __attribute__((address(0x46E)));


extern volatile __bit C2IF __attribute__((address(0x6E)));


extern volatile __bit C2OE __attribute__((address(0x8D5)));


extern volatile __bit C2ON __attribute__((address(0x8D7)));


extern volatile __bit C2OUT __attribute__((address(0x8D6)));


extern volatile __bit C2POL __attribute__((address(0x8D4)));


extern volatile __bit C2R __attribute__((address(0x8D2)));


extern volatile __bit C2REN __attribute__((address(0xCF4)));


extern volatile __bit C2SYNC __attribute__((address(0x8D8)));


extern volatile __bit C2VREN __attribute__((address(0x8C6)));


extern volatile __bit CARRY __attribute__((address(0x18)));


extern volatile __bit CCP1IE __attribute__((address(0x462)));


extern volatile __bit CCP1IF __attribute__((address(0x62)));


extern volatile __bit CCP1M0 __attribute__((address(0xB8)));


extern volatile __bit CCP1M1 __attribute__((address(0xB9)));


extern volatile __bit CCP1M2 __attribute__((address(0xBA)));


extern volatile __bit CCP1M3 __attribute__((address(0xBB)));


extern volatile __bit CHS0 __attribute__((address(0xFA)));


extern volatile __bit CHS1 __attribute__((address(0xFB)));


extern volatile __bit CHS2 __attribute__((address(0xFC)));


extern volatile __bit CHS3 __attribute__((address(0xFD)));


extern volatile __bit CKE __attribute__((address(0x4A6)));


extern volatile __bit CKP __attribute__((address(0xA4)));


extern volatile __bit CREN __attribute__((address(0xC4)));


extern volatile __bit CSRC __attribute__((address(0x4C7)));


extern volatile __bit DATA_ADDRESS __attribute__((address(0x4A5)));


extern volatile __bit DC __attribute__((address(0x19)));


extern volatile __bit DC1B0 __attribute__((address(0xBC)));


extern volatile __bit DC1B1 __attribute__((address(0xBD)));


extern volatile __bit D_A __attribute__((address(0x4A5)));


extern volatile __bit D_nA __attribute__((address(0x4A5)));


extern volatile __bit ECCPAS0 __attribute__((address(0xEC)));


extern volatile __bit ECCPAS1 __attribute__((address(0xED)));


extern volatile __bit ECCPAS2 __attribute__((address(0xEE)));


extern volatile __bit ECCPASE __attribute__((address(0xEF)));


extern volatile __bit EEIE __attribute__((address(0x46C)));


extern volatile __bit EEIF __attribute__((address(0x6C)));


extern volatile __bit EEPGD __attribute__((address(0xC67)));


extern volatile __bit FERR __attribute__((address(0xC2)));


extern volatile __bit GIE __attribute__((address(0x5F)));


extern volatile __bit GO __attribute__((address(0xF9)));


extern volatile __bit GO_DONE __attribute__((address(0xF9)));


extern volatile __bit GO_nDONE __attribute__((address(0xF9)));


extern volatile __bit HTS __attribute__((address(0x47A)));


extern volatile __bit I2C_DATA __attribute__((address(0x4A5)));


extern volatile __bit I2C_READ __attribute__((address(0x4A2)));


extern volatile __bit I2C_START __attribute__((address(0x4A3)));


extern volatile __bit I2C_STOP __attribute__((address(0x4A4)));


extern volatile __bit INTE __attribute__((address(0x5C)));


extern volatile __bit INTEDG __attribute__((address(0x40E)));


extern volatile __bit INTF __attribute__((address(0x59)));


extern volatile __bit IOC0 __attribute__((address(0x4B0)));


extern volatile __bit IOC1 __attribute__((address(0x4B1)));


extern volatile __bit IOC2 __attribute__((address(0x4B2)));


extern volatile __bit IOC3 __attribute__((address(0x4B3)));


extern volatile __bit IOC4 __attribute__((address(0x4B4)));


extern volatile __bit IOC5 __attribute__((address(0x4B5)));


extern volatile __bit IOCA0 __attribute__((address(0x4B0)));


extern volatile __bit IOCA1 __attribute__((address(0x4B1)));


extern volatile __bit IOCA2 __attribute__((address(0x4B2)));


extern volatile __bit IOCA3 __attribute__((address(0x4B3)));


extern volatile __bit IOCA4 __attribute__((address(0x4B4)));


extern volatile __bit IOCA5 __attribute__((address(0x4B5)));


extern volatile __bit IOCB4 __attribute__((address(0x8B4)));


extern volatile __bit IOCB5 __attribute__((address(0x8B5)));


extern volatile __bit IOCB6 __attribute__((address(0x8B6)));


extern volatile __bit IOCB7 __attribute__((address(0x8B7)));


extern volatile __bit IRCF0 __attribute__((address(0x47C)));


extern volatile __bit IRCF1 __attribute__((address(0x47D)));


extern volatile __bit IRCF2 __attribute__((address(0x47E)));


extern volatile __bit IRP __attribute__((address(0x1F)));


extern volatile __bit LTS __attribute__((address(0x479)));


extern volatile __bit MC1OUT __attribute__((address(0x8DF)));


extern volatile __bit MC2OUT __attribute__((address(0x8DE)));


extern volatile __bit MSK0 __attribute__((address(0x498)));


extern volatile __bit MSK1 __attribute__((address(0x499)));


extern volatile __bit MSK2 __attribute__((address(0x49A)));


extern volatile __bit MSK3 __attribute__((address(0x49B)));


extern volatile __bit MSK4 __attribute__((address(0x49C)));


extern volatile __bit MSK5 __attribute__((address(0x49D)));


extern volatile __bit MSK6 __attribute__((address(0x49E)));


extern volatile __bit MSK7 __attribute__((address(0x49F)));


extern volatile __bit OERR __attribute__((address(0xC1)));


extern volatile __bit OSFIE __attribute__((address(0x46F)));


extern volatile __bit OSFIF __attribute__((address(0x6F)));


extern volatile __bit OSTS __attribute__((address(0x47B)));


extern volatile __bit P1M0 __attribute__((address(0xBE)));


extern volatile __bit P1M1 __attribute__((address(0xBF)));


extern volatile __bit PDC0 __attribute__((address(0xE0)));


extern volatile __bit PDC1 __attribute__((address(0xE1)));


extern volatile __bit PDC2 __attribute__((address(0xE2)));


extern volatile __bit PDC3 __attribute__((address(0xE3)));


extern volatile __bit PDC4 __attribute__((address(0xE4)));


extern volatile __bit PDC5 __attribute__((address(0xE5)));


extern volatile __bit PDC6 __attribute__((address(0xE6)));


extern volatile __bit PEIE __attribute__((address(0x5E)));


extern volatile __bit PRSEN __attribute__((address(0xE7)));


extern volatile __bit PS0 __attribute__((address(0x408)));


extern volatile __bit PS1 __attribute__((address(0x409)));


extern volatile __bit PS2 __attribute__((address(0x40A)));


extern volatile __bit PSA __attribute__((address(0x40B)));


extern volatile __bit PSSAC0 __attribute__((address(0xEA)));


extern volatile __bit PSSAC1 __attribute__((address(0xEB)));


extern volatile __bit PSSBD0 __attribute__((address(0xE8)));


extern volatile __bit PSSBD1 __attribute__((address(0xE9)));


extern volatile __bit PULSR __attribute__((address(0xCF2)));


extern volatile __bit PULSS __attribute__((address(0xCF3)));


extern volatile __bit RA0 __attribute__((address(0x28)));


extern volatile __bit RA1 __attribute__((address(0x29)));


extern volatile __bit RA2 __attribute__((address(0x2A)));


extern volatile __bit RA3 __attribute__((address(0x2B)));


extern volatile __bit RA4 __attribute__((address(0x2C)));


extern volatile __bit RA5 __attribute__((address(0x2D)));


extern volatile __bit RABIE __attribute__((address(0x5B)));


extern volatile __bit RABIF __attribute__((address(0x58)));


extern volatile __bit RB4 __attribute__((address(0x34)));


extern volatile __bit RB5 __attribute__((address(0x35)));


extern volatile __bit RB6 __attribute__((address(0x36)));


extern volatile __bit RB7 __attribute__((address(0x37)));


extern volatile __bit RC0 __attribute__((address(0x38)));


extern volatile __bit RC1 __attribute__((address(0x39)));


extern volatile __bit RC2 __attribute__((address(0x3A)));


extern volatile __bit RC3 __attribute__((address(0x3B)));


extern volatile __bit RC4 __attribute__((address(0x3C)));


extern volatile __bit RC5 __attribute__((address(0x3D)));


extern volatile __bit RC6 __attribute__((address(0x3E)));


extern volatile __bit RC7 __attribute__((address(0x3F)));


extern volatile __bit RCIDL __attribute__((address(0x4DE)));


extern volatile __bit RCIE __attribute__((address(0x465)));


extern volatile __bit RCIF __attribute__((address(0x65)));


extern volatile __bit RD __attribute__((address(0xC60)));


extern volatile __bit READ_WRITE __attribute__((address(0x4A2)));


extern volatile __bit RP0 __attribute__((address(0x1D)));


extern volatile __bit RP1 __attribute__((address(0x1E)));


extern volatile __bit RX9 __attribute__((address(0xC6)));


extern volatile __bit RX9D __attribute__((address(0xC0)));


extern volatile __bit R_W __attribute__((address(0x4A2)));


extern volatile __bit R_nW __attribute__((address(0x4A2)));


extern volatile __bit SBOREN __attribute__((address(0x474)));


extern volatile __bit SCKP __attribute__((address(0x4DC)));


extern volatile __bit SCS __attribute__((address(0x478)));


extern volatile __bit SENB __attribute__((address(0x4C3)));


extern volatile __bit SENDB __attribute__((address(0x4C3)));


extern volatile __bit SMP __attribute__((address(0x4A7)));


extern volatile __bit SPEN __attribute__((address(0xC7)));


extern volatile __bit SR0 __attribute__((address(0xCF6)));


extern volatile __bit SR1 __attribute__((address(0xCF7)));


extern volatile __bit SREN __attribute__((address(0xC5)));


extern volatile __bit SSPEN __attribute__((address(0xA5)));


extern volatile __bit SSPIE __attribute__((address(0x463)));


extern volatile __bit SSPIF __attribute__((address(0x63)));


extern volatile __bit SSPM0 __attribute__((address(0xA0)));


extern volatile __bit SSPM1 __attribute__((address(0xA1)));


extern volatile __bit SSPM2 __attribute__((address(0xA2)));


extern volatile __bit SSPM3 __attribute__((address(0xA3)));


extern volatile __bit SSPOV __attribute__((address(0xA6)));


extern volatile __bit STRA __attribute__((address(0xCE8)));


extern volatile __bit STRB __attribute__((address(0xCE9)));


extern volatile __bit STRC __attribute__((address(0xCEA)));


extern volatile __bit STRD __attribute__((address(0xCEB)));


extern volatile __bit STRSYNC __attribute__((address(0xCEC)));


extern volatile __bit SWDTEN __attribute__((address(0x4B8)));


extern volatile __bit SYNC __attribute__((address(0x4C4)));


extern volatile __bit T0CS __attribute__((address(0x40D)));


extern volatile __bit T0IE __attribute__((address(0x5D)));


extern volatile __bit T0IF __attribute__((address(0x5A)));


extern volatile __bit T0SE __attribute__((address(0x40C)));


extern volatile __bit T1CKPS0 __attribute__((address(0x84)));


extern volatile __bit T1CKPS1 __attribute__((address(0x85)));


extern volatile __bit T1GINV __attribute__((address(0x87)));


extern volatile __bit T1GSS __attribute__((address(0x8D9)));


extern volatile __bit T1IE __attribute__((address(0x460)));


extern volatile __bit T1IF __attribute__((address(0x60)));


extern volatile __bit T1OSCEN __attribute__((address(0x83)));


extern volatile __bit T2CKPS0 __attribute__((address(0x90)));


extern volatile __bit T2CKPS1 __attribute__((address(0x91)));


extern volatile __bit T2IE __attribute__((address(0x461)));


extern volatile __bit T2IF __attribute__((address(0x61)));


extern volatile __bit TMR1CS __attribute__((address(0x81)));


extern volatile __bit TMR1GE __attribute__((address(0x86)));


extern volatile __bit TMR1IE __attribute__((address(0x460)));


extern volatile __bit TMR1IF __attribute__((address(0x60)));


extern volatile __bit TMR1ON __attribute__((address(0x80)));


extern volatile __bit TMR2IE __attribute__((address(0x461)));


extern volatile __bit TMR2IF __attribute__((address(0x61)));


extern volatile __bit TMR2ON __attribute__((address(0x92)));


extern volatile __bit TOUTPS0 __attribute__((address(0x93)));


extern volatile __bit TOUTPS1 __attribute__((address(0x94)));


extern volatile __bit TOUTPS2 __attribute__((address(0x95)));


extern volatile __bit TOUTPS3 __attribute__((address(0x96)));


extern volatile __bit TRISA0 __attribute__((address(0x428)));


extern volatile __bit TRISA1 __attribute__((address(0x429)));


extern volatile __bit TRISA2 __attribute__((address(0x42A)));


extern volatile __bit TRISA3 __attribute__((address(0x42B)));


extern volatile __bit TRISA4 __attribute__((address(0x42C)));


extern volatile __bit TRISA5 __attribute__((address(0x42D)));


extern volatile __bit TRISB4 __attribute__((address(0x434)));


extern volatile __bit TRISB5 __attribute__((address(0x435)));


extern volatile __bit TRISB6 __attribute__((address(0x436)));


extern volatile __bit TRISB7 __attribute__((address(0x437)));


extern volatile __bit TRISC0 __attribute__((address(0x438)));


extern volatile __bit TRISC1 __attribute__((address(0x439)));


extern volatile __bit TRISC2 __attribute__((address(0x43A)));


extern volatile __bit TRISC3 __attribute__((address(0x43B)));


extern volatile __bit TRISC4 __attribute__((address(0x43C)));


extern volatile __bit TRISC5 __attribute__((address(0x43D)));


extern volatile __bit TRISC6 __attribute__((address(0x43E)));


extern volatile __bit TRISC7 __attribute__((address(0x43F)));


extern volatile __bit TRMT __attribute__((address(0x4C1)));


extern volatile __bit TUN0 __attribute__((address(0x480)));


extern volatile __bit TUN1 __attribute__((address(0x481)));


extern volatile __bit TUN2 __attribute__((address(0x482)));


extern volatile __bit TUN3 __attribute__((address(0x483)));


extern volatile __bit TUN4 __attribute__((address(0x484)));


extern volatile __bit TX9 __attribute__((address(0x4C6)));


extern volatile __bit TX9D __attribute__((address(0x4C0)));


extern volatile __bit TXEN __attribute__((address(0x4C5)));


extern volatile __bit TXIE __attribute__((address(0x464)));


extern volatile __bit TXIF __attribute__((address(0x64)));


extern volatile __bit UA __attribute__((address(0x4A1)));


extern volatile __bit ULPWUE __attribute__((address(0x475)));


extern volatile __bit VCFG __attribute__((address(0xFE)));


extern volatile __bit VP6EN __attribute__((address(0x8C4)));


extern volatile __bit VR0 __attribute__((address(0x8C0)));


extern volatile __bit VR1 __attribute__((address(0x8C1)));


extern volatile __bit VR2 __attribute__((address(0x8C2)));


extern volatile __bit VR3 __attribute__((address(0x8C3)));


extern volatile __bit VRR __attribute__((address(0x8C5)));


extern volatile __bit WCOL __attribute__((address(0xA7)));


extern volatile __bit WDTPS0 __attribute__((address(0x4B9)));


extern volatile __bit WDTPS1 __attribute__((address(0x4BA)));


extern volatile __bit WDTPS2 __attribute__((address(0x4BB)));


extern volatile __bit WDTPS3 __attribute__((address(0x4BC)));


extern volatile __bit WPU0 __attribute__((address(0x4A8)));


extern volatile __bit WPU1 __attribute__((address(0x4A9)));


extern volatile __bit WPU2 __attribute__((address(0x4AA)));


extern volatile __bit WPU4 __attribute__((address(0x4AC)));


extern volatile __bit WPU5 __attribute__((address(0x4AD)));


extern volatile __bit WPUA0 __attribute__((address(0x4A8)));


extern volatile __bit WPUA1 __attribute__((address(0x4A9)));


extern volatile __bit WPUA2 __attribute__((address(0x4AA)));


extern volatile __bit WPUA4 __attribute__((address(0x4AC)));


extern volatile __bit WPUA5 __attribute__((address(0x4AD)));


extern volatile __bit WPUB4 __attribute__((address(0x8AC)));


extern volatile __bit WPUB5 __attribute__((address(0x8AD)));


extern volatile __bit WPUB6 __attribute__((address(0x8AE)));


extern volatile __bit WPUB7 __attribute__((address(0x8AF)));


extern volatile __bit WR __attribute__((address(0xC61)));


extern volatile __bit WREN __attribute__((address(0xC62)));


extern volatile __bit WRERR __attribute__((address(0xC63)));


extern volatile __bit WUE __attribute__((address(0x4D9)));


extern volatile __bit ZERO __attribute__((address(0x1A)));


extern volatile __bit nA __attribute__((address(0x4A5)));


extern volatile __bit nADDRESS __attribute__((address(0x4A5)));


extern volatile __bit nBOR __attribute__((address(0x470)));


extern volatile __bit nDONE __attribute__((address(0xF9)));


extern volatile __bit nPD __attribute__((address(0x1B)));


extern volatile __bit nPOR __attribute__((address(0x471)));


extern volatile __bit nRABPU __attribute__((address(0x40F)));


extern volatile __bit nT1SYNC __attribute__((address(0x82)));


extern volatile __bit nTO __attribute__((address(0x1C)));


extern volatile __bit nW __attribute__((address(0x4A2)));


extern volatile __bit nWRITE __attribute__((address(0x4A2)));
# 294 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\pic_chip_select.h" 2 3
# 14 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\pic.h" 2 3
# 30 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\pic.h" 3
#pragma intrinsic(__nop)
extern void __nop(void);
# 78 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\pic.h" 3
__attribute__((__unsupported__("The " "FLASH_READ" " macro function is no longer supported. Please use the MPLAB X MCC."))) unsigned char __flash_read(unsigned short addr);

__attribute__((__unsupported__("The " "FLASH_WRITE" " macro function is no longer supported. Please use the MPLAB X MCC."))) void __flash_write(unsigned short addr, unsigned short data);

__attribute__((__unsupported__("The " "FLASH_ERASE" " macro function is no longer supported. Please use the MPLAB X MCC."))) void __flash_erase(unsigned short addr);



# 1 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\eeprom_routines.h" 1 3
# 114 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\eeprom_routines.h" 3
extern void eeprom_write(unsigned char addr, unsigned char value);
extern unsigned char eeprom_read(unsigned char addr);
# 86 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\pic.h" 2 3





#pragma intrinsic(_delay)
extern __attribute__((nonreentrant)) void _delay(unsigned long);
#pragma intrinsic(_delaywdt)
extern __attribute__((nonreentrant)) void _delaywdt(unsigned long);
# 137 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\pic.h" 3
extern __bank0 unsigned char __resetbits;
extern __bank0 __bit __powerdown;
extern __bank0 __bit __timeout;
# 28 "C:/Users/paul nonadmin/.mchp_packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\xc.h" 2 3
# 1 "C:\\Program Files\\Microchip\\xc8\\v2.36\\pic\\sources\\c90\\pic\\__eeprom.c" 2




void
__eecpymem(volatile unsigned char *to, __eeprom unsigned char * from, unsigned char size)
{
 volatile unsigned char *cp = to;

 while (EECON1bits.WR) continue;
 EEADR = (unsigned char)from;
 while(size--) {
  while (EECON1bits.WR) continue;

  EECON1 &= 0x7F;

  EECON1bits.RD = 1;
  *cp++ = EEDATA;
  ++EEADR;
 }
# 36 "C:\\Program Files\\Microchip\\xc8\\v2.36\\pic\\sources\\c90\\pic\\__eeprom.c"
}

void
__memcpyee(__eeprom unsigned char * to, const unsigned char *from, unsigned char size)
{
 const unsigned char *ptr =from;

 while (EECON1bits.WR) continue;
 EEADR = (unsigned char)to - 1U;

 EECON1 &= 0x7F;

 while(size--) {
  while (EECON1bits.WR) {
   continue;
  }
  EEDATA = *ptr++;
  ++EEADR;
  STATUSbits.CARRY = 0;
  if (INTCONbits.GIE) {
   STATUSbits.CARRY = 1;
  }
  INTCONbits.GIE = 0;
  EECON1bits.WREN = 1;
  EECON2 = 0x55;
  EECON2 = 0xAA;
  EECON1bits.WR = 1;
  EECON1bits.WREN = 0;
  if (STATUSbits.CARRY) {
   INTCONbits.GIE = 1;
  }
 }
# 101 "C:\\Program Files\\Microchip\\xc8\\v2.36\\pic\\sources\\c90\\pic\\__eeprom.c"
}

unsigned char
__eetoc(__eeprom void *addr)
{
 unsigned char data;
 __eecpymem((unsigned char *) &data,addr,1);
 return data;
}

unsigned int
__eetoi(__eeprom void *addr)
{
 unsigned int data;
 __eecpymem((unsigned char *) &data,addr,2);
 return data;
}

#pragma warning push
#pragma warning disable 2040
__uint24
__eetom(__eeprom void *addr)
{
 __uint24 data;
 __eecpymem((unsigned char *) &data,addr,3);
 return data;
}
#pragma warning pop

unsigned long
__eetol(__eeprom void *addr)
{
 unsigned long data;
 __eecpymem((unsigned char *) &data,addr,4);
 return data;
}

#pragma warning push
#pragma warning disable 1516
unsigned long long
__eetoo(__eeprom void *addr)
{
 unsigned long long data;
 __eecpymem((unsigned char *) &data,addr,8);
 return data;
}
#pragma warning pop

unsigned char
__ctoee(__eeprom void *addr, unsigned char data)
{
 __memcpyee(addr,(unsigned char *) &data,1);
 return data;
}

unsigned int
__itoee(__eeprom void *addr, unsigned int data)
{
 __memcpyee(addr,(unsigned char *) &data,2);
 return data;
}

#pragma warning push
#pragma warning disable 2040
__uint24
__mtoee(__eeprom void *addr, __uint24 data)
{
 __memcpyee(addr,(unsigned char *) &data,3);
 return data;
}
#pragma warning pop

unsigned long
__ltoee(__eeprom void *addr, unsigned long data)
{
 __memcpyee(addr,(unsigned char *) &data,4);
 return data;
}

#pragma warning push
#pragma warning disable 1516
unsigned long long
__otoee(__eeprom void *addr, unsigned long long data)
{
 __memcpyee(addr,(unsigned char *) &data,8);
 return data;
}
#pragma warning pop

float
__eetoft(__eeprom void *addr)
{
 float data;
 __eecpymem((unsigned char *) &data,addr,3);
 return data;
}

double
__eetofl(__eeprom void *addr)
{
 double data;
 __eecpymem((unsigned char *) &data,addr,4);
 return data;
}

float
__fttoee(__eeprom void *addr, float data)
{
 __memcpyee(addr,(unsigned char *) &data,3);
 return data;
}

double
__fltoee(__eeprom void *addr, double data)
{
 __memcpyee(addr,(unsigned char *) &data,4);
 return data;
}
