//
//  Controller.m
//  SoundcraftRM100
//
//  Created by Thomas O'Harriedge on 20.12.16.
//  Copyright © 2016 Thomas O'Harriedge. All rights reserved.
//




#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <errno.h>
#include <paths.h>
#include <termios.h>
#include <sysexits.h>
#include <sys/param.h>
#include <sys/select.h>
//
//  Controller.h
//  SerialMonitor
//
//  Created by Jeroen Arnoldus on 15-4-06.
//  Copyright 2006 BJA Electronics. All rights reserved.
//

#include <sys/time.h>
#include <time.h>

#include <CoreFoundation/CoreFoundation.h>
#include <IOKit/IOKitLib.h>
#include <IOKit/serial/IOSerialKeys.h>
#include <IOKit/IOBSD.h>

#import "Controller.h"

@implementation Controller

- (id)init {
    
    deviceOpened = false;
    port = @"/dev/cu.PL2303-351";
    return self;
}

- (void)openTTY{
    if ( !deviceOpened) {
        portFlags = 0;
        if ( ([txActiveBT state] == NSOnState) && ([rxActiveBT state] == NSOnState) ) {
            portFlags |= O_RDWR;
        } else
            if ( ([txActiveBT state] == NSOnState) && !([rxActiveBT state] == NSOnState) ) {
                portFlags |= O_WRONLY;
            } else
                if ( !([txActiveBT state] == NSOnState) && ([rxActiveBT state] == NSOnState) ) {
                    portFlags |= O_RDONLY;
                } else {
                    [baudrateIL selectItemAtIndex:0];
                    NSAlert *alert = [[NSAlert alloc] init];
                    [alert addButtonWithTitle:@"OK"];
                    [alert setMessageText:@"Opening the device neither for reading nor writing doesn't seem to make much sense ;-)"];
                    [alert setInformativeText:@""];
                    [alert setAlertStyle:NSCriticalAlertStyle];
                    if ([alert runModal] == NSAlertFirstButtonReturn) { }
                   
                }
        fileDescriptor = open([port cStringUsingEncoding:NSUTF8StringEncoding], (portFlags | O_NOCTTY));
        if (fileDescriptor < 0) goto failed;
        
        tcgetattr(fileDescriptor,&oldtio); /* save current modem settings */
        
        newtio.c_cflag = 0;newtio.c_iflag=0;
        cfmakeraw(&newtio);
        /*
         Don't echo characters because if you connect to a host it or your
         modem will echo characters for you. Don't generate signals.
         */
        newtio.c_lflag = 0;
        newtio.c_oflag=0;
        /*
         Ignore bytes with parity errors and make terminal raw and dumb.
         */
        newtio.c_iflag = IGNBRK | handshakeSoft;
        /* blocking read until 1 char arrives */
        newtio.c_cc[VMIN]=1;
        newtio.c_cc[VTIME]=0;
        cfsetspeed( &newtio,baudrate);
        NSLog(@"Device Open newtio.c_cflag: %p", newtio.c_cflag);
        
        newtio.c_cflag = (newtio.c_cflag & ~CSIZE) | databits | parity | stopbits
        | handshakeHard | CLOCAL | CREAD;
        
        
        tcflush(fileDescriptor, TCIFLUSH);
        if ( tcsetattr(fileDescriptor,TCSANOW,&newtio) ) {
            close(fileDescriptor);
            goto failed;
        }
        tcgetattr(fileDescriptor,&newtio); /* save current modem settings */
        //	ioctl(fileDescriptor, TIOCSDTR, 0);
        
        deviceOpened = true;
        NSLog(@"Device Open");
        [portState setFileDescriptor:fileDescriptor];
        //	NSString * hooptekst = @"";
        //	[hooptekst
        //	NSLog(hooptekst);
        UInt8 i;UInt8 c;
        c=13;
        for ( i = 0; i < 255; i++) {
            //	write(fileDescriptor, &c,1);
            write(fileDescriptor, &i,1);
        }
        
        //		write(fileDescriptor,[hooptekst cStringUsingEncoding:NSUTF8StringEncoding],[hooptekst length]);
        
        
        if ( [rxActiveBT state] == NSOnState ) {
            [portRead setFileDescriptor:fileDescriptor];
        }
    }
    
    return;
    
failed:
    deviceOpened = false;
    [baudrateIL selectItemAtIndex:0];
    NSAlert *alert = [[NSAlert alloc] init];
    [alert addButtonWithTitle:@"OK"];
    [alert setMessageText:@"Something fails during opening device!"];
    [alert setInformativeText:@"But we don't know what ;-)"];
    [alert setAlertStyle:NSCriticalAlertStyle];
    if ([alert runModal] == NSAlertFirstButtonReturn) { }
    [alert release];
    return;
    
}

