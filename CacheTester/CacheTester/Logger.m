//
//  Logger.m
//  CacheTester
//
//  Created by Eugene Polyakov on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Logger.h"
#import "AppDelegate.h"

@implementation Logger

+(void)log:(NSString*)sender text:(NSString*)text {
    int len = 40;
    if (text.length > len) {
        text = [text substringFromIndex:text.length - len];
    }
    NSString * string = [NSString stringWithFormat:@"%@ - %@", sender, text];
    [[AppD viewController] performSelectorOnMainThread:@selector(log:) withObject:string waitUntilDone:NO];
}

@end
