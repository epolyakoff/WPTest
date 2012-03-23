//
//  AppDelegate.h
//  CacheTester
//
//  Created by Eugene Polyakov on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define AppD (AppDelegate*)[[UIApplication sharedApplication] delegate]

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@end