- (void)closeTTY{
    if ( deviceOpened) {
        NSLog(@"Device Close");
        
        [portRead setFileDescriptor:0];
        [portState setFileDescriptor:0];
        
        tcsetattr(fileDescriptor,TCSANOW,&oldtio); /* restore old modem setings */
        close(fileDescriptor);
        fileDescriptor = 0;
        deviceOpened = false;
    }
    return;
    
failed:
    //	deviceOpened = false;
    [baudrateIL selectItemAtIndex:0];
    NSAlert *alert = [[NSAlert alloc] init];
    [alert addButtonWithTitle:@"OK"];
    [alert setMessageText:@"Something fails during closing device!"];
    [alert setInformativeText:@"But we don't know what ;-)"];
    [alert setAlertStyle:NSCriticalAlertStyle];
    if ([alert runModal] == NSAlertFirstButtonReturn) { }
    [alert release];
    return;
}

- (void)readPortSettings{
    
    port = [deviceTF stringValue];
    switch ([baudrateIL indexOfSelectedItem]) {
        case 0: baudrate = B600; break;
        case 1: baudrate = B1200; break;
        case 2: baudrate = B2400; break;
        case 3: baudrate = B4800; break;
        case 4: baudrate = B9600; break;
        case 5: baudrate = B19200; break;
        case 6: baudrate = B38400; break;
        case 7: baudrate = B57600; break;
        case 8: baudrate = B115200; break;
        case 9: baudrate = B230400; break;
        default:
            [baudrateIL selectItemAtIndex:4];
            NSAlert *alert = [[NSAlert alloc] init];
            [alert addButtonWithTitle:@"OK"];
            [alert setMessageText:@"Could not set baudrate!"];
            [alert setInformativeText:@"Set baudrate to 9600."];
            [alert setAlertStyle:NSCriticalAlertStyle];
            if ([alert runModal] == NSAlertFirstButtonReturn) { }
            [alert release];
            break;
    }
    switch ([databitsIL indexOfSelectedItem]) {
        case 0: databits = CS5; break;
        case 1: databits = CS6; break;
        case 2: databits = CS7; break;
        case 3: databits = CS8; break;
        default:
            [baudrateIL selectItemAtIndex:3];
            NSAlert *alert = [[NSAlert alloc] init];
            [alert addButtonWithTitle:@"OK"];
            [alert setMessageText:@"Could not set databits!"];
            [alert setInformativeText:@"Set databits to 8."];
            [alert setAlertStyle:NSCriticalAlertStyle];
            if ([alert runModal] == NSAlertFirstButtonReturn) { }
            [alert release];
            break;
    }
    switch ([stopbitsIL indexOfSelectedItem]) {
        case 0: stopbits = 0; break;
        case 1: stopbits = CSTOPB; break;
        default:
            [baudrateIL selectItemAtIndex:0];
            NSAlert *alert = [[NSAlert alloc] init];
            [alert addButtonWithTitle:@"OK"];
            [alert setMessageText:@"Could not set stopbits!"];
            [alert setInformativeText:@"Set stopbits to 1."];
            [alert setAlertStyle:NSCriticalAlertStyle];
            if ([alert runModal] == NSAlertFirstButtonReturn) { }
            [alert release];
            break;
    }
    switch ([parityIL indexOfSelectedItem]) {
        case 0: parity = 0; break;
        case 1: parity = (PARENB | PARENB); break;
        case 2: parity = PARENB; break;
        default:
            [baudrateIL selectItemAtIndex:0];
            NSAlert *alert = [[NSAlert alloc] init];
            [alert addButtonWithTitle:@"OK"];
            [alert setMessageText:@"Could not set parity!"];
            [alert setInformativeText:@"Set parity to none."];
            [alert setAlertStyle:NSCriticalAlertStyle];
            if ([alert runModal] == NSAlertFirstButtonReturn) { }
            [alert release];
            break;
    }
    
    
    handshakeHard = 0;
    if ( [handshakeHardwareBT state] == NSOnState) {
        handshakeHard |= CRTSCTS;
    } else {
        handshakeHard &= ~CRTSCTS;
    }
    
    
    handshakeSoft = 0;
    if ( [handshakeSoftwareBT state] == NSOnState) {
        handshakeSoft |= IXON | IXOFF;
    } else {
        handshakeSoft &= ~(IXON|IXOFF|IXANY);
    }
    NSLog(@"handshakeHard %p handshakeSoft %p ", handshakeHard, handshakeSoft	);
    
}

