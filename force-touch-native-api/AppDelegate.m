//
//  AppDelegate.m
//  force-touch-native-api
//
//  Created by Chris Rabl on 12/7/19.
//  Copyright © 2019 Coulee. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    [self.window cascadeTopLeftFromPoint:NSMakePoint(50,50)];
    
    id textField = [[NSTextField alloc] initWithFrame:NSMakeRect(10, 20, 200, 20)];
    [self.window.contentView addSubview:textField];
    [textField setDoubleValue:0.0];
    [textField setBezeled:NO];
    [textField setDrawsBackground:NO];
    [textField setEditable:NO];
    [textField setSelectable:NO];
    
    
    [self.window trackEventsMatchingMask:NSEventMaskPressure
                                 timeout:NSEventDurationForever
                                    mode:NSEventTrackingRunLoopMode
                                 handler:^(NSEvent * _Nonnull event, BOOL * _Nonnull stop) {
        double pressure = ceil(event.pressure * 100);
        [textField setDoubleValue:pressure];
    }];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
