//
//  CBAlertView.h
//  CountBean
//
//  Created by  on 12-2-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CBAlertView;
@protocol CBAlertViewDelegate <NSObject>

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;

@end

#define BG_IMAGE [UIImage imageNamed:@"paper2.png"]

@interface CBAlertView : UIImageView
{
    NSString *_title, *_message;
}

@property(nonatomic, retain)NSString *title;
@property(nonatomic, retain)NSString *message;
@property(nonatomic, assign)id<CBAlertViewDelegate>delegate;
@property(nonatomic, retain)NSString *cancelButtonTitle;
@property(nonatomic, retain)NSArray *otherButtonTitles;

- (id)initWithTitle:(NSString *)title 
            message:(NSString *)message 
           delegate:(id)delegate 
  cancelButtonTitle:(NSString *)cancelButtonTitle 
  otherButtonTitles:(NSArray *)otherButtonTitles;

- (void)show;
@end
