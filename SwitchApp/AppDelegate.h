//
//  AppDelegate.h
//  SwitchApp
//
//  Created by sassembla on 2013/03/21.
//  Copyright (c) 2013年 KISSAKI Inc,. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#define VERSION	(@"0.0.11")

#define KEY_PERFIX  (@"-")

@interface AppDelegate : NSObject <NSApplicationDelegate>
- (void) setArgs:(NSMutableDictionary * )currentArgsDict;
@end
