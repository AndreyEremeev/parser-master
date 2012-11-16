//
//  RootViewController.m
//  RSS reader sec
//
//  Created by admin on 10/27/12.
//  Copyright (c) 2012 AndrewEremeev. All rights reserved.
//

#import "RootViewController.h"
#import "FeedViewController.h"
#import "Feeds.h"

@interface RootViewController ()

@end

@implementation RootViewController

@synthesize tableView;
@synthesize alertView;



- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *edit =[[[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                             target:self
                             action:@selector(editing)] autorelease];
    self.navigationItem.rightBarButtonItem = edit;
    
    UIBarButtonItem *add =[[[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                             target:self
                             action:@selector(adding)] autorelease];
    self.navigationItem.leftBarButtonItem = add;
    tableView = [[CTable alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegat = self;
    
    [self.view addSubview:tableView];
}
-(void)cellSelect:(NSIndexPath *)indexPath
{
    Feeds *feed = [self.tableView.mass objectAtIndex:indexPath.row];

    FeedViewController *second = [[FeedViewController alloc] initwithurl:feed.URL];
    [self.navigationController pushViewController:second animated:YES];

    
}

-(void)editing
{
    [tableView editing];
}
-(void)adding
{
    [tableView addButton];

}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0){
        
    }
    else
    {
        [tableView adding];
    }
}
-(void)dealloc
{
    [alertView release];
    [tableView release];
    [super dealloc];  
    
}

@end
