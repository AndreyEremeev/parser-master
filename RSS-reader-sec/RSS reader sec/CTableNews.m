//
//  CTableNews.m
//  RSS reader sec
//
//  Created by admin on 10/30/12.
//  Copyright (c) 2012 AndrewEremeev. All rights reserved.
//

#import "CTableNews.h"
#import "ParserDelegate.h"
#import "FeedViewController.h"

@interface CTableNews ()

@end

@implementation CTableNews

@synthesize delegat;
@synthesize news;
@synthesize newsUrl;
@synthesize feedURL;




- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style feedURL:(NSString*)feedURL
{
    
    self = [super initWithFrame:frame style:style];
    self.delegate = self;
    self.dataSource = self;
    
    ParserDelegate *delegate = [[ParserDelegate alloc] init];
    
    NSURL* rssURL =
    [NSURL URLWithString:feedURL];
    

    NSXMLParser* parser = [[NSXMLParser alloc] initWithContentsOfURL:rssURL];
    [parser setDelegate:delegate];
    [parser parse];

    self.news = [NSArray arrayWithArray:delegate.titles];
    self.newsUrl = [NSArray arrayWithArray:delegate.urls];
    return self;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [news count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                       reuseIdentifier:CellIdentifier] autorelease];
    }
    
    cell.textLabel.text = [news objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [newsUrl objectAtIndex:indexPath.row];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [delegat cellSelect:indexPath];
}

-(void)dealloc
{

    [super dealloc];
}

@end