- (void)applicationDidFinishLaunching:(NSNotification *)notification {
    NSLog(@"Init %s\n", [port cStringUsingEncoding:NSUTF8StringEncoding]);
    NSLog(@"Runloop mode %s", [[NSRunLoop currentRunLoop] currentMode]);
    [deviceTF setStringValue:port];
    [openBT setState:NSOffState];
    [closeBT setEnabled:false];
    [openBT setEnabled:true];
    [deviceTF setEnabled:true];
    [baudrateIL setEnabled:true];
    [stopbitsIL setEnabled:true];
    [databitsIL setEnabled:true];
    [parityIL setEnabled:true];
    [handshakeSoftwareBT setEnabled:true];
    [handshakeHardwareBT setEnabled:true];
    [txActiveBT setEnabled:true];
    [rxActiveBT setEnabled:true];
    
    [transmitTV setEditable:false];
    
    portRead = [[[readThread alloc] init] autorelease];
    
    // register as self as delegate for port
    [portRead setDelegate:self];
    [portRead readSerialDataInBackground];
    
    portState = [[[stateThread alloc] init] autorelease];
    
    // register as self as delegate for port
    [portState setDelegate:self];
    [portState readStateInBackground];
}

- (void)windowWillClose:(NSNotification *)notification {
    //    [AVRPreferencesController saveDefaults];
    //	[programmer close];
    //    NSWindow *window = [self window];
    //    [window setDelegate:nil];
    [[NSApplication sharedApplication] terminate:self];\
}


- (void)applicationWillTerminate:(NSNotification *)notification {
    NSLog(@"Application will terminate");
    [self closeTTY];
}


- (BOOL)textView:(NSTextView *)transmitTV shouldChangeTextInRange:(NSRange)affectedCharRange replacementString:(NSString *)replacementString {
    // Allow changes only for uncommitted text
    return affectedCharRange.location >= committedLength;
}

- (BOOL)textView:(NSTextView *)transmitTV doCommandBySelector:(SEL)commandSelector {
    
    BOOL retval = NO;
    // When return is entered, record and color the newly committed text
    if (@selector(insertNewline:) == commandSelector) {
        unsigned textLength = [[transmitTV string] length];
        if (textLength > committedLength) {
            [transmitTV setSelectedRange:NSMakeRange(textLength, 0)];
            [transmitTV insertText:@"\n"];
            [transmitTV setTextColor:[NSColor redColor] range:NSMakeRange(committedLength, textLength - committedLength)];
            
            if (deviceOpened) {
                write(fileDescriptor,[[[transmitTV string] substringFromIndex:committedLength]  cStringUsingEncoding:NSUTF8StringEncoding],
                      [[[transmitTV string] substringFromIndex:committedLength] length]);
            }
            
            
            
            textLength++;
            committedLength = textLength;
        }
        retval = YES;
    }
    return retval;
}



- (IBAction)closeDevice:(id)sender
{
    [self readPortSettings];
    [openBT setState:NSOffState];
    [closeBT setState:NSOffState];
    
    [closeBT setEnabled:false];
    [openBT setEnabled:true];
    [deviceTF setEnabled:true];
    [baudrateIL setEnabled:true];
    [stopbitsIL setEnabled:true];
    [databitsIL setEnabled:true];
    [parityIL setEnabled:true];
    [handshakeSoftwareBT setEnabled:true];
    [handshakeHardwareBT setEnabled:true];
    [transmitTV setEditable:false];
    [txActiveBT setEnabled:true];
    [rxActiveBT setEnabled:true];
    [self closeTTY];
    
}

- (IBAction)dataTerminalReady:(id)sender
{
    int status;
    /*
     ioctl(fileDescriptor, TIOCMGET, &status);
     
     if ([dataTerminalReadyBT state] == NSOnState ) {
     status |= TIOCM_DTR;
     } else {
     status &= ~TIOCM_DTR;
     }
     ioctl(fileDescriptor, TIOCMSET, &status); */
    if ([dataTerminalReadyBT state] == NSOnState ) {
        ioctl(fileDescriptor, TIOCSDTR, 0);
        
    } else {
        ioctl(fileDescriptor, TIOCCDTR, 0);
    }
}

