//
//  Controller.h
//  SoundcraftRM100
//
//  Created by Thomas O'Harriedge on 20.12.16.
//  Copyright © 2016 Thomas O'Harriedge. All rights reserved.
//

#ifndef Controller_h
#define Controller_h


#endif /* Controller_h */

#import <Cocoa/Cocoa.h>
#import <readThread.h>
#import <stateThread.h>

@interface Controller : NSObject
{
    IBOutlet NSPopUpButton *baudrateIL;
    IBOutlet NSButton *breakBT;
    IBOutlet NSButton *carrierDetectBT;
    IBOutlet NSButton *clearToSendBT;
    IBOutlet NSButton *closeBT;
    IBOutlet NSPopUpButton *databitsIL;
    IBOutlet NSButton *dataSetReadyBT;
    IBOutlet NSButton *dataTerminalReadyBT;
    IBOutlet NSTextField *deviceTF;
    IBOutlet NSButton *handshakeHardwareBT;
    IBOutlet NSButton *handshakeSoftwareBT;
    IBOutlet NSButton *openBT;
    IBOutlet NSPopUpButton *parityIL;
    IBOutlet NSTextView *receiveTV;
    IBOutlet NSButton *requestToSendBT;
    IBOutlet NSButton *ringIndicatorBT;
    IBOutlet NSButton *rxActiveBT;
    IBOutlet NSPopUpButton *stopbitsIL;
    IBOutlet NSTextView *transmitTV;
    IBOutlet NSButton *txActiveBT;
    
    UInt32 baudrate;
    UInt32 databits;
    UInt32 stopbits;
    UInt32 parity;
    UInt32 portFlags;
    UInt32 handshakeSoft;
    UInt32 handshakeHard;
    BOOL deviceOpened;
    NSString * port;
    int fileDescriptor;
    unsigned committedLength;
    struct termios oldtio,newtio,oldstdtio,newstdtio;
    
    stateThread *portState;
    readThread *portRead;
    
    
}

- (void)readPortSettings;
- (void)openTTY;
- (void)closeTTY;

- (int)fileDescriptor;

//- (void)handlePortMessage:(NSPortMessage *)portMessage;
- (void)setServer:(id)anObject;


- (IBAction)setbreak:(id)sender;
- (IBAction)closeDevice:(id)sender;
- (IBAction)dataTerminalReady:(id)sender;
- (IBAction)hardwareHandshake:(id)sender;
- (IBAction)openDevice:(id)sender;
- (IBAction)requestToSend:(id)sender;
- (IBAction)rxActive:(id)sender;
- (IBAction)setBaud:(id)sender;
- (IBAction)setDataBits:(id)sender;
- (IBAction)setParity:(id)sender;
- (IBAction)setStopBits:(id)sender;
- (IBAction)softwareHandshake:(id)sender;
- (IBAction)transmit:(id)sender;
- (IBAction)txActive:(id)sender;
@end
