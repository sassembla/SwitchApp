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
        
        NSString * args = [[NSString alloc]initWithUTF8String:*argv];
        
        [delegate ignite:args];
        [NSApp run];
        return 1;
    }
}


@end
