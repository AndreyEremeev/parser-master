//
//  FeedViewController.m
//  RSS reader sec
//
//  Created by admin on 10/30/12.
//  Copyright (c) 2012 AndrewEremeev. All rights reserved.
//

#import "FeedViewController.h"
#import "NewsViewController.h"



@implementation FeedViewController

@synthesize tableView;
@synthesize url;

-(id)initwithurl:(NSString *)text
{
    self.url = [NSString stringWithString:text];
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];

    tableView = [[CTableNews alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain feedURL:url];
    tableView.delegat = self;    
    
    [self.view addSubview:tableView];
}

-(void)cellSelect:(NSIndexPath *)indexPath
{
    NewsViewController *third = [[NewsViewController alloc] initWithURL:[tableView.newsUrl objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:third animated:YES];
    
    
}
-(void)dealloc
{
    [tableView release];
    [super dealloc];
    
}

@end
