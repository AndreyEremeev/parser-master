//
//  Feeds.m
//  TableView
//
//  Created by Andrew on 22.10.12.
//
//

#import "Feeds.h"
@implementation Feeds
@synthesize Name = _Name;
@synthesize URL = _URL;


- (id)initWithName:(NSString*)Name URL:(NSString*)URL
{
    if ((self = [super init])) {
        _Name = [Name copy];
        _URL = [URL copy];

    }
    return self;
}

- (void)dealloc {
    [_Name release];
    _Name = nil;
    [_URL release];
    _URL = nil;

    [super dealloc];
}

@end