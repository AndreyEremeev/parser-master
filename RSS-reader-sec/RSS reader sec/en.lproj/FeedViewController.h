//
//  FeedViewController.h
//  RSS reader sec
//
//  Created by admin on 10/30/12.
//  Copyright (c) 2012 AndrewEremeev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTableNews.h"

@interface FeedViewController : UIViewController <UITableViewDelegate, UITableViewDataSource,MyProtocolTable2>{
    CTableNews *tableView;
    NSString *url;
}

-(id)initwithurl:(NSString *)text;

@property(nonatomic, retain) CTableNews *tableView;
@property(nonatomic,retain) NSString *url;

@end
