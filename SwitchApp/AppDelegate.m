//
//  AppDelegate.m
//  SwitchApp
//
//  Created by sassembla on 2013/03/21.
//  Copyright (c) 2013年 KISSAKI Inc,. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	
//    remove view
	
//    add hook
	[self switchAppFrom:@"" to:@""];
}

- (void) switchAppFrom:(NSString * )fromApp to:(NSString * )toApp {
    NSArray *apps = [[NSWorkspace sharedWorkspace] runningApplications];
    
    for (NSRunningApplication *app in apps) {
        if([app.bundleIdentifier.lowercaseString hasPrefix:fromApp]) {
            [app hide];
            [app activateWithOptions:NSApplicationActivateIgnoringOtherApps];
            //            [app unhide];
        }
    }
    for (NSRunningApplication *app in apps) {
        if([app.bundleIdentifier.lowercaseString isEqualToString:toApp]) {
            [app activateWithOptions:NSApplicationActivateAllWindows|NSApplicationActivateIgnoringOtherApps];
        }
    }
}



@end
