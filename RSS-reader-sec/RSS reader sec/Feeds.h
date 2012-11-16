//
//  Feeds.h
//  TableView
//
//  Created by Andrew on 22.10.12.
//
//

#import <Foundation/Foundation.h>

@interface Feeds : NSObject 

@property (copy) NSString *Name;
@property (copy) NSString *URL;


- (id)initWithName:(NSString*)Name URL:(NSString*)URL;

@end