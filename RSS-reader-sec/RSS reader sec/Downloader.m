//
//  Downloader.m
//  RSS reader sec
//
//  Created by student on 10.11.12.
//  Copyright (c) 2012 AndrewEremeev. All rights reserved.
//

#import "Downloader.h"

@implementation Downloader
@synthesize rssData;
@synthesize delegat;

-(id)initWithURL:(NSString*)URL
{
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    NSURL *url = [NSURL URLWithString:URL];
    NSURLRequest *theRequest=[NSURLRequest requestWithURL:url
                                              cachePolicy:NSURLRequestUseProtocolCachePolicy
                                          timeoutInterval:60.0];
    NSLog(@"11111111");
    NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    if (theConnection) {
        self.rssData = [NSMutableData data];
    } else {
        NSLog(@"Connection failed");
    }
    
    [theConnection release];  
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [rssData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSString *result = [[NSString alloc] initWithData:rssData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",result);
    [result release];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"%@", error);
}

@end