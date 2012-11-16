//
//  NewsViewController.m
//  RSS reader sec
//
//  Created by student on 10.11.12.
//  Copyright (c) 2012 AndrewEremeev. All rights reserved.
//

#import "NewsViewController.h"
#import "Downloader.h"

@implementation NewsViewController

@synthesize newsURL;




-(id)initWithURL:(NSString *)text
{
    self.newsURL = [NSURL URLWithString:text];    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIWebView *browser;
    
    browser = [[UIWebView alloc] initWithFrame:self.view.bounds];
    browser.delegate = self;
    [self.view addSubview:browser];
    [browser loadRequest:[NSURLRequest requestWithURL:self.newsURL]];

}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"%@", error);
}



-(void)dealloc
{
    [super dealloc];
    
}

@end