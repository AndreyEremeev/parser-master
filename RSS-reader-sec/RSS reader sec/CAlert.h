//
//  CAlert.h
//  RSS reader sec
//
//  Created by admin on 10/27/12.
//  Copyright (c) 2012 AndrewEremeev. All rights reserved.
//
// отправь меня
#import <UIKit/UIKit.h>
@protocol MyProtocolAlert<NSObject>

@end

@interface CAlert : UIAlertView <UIAlertViewDelegate>
{
    id<MyProtocolAlert>delegat;
	UITextField *firstTextField;
	UITextField *secondTextField;
}

@property (nonatomic, retain)id<MyProtocolAlert>delegat;
@property(nonatomic, retain) UITextField *firstTextField;
@property(nonatomic, retain) UITextField *secondTextField;

- (id)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id /*<UIAlertViewDelegate>*/)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitles;

@end
