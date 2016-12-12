//
//  main.m
//  SoundcraftRM100
//
//  Created by Thomas O'Harriedge on 12.12.16.
//  Copyright © 2016 Thomas O'Harriedge. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <AppleScriptObjC/AppleScriptObjC.h>

int main(int argc, const char * argv[]) {
    [[NSBundle mainBundle] loadAppleScriptObjectiveCScripts];
    return NSApplicationMain(argc, argv);
}
