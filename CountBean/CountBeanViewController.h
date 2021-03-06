//
//  CountBeanViewController.h
//  CountBean
//
//  Created by gamy on 12-1-31.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CBAlertView.h"
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

enum  {
    Fail = 0,
    Successful = 1,
    Timeout = 2
};

@interface CountBeanViewController : UIViewController<UITextFieldDelegate,UIGestureRecognizerDelegate, CBAlertViewDelegate> {
    NSMutableSet *_beanSet;
    NSTimer *_timer;
    NSInteger _countTime;
    NSInteger _count;
    NSInteger _status;
    NSRange _countRange;
    NSInteger _showTime;
    NSInteger _level;
}
@property (retain, nonatomic) IBOutlet UITextField *resultTextField;
@property (retain, nonatomic) IBOutlet UIImageView *maskView;
@property (retain, nonatomic) IBOutlet UILabel *clockLabel;

- (IBAction)clickBackButton:(id)sender;
- (IBAction)clickReplayButton:(id)sender;

@property (retain, nonatomic) IBOutlet UIButton *titleBar;
@property (retain, nonatomic) IBOutlet UILabel *retainTime;
- (void)startGame;
- (void)endGame:(NSInteger)endType;
- (void)stopTimer;
//- (IBAction)clickStartButton:(id)sender;
- (id)initWithLevel:(NSInteger)level Range:(NSRange)range;

@end
