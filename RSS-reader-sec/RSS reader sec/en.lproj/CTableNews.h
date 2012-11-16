//
//  CTableNews.h
//  RSS reader sec
//
//  Created by admin on 10/30/12.
//  Copyright (c) 2012 AndrewEremeev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Feeds.h"
#import "ParserDelegate.h"

@protocol MyProtocolTable2<NSObject>

@end


@interface CTableNews : UITableView <UIAlertViewDelegate, UITableViewDelegate, UITableViewDataSource>
{
    id<MyProtocolTable2>delegat;
    NSArray *news;
}

@property (nonatomic, retain)id<MyProtocolTable2>delegat;
@property (nonatomic, retain) NSArray *news;
@property (nonatomic, retain) NSString *feedURL;



- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style feedURL:(NSString*)feedURL;

@end
