//
//  ViewController.m
//  CacheTester
//
//  Created by Eugene Polyakov on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "SDURLCache.h"
#import "Logger.h"

@implementation ViewController
@synthesize logView;
@synthesize webView, urlCache;
@synthesize logText;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    urlCache = [[[SDURLCache alloc] initWithMemoryCapacity:1024*1024   // 1MB mem cache
                                              diskCapacity:1024*1024*5 // 5MB disk cache
                                                  diskPath:[SDURLCache defaultCachePath]] retain];
    [NSURLCache setSharedURLCache:urlCache];
//    cachePath = nil;
    logText = [[NSMutableString alloc] init];
    logView.text = logText;
	[super viewDidLoad];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://pionerskaya.ru/wp/articles/index-manifest.html"]]];
}

- (void)viewDidUnload
{
    [self setWebView:nil];
    [self setLogView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

- (void)dealloc {
    [urlCache release];
    [webView release];
    [logView release];
    [logText release];
    [super dealloc];
}

-(void)log:(NSString*)string {
    [logText insertString:[string stringByAppendingString:@"\n"] atIndex:0];
    logView.text = logText;
}

#pragma mark UIWebViewDelegate

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    if ([request.URL.scheme isEqualToString:@"log"]) {
        [Logger log:@"JS" text:request.URL.absoluteString];
        return NO;
    }
    [Logger log:@"WV - loading"  text:[request URL].absoluteString];
    return YES;
}

@end
