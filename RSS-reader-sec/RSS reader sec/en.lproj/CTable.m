//
//  CTable.m
//  RSS reader sec
//
//  Created by admin on 10/27/12.
//  Copyright (c) 2012 AndrewEremeev. All rights reserved.
//

#import "CTable.h"
#import "Feeds.h"
#import "ParserDelegate.h"
#import "FeedViewController.h"

@interface CTable ()

@end

@implementation CTable

@synthesize alertView;
@synthesize delegat;
@synthesize mass;



- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    
    self = [super initWithFrame:frame style:style];
    self.delegate = self;
    self.dataSource = self;
    alertView =[[CAlert alloc] initWithTitle:@"Add new Feed" message:@"     " delegate:self cancelButtonTitle:@"Cancel" otherButtonTitle:@"Confirm"];
    alertView.delegat = self;


    Feeds *feed  = [[[Feeds alloc] initWithName:@"images apple" URL:@"http://images.apple.com/main/rss/hotnews/hotnews.rss"] autorelease];
    self.mass = [NSMutableArray arrayWithObject:feed];
    return self;
}

-(void)addButton{
    [alertView show];  
    
    
}
- (void)adding {
    Feeds *feed = [[[Feeds alloc] initWithName:alertView.firstTextField.text URL:alertView.secondTextField.text] autorelease];
    alertView.firstTextField.text = nil;
    alertView.secondTextField.text = @"http://";
    [mass addObject:feed];
    [self reloadData];
}
- (void)editing {
    [self setEditing:!self.editing animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [mass count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                       reuseIdentifier:CellIdentifier] autorelease];
    }

    Feeds *feed = [mass objectAtIndex:indexPath.row];
    cell.textLabel.text = feed.Name;
    cell.detailTextLabel.text = feed.URL;
    
    return cell;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)aTableView
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return UITableViewCellEditingStyleInsert;
    } else {
        return UITableViewCellEditingStyleDelete;
    }
}

- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [mass removeObjectAtIndex:indexPath.row];
        [self reloadData];      
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {

        [alertView show];
        
      
    }
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0){
        
    }
    else
    {
        [self adding];
    }
}


- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}

- (void)tableView:(UITableView *)tableView
moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
      toIndexPath:(NSIndexPath *)destinationIndexPath
{
	[mass exchangeObjectAtIndex:sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];
    [self reloadData];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [delegat cellSelect:indexPath];
}

-(void)dealloc
{
    [super dealloc];
}

@end
