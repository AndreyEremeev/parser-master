//
//  ParserDelegate.m
//  RSS reader sec
//
//  Created by admin on 10/30/12.
//  Copyright (c) 2012 AndrewEremeev. All rights reserved.
//

#import "ParserDelegate.h"

@implementation ParserDelegate
@synthesize done=m_done;
@synthesize titles=m_titles;
@synthesize urls=m_urls;

-(void) dealloc {
    [m_titles release];
    [m_urls release];
    [super dealloc];
}

- (void)parserDidStartDocument:(NSXMLParser *)parser {
    m_done = NO;
    m_titles = [NSMutableArray new];
    m_urls = [NSMutableArray new];
}
- (void)parserDidEndDocument:(NSXMLParser *)parser {
    m_done = YES;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    m_isTitle = [[elementName lowercaseString] isEqualToString:@"title"];
    m_isUrl = [[elementName lowercaseString] isEqualToString:@"link"];
    
    if ( m_isTitle ) {
        m_title = [NSMutableString new];
    }
    if (m_isUrl){
        m_url = [NSMutableString new];
    }
}
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if ( m_isTitle ) {
        [m_titles addObject:m_title];
        [m_title release];
    }
    if ( m_isUrl){
        [m_urls addObject:m_url];
        [m_url release];
    }
}
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if ( m_isTitle ) {
        [m_title appendString:string];
    }
    if ( m_isUrl ) {
        [m_url appendString:string];
    }
}

@end