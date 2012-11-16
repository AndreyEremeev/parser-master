//
//  CAlert.m
//  RSS reader sec
//
//  Created by admin on 10/27/12.
//  Copyright (c) 2012 AndrewEremeev. All rights reserved.
//

#import "CAlert.h"
@interface CAlert()

@end

@implementation CAlert


@synthesize firstTextField;
@synthesize secondTextField;
@synthesize delegat;

- (id)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id /*<UIAlertViewDelegate>*/)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitles {
    
    self = [super initWithTitle:title
            message:message
            delegate:delegate
            cancelButtonTitle:cancelButtonTitle
            otherButtonTitles:otherButtonTitles,nil];
    
    firstTextField = [[[UITextField alloc] initWithFrame:CGRectMake(12.0, 38.0, 260.0, 20.0)] autorelease];
    firstTextField.placeholder = @"Feed name";
    [firstTextField setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:firstTextField];
    secondTextField = [[[UITextField alloc] initWithFrame:CGRectMake(12.0, 60.0, 260.0, 20.0)]autorelease];
    secondTextField.text = @"http://";
    [secondTextField setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:secondTextField];
	return self;
}
- (void)dealloc {
    firstTextField.text = nil;
    secondTextField.text = nil;
    [firstTextField release];
    [secondTextField release];
    [super dealloc];
}



@end