- (IBAction)hardwareHandshake:(id)sender
{
    [self readPortSettings];
}

- (IBAction)openDevice:(id)sender
{
    [self readPortSettings];
    [self openTTY];
    [openBT setState:NSOffState];
    [closeBT setState:NSOffState];
    
    if(deviceOpened){
        [openBT setEnabled:false];
        [closeBT setEnabled:true];
        [deviceTF setEnabled:false];
        [baudrateIL setEnabled:false];
        [stopbitsIL setEnabled:false];
        [databitsIL setEnabled:false];
        [parityIL setEnabled:false];
        [handshakeSoftwareBT setEnabled:false];
        [handshakeHardwareBT setEnabled:false];
        [txActiveBT setEnabled:false];
        [rxActiveBT setEnabled:false];
        
        if ( ([txActiveBT state] == NSOnState) ){
            [transmitTV setEditable:true];
        }
        
        
    }
}

- (IBAction)requestToSend:(id)sender
{
    int status;
    ioctl(fileDescriptor, TIOCMGET, &status);
    if ([requestToSendBT state] == NSOnState ) {
        status |= TIOCM_RTS;
    } else {
        status &= ~TIOCM_RTS;
    }
    ioctl(fileDescriptor, TIOCMSET, &status);
}

- (IBAction)rxActive:(id)sender
{
    [self readPortSettings];
}

- (IBAction)setBaud:(id)sender
{
    
    [self readPortSettings];
    //[[[baudrateIL selectedItem] title] cStringUsingEncoding:NSUTF8StringEncoding]
    //	NSLog(@"HOI! %i", 	[baudrateIL indexOfSelectedItem] );
}

- (IBAction)setDataBits:(id)sender
{
    [self readPortSettings];
}

- (IBAction)setParity:(id)sender
{
    [self readPortSettings];
}

- (IBAction)setStopBits:(id)sender
{
    [self readPortSettings];
}

- (IBAction)softwareHandshake:(id)sender
{
    [self readPortSettings];
}

- (IBAction)transmit:(id)sender
{
}

- (IBAction)txActive:(id)sender
{	
    [self readPortSettings];
}


- (IBAction)setbreak:(id)sender
{	
    //	int status;
    
    if ([breakBT state] == NSOnState ) {
        NSLog(@"Break On");
        //	tcsendbreak(fileDescriptor,0);
        ioctl(fileDescriptor, TIOCSBRK, 0);
        
    } else {
        NSLog(@"Break Off");
        ioctl(fileDescriptor, TIOCCBRK, 0);
    }
}


-(int)fileDescriptor {
    return fileDescriptor;
}



- (void)serialPortStateChanged:(NSNumber *)state
{
    UInt32 status;
    status = [state unsignedIntValue];
    //NSLog(@"serialPortStateChanged %p CAR: %p result: %p", [state unsignedIntValue], TIOCM_CAR, status & TIOCM_CAR );
    
    if ( status & TIOCM_DTR ) {
        [dataTerminalReadyBT setState:NSOnState];
    } else {
        [dataTerminalReadyBT setState:NSOffState];
    }
    
    if ( status & TIOCM_RTS ) {
        [requestToSendBT setState:NSOnState];
    } else {
        [requestToSendBT setState:NSOffState];
    }
    
    if ( status & TIOCM_CTS ) {
        [clearToSendBT setState:NSOnState];
    } else {
        [clearToSendBT setState:NSOffState];
    }
    
    if ( status & TIOCM_DSR ) {
        [dataSetReadyBT setState:NSOnState];
    } else {
        [dataSetReadyBT setState:NSOffState];
    }
    
    if ( status & TIOCM_CAR ) {
        [carrierDetectBT setState:NSOnState];
    } else {
        [carrierDetectBT setState:NSOffState];
    }
    
    if ( status & TIOCM_RNG ) {
        [ringIndicatorBT setState:NSOnState];
    } else {
        [ringIndicatorBT setState:NSOffState];
    }
    
    
}

-(void)dateReadSerial:(NSString *)data
{
    
    //  NSLog(@"serialPortDidChange");
    [portState setFileDescriptor:fileDescriptor];
    
    //   	[tfHexFileName setStringValue:[[NSDate date] description]];
    NSRange range;
    range = NSMakeRange ([[receiveTV string] length], 0);
    [receiveTV replaceCharactersInRange:range withString:data];
    if ( [rxActiveBT state] == NSOnState ) {
        [portRead setFileDescriptor:fileDescriptor];
    }
    
}

@end
