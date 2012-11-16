//
//  Downloader.h
//  RSS reader sec
//
//  Created by student on 10.11.12.
//  Copyright (c) 2012 AndrewEremeev. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MyProtocolDownloader<NSObject>

@end
@interface Downloader {
    NSMutableData *rssData;
    id<MyProtocolDownloader> delegat;
}

@property (nonatomic, retain) NSMutableData *rssData;
@property (nonatomic, retain) id<MyProtocolDownloader>delegat;


-(id)initWithURL:(NSString*)URL;

@end