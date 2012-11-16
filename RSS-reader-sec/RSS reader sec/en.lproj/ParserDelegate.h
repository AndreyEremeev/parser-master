//
//  ParserDelegate.h
//  RSS reader sec
//
//  Created by admin on 10/30/12.
//  Copyright (c) 2012 AndrewEremeev. All rights reserved.
//

#import <Foundation/Foundation.h>




@interface ParserDelegate : NSObject<NSXMLParserDelegate> {
    BOOL m_done;
    BOOL m_isTitle;
    NSError* m_error;
    NSMutableArray* m_titles;
    NSMutableString* m_title;
}

@property (readonly) BOOL done;
@property (readonly) NSArray* titles;

@end
