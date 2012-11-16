//
//  CTable.h
//  RSS reader sec
//
//  Created by admin on 10/27/12.
//  Copyright (c) 2012 AndrewEremeev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Feeds.h"
#import "CAlert.h"

@protocol MyProtocolTable<NSObject>
@optional
- (void)cellSelect:(NSIndexPath *)indexPath;
@end


@interface CTable : UITableView <UIAlertViewDelegate, UITableViewDelegate, UITableViewDataSource,MyProtocolAlert>
{
    id<MyProtocolTable>delegat;
    
    NSMutableArray *mass;
    CAlert *alertView;
}

@property (nonatomic, retain)CAlert *alertView;
@property (nonatomic, retain)id<MyProtocolTable>delegat;
@property (nonatomic, retain) NSMutableArray *mass;





-(void)editing;
-(void)adding;
-(void)addButton;
- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style;

@end
