//
//  CountBeanViewController.h
//  CountBean
//
//  Created by gamy on 12-1-31.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    GreenBean = 0,
    YellowBean,
    RedBean
}BeanType;

enum {
    ShowBeans = 0,
    HideBeans,
    ShowTips
};

@interface CountBeanViewController : UIViewController<UITextFieldDelegate,UIAlertViewDelegate,UIGestureRecognizerDelegate> {
    NSMutableSet *_beanSet;
    NSTimer *_timer;
    NSInteger _countTime;
    NSInteger _count;
    NSInteger _status;
    NSRange _countRange;
}
@property (retain, nonatomic) IBOutlet UIButton *startButton;
@property (retain, nonatomic) IBOutlet UITextField *resultTextField;
@property (retain, nonatomic) IBOutlet UIView *maskView;
@property (retain, nonatomic) IBOutlet UILabel *clockLabel;

- (void)startGame;
- (void)endGame:(BOOL)successful;

- (IBAction)clickStartButton:(id)sender;
- (id)initWithRange:(NSRange)range;

@end
