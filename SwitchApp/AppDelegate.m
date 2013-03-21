//
//  AppDelegate.m
//  SwitchApp
//
//  Created by sassembla on 2013/03/21.
//  Copyright (c) 2013年 KISSAKI Inc,. All rights reserved.
//

#import "AppDelegate.h"


@implementation AppDelegate

NSString * privateArgs;

- (void) ignite:(NSString * )args {
	privateArgs = [[NSString alloc]initWithString:args];
}


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	NSLog(@"privateArgs %@", privateArgs);
	
//	ここでキーを分解すればOKなんだけど後回し
	[self switchAppFrom:@"com.unity3d" to:@"com.sublimetext.2"];
	exit(1);
}

- (void) switchAppFrom:(NSString * )fromApp to:(NSString * )toApp {
    NSArray *apps = [[NSWorkspace sharedWorkspace] runningApplications];

    for (NSRunningApplication * app in apps) {
        if([app.bundleIdentifier.lowercaseString hasPrefix:fromApp]) {
            [app activateWithOptions:NSApplicationActivateIgnoringOtherApps];
        }
    }
		
    for (NSRunningApplication * app in apps) {
        if([app.bundleIdentifier.lowercaseString isEqualToString:toApp]) {
            [app activateWithOptions:NSApplicationActivateAllWindows|NSApplicationActivateIgnoringOtherApps];
        }
    }
}



@end
