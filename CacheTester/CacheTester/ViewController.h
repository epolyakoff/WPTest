//
//  ViewController.h
//  CacheTester
//
//  Created by Eugene Polyakov on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDURLCache.h"

@interface ViewController : UIViewController<UIWebViewDelegate>

@property (retain, nonatomic) IBOutlet UIWebView *webView;
@property (retain, nonatomic) SDURLCache * urlCache;
@property (retain, nonatomic) IBOutlet UITextView *logView;
@property (retain, nonatomic) NSMutableString * logText;

-(void)log:(NSString*)string;

@end
