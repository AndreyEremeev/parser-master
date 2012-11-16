//
//  NewsViewController.h
//  RSS reader sec
//
//  Created by student on 10.11.12.
//  Copyright (c) 2012 AndrewEremeev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Downloader.h"

@interface NewsViewController : UIViewController<UIWebViewDelegate>
{
    
    NSURL *newsURL;

}

@property (nonatomic, retain) NSURL *newsURL;

-(id)initWithURL:(NSString*) text;

@end
