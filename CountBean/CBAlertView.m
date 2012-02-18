//
//  CBAlertView.m
//  CountBean
//
//  Created by  on 12-2-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CBAlertView.h"

@implementation CBAlertView
@synthesize delegate = _delegate;
@synthesize title = _title;
@synthesize message = _message;
@synthesize cancelButtonTitle = _cancelButtonTitle;
@synthesize otherButtonTitles = _otherButtonTitles;


- (void)setSubViews
{
    //title
    
    //message
    
    //cancel
    
    //other buttons
}

- (id)initWithTitle:(NSString *)title 
            message:(NSString *)message 
           delegate:(id)delegate 
  cancelButtonTitle:(NSString *)cancelButtonTitle 
  otherButtonTitles:(NSArray *)otherButtonTitles
{
    self = [super initWithImage:BG_IMAGE];
    self.frame = CGRectMake(0, 0, 304, 198);
    if (self) {
        self.title = title;
        self.message = message;
        self.cancelButtonTitle = cancelButtonTitle;
        self.otherButtonTitles = otherButtonTitles;
        self.delegate = delegate;
    }
    return self;
}


- (void)show
{
    [self retain];
}


- (void)dealloc
{
    [_title release];
    [_message release];
    [_cancelButtonTitle release];
    [_otherButtonTitles release];
    [super dealloc];
}
@end
