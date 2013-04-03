//
//  AppDelegate.m
//  SwitchApp
//
//  Created by sassembla on 2013/03/21.
//  Copyright (c) 2013年 KISSAKI Inc,. All rights reserved.
//

#import "AppDelegate.h"

#import <ScriptingBridge/ScriptingBridge.h>

#define KEY_TO		(@"-t")
#define KEY_FROM	(@"-f")
#define KEY_VERSION	(@"-v")

#define KEY_SHOW	(@"--show")



@implementation AppDelegate

NSDictionary * argsDict;

- (void) setArgs:(NSMutableDictionary * )currentArgsDict {
	argsDict = [[NSDictionary alloc]initWithDictionary:currentArgsDict];
}

- (void)applicationDidFinishLaunching:(NSNotification * ) aNotification
{
	
	if (argsDict[KEY_SHOW]) {
		NSArray * apps = [[NSWorkspace sharedWorkspace] runningApplications];
		NSLog(@"current running apps are : %@", apps);
		exit(0);
	}
	
	// main mode
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

/**
 change focus from to
 */
- (void) switchAppFrom:(NSString * )fromAppStr to:(NSString * )toAppStr {
	
	if (![fromAppStr isEqualToString:toAppStr]) {
		id fromApp = [SBApplication applicationWithBundleIdentifier:fromAppStr];
		if (fromApp) {
			@try {
				[fromApp activate];
			}
			@catch (NSException * exception) {
				NSLog(@"from exception:%@",exception);
			}
			@finally {
				
			}
			
		} else {
			NSLog(@"fromApp( %@ ) not found. please use --show.", fromApp);
		}
	}

	id toApp = [SBApplication applicationWithBundleIdentifier:toAppStr];
	if (toApp) {
		@try {
			[toApp activate];
		}
		@catch (NSException *exception) {
			NSLog(@"to exception:%@",exception);
		}
		@finally {
			
		}
		
	} else {
		NSLog(@"toApp( %@ ) not found. please use --show.", toApp);
	}
}




@end
