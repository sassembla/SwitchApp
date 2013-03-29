//
//  AppDelegate.m
//  SwitchApp
//
//  Created by sassembla on 2013/03/21.
//  Copyright (c) 2013年 KISSAKI Inc,. All rights reserved.
//

#import "AppDelegate.h"


#define KEY_TO	(@"-t")
#define KEY_FROM	(@"-f")
#define KEY_VERSION	(@"-v")


@implementation AppDelegate

NSDictionary * argsDict;

- (void) setArgs:(NSMutableDictionary * )currentArgsDict {
	argsDict = [[NSDictionary alloc]initWithDictionary:currentArgsDict];
}

- (void)applicationDidFinishLaunching:(NSNotification * ) aNotification
{
    @try {
		NSAssert1(argsDict[KEY_FROM], @"%@ fromApplication required", KEY_FROM);
		NSAssert1(argsDict[KEY_TO], @"%@ toApplication required", KEY_TO);
		
		if (argsDict[KEY_VERSION]) NSLog(@"version %@", VERSION);
		
		[self switchAppFrom:argsDict[KEY_FROM] to:argsDict[KEY_TO]];
	}
	@catch (NSException * e) {
        NSLog(@"error:%@", e);
    }
	@finally {
		exit(0);
	}
}

- (void) switchAppFrom:(NSString * )fromApp to:(NSString * )toApp {
    NSArray *apps = [[NSWorkspace sharedWorkspace] runningApplications];

    for (NSRunningApplication * app in apps) {
        if([app.bundleIdentifier.lowercaseString hasPrefix:fromApp]) {
			NSLog(@"app %@",app);
            [app activateWithOptions:NSApplicationActivateAllWindows];
        }
    }
		
    for (NSRunningApplication * app in apps) {
        if([app.bundleIdentifier.lowercaseString isEqualToString:toApp]) {
			NSLog(@"app %@",app);
            [app activateWithOptions:NSApplicationActivateIgnoringOtherApps];
        }
    }
}



@end
