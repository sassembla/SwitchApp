//
//  SwitchApp.m
//  SwitchApp
//
//  Created by sassembla on 2013/03/21.
//  Copyright (c) 2013年 KISSAKI Inc,. All rights reserved.
//

#import "SwitchApp.h"
#import "AppDelegate.h"


@implementation SwitchApp
int NSApplicationMain(int argc, const char *argv[]) {
    
    @autoreleasepool {
        AppDelegate * delegate = [[AppDelegate alloc] init];
        
        NSApplication * application = [NSApplication sharedApplication];
        [application setDelegate:delegate];
        
        NSMutableArray * keyAndValueStrArray = [[NSMutableArray alloc]init];
        
        for (int i = 0; i < argc; i++) {
            
            [keyAndValueStrArray addObject:[NSString stringWithUTF8String:argv[i]]];
            
        }
        
        NSMutableDictionary * argsDict = [[NSMutableDictionary alloc]init];
        for (int i = 0; i < [keyAndValueStrArray count]; i++) {
            NSString * keyOrValue = keyAndValueStrArray[i];
            if ([keyOrValue hasPrefix:KEY_PERFIX]) {
                NSString * key = keyOrValue;
                
                // get value
                if (i + 1 < [keyAndValueStrArray count]) {
                    NSString * value = keyAndValueStrArray[i + 1];
                    [argsDict setValue:value forKey:key];
                }
                else {
                    NSString * value = @"";
                    [argsDict setValue:value forKey:key];
                }
            }
        }
        
        [delegate setArgs:argsDict];
        [NSApp run];
        return 0;    }
}


@end
