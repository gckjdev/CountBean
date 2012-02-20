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
@synthesize images = _images;
@synthesize isShow = _isShow;
@synthesize backgroundView = _backgroundView;

#define WIDTH 304.0
#define HEIGHT 198.0    

- (void)hide
{
    if (self.isShow) {
        _isShow = NO;
        [self removeFromSuperview];
        [self release];
    }
}


- (void)clickButtonAction:(id)sender
{
    UIButton *button = (UIButton *)sender;
    if (_delegate && [_delegate respondsToSelector:@selector(alertView:clickedButtonAtIndex:)]) {
        [self.delegate alertView:self clickedButtonAtIndex:button.tag];
        [self hide];
    }
}


- (void)setSubViews
{   
    [self addSubview:_backgroundView];
    //title
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, WIDTH - 20, 40)];
    [titleLabel setText:self.title];
    titleLabel.backgroundColor = [UIColor clearColor];
    [titleLabel setTextAlignment:UITextAlignmentCenter];
    [titleLabel setFont:[UIFont systemFontOfSize:20]];
    [self.backgroundView addSubview:titleLabel];
    [titleLabel release];

    //message
    UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 60, WIDTH - 20, 60)];
    [messageLabel setText:self.message];
    messageLabel.backgroundColor = [UIColor clearColor];
    [messageLabel setTextAlignment:UITextAlignmentCenter];
    [messageLabel setFont:[UIFont systemFontOfSize:20]];
    [messageLabel setNumberOfLines:5];
    [self.backgroundView addSubview:messageLabel];
    [messageLabel release];

    //images
    CGFloat buttonWidth = 35.0;
    CGFloat buttonHeight = 29.0;
    NSInteger n = [self.images count];
    CGFloat space = (WIDTH - buttonWidth * n) / (n + 1);
    NSInteger i = 0;
    CGFloat y = 130;
    for (UIImage *image in self.images) {
        if (image && [image isKindOfClass:[UIImage class]]) {
            CGFloat x = space + (space + buttonWidth) * i;
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setImage:image forState:UIControlStateNormal];
            button.tag = i ++;
            button.frame = CGRectMake(x, y, buttonWidth, buttonHeight);
            [button addTarget:self action:@selector(clickButtonAction:) forControlEvents:UIControlEventTouchUpInside];
            [self.backgroundView addSubview:button];            
        }
    }    

}



- (id)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate images:(NSArray *)images
{
    self = [super initWithFrame:CGRectMake(0, 0, 320, 480)];
    if (self) {
        _backgroundView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 304, 198)];
        [_backgroundView setImage:BG_IMAGE];
        _backgroundView.center = CGPointMake(160, 240);
        _backgroundView.userInteractionEnabled = YES;
        self.title = title;
        self.message = message;
        self.delegate = delegate;
        self.images = images;
        [self setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.6]];
    }
    return self;    
}


- (void)showWithSuperView:(UIView *)superView
{
    if (self.isShow) {
        
    }else{
        _isShow = YES;
        [self setSubViews];
        [superView addSubview:self];
        [self retain];
    }
}


- (void)dealloc
{
    [_title release];
    [_message release];
    [_cancelButtonTitle release];
    [_otherButtonTitles release];
    [_images release];
    [_backgroundView release];
    [super dealloc];
}
@end
