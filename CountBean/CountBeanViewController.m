//
//  CountBeanViewController.m
//  CountBean
//
//  Created by gamy on 12-1-31.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "CountBeanViewController.h"
#import "LevelPickerController.h"
#import "Configure.h"
#import "CBResource.h"


@implementation CountBeanViewController
@synthesize titleBar = _titleBar;
@synthesize retainTime = _retainTime;
@synthesize resultTextField = _resultTextField;
@synthesize maskView = _maskView;
@synthesize clockLabel = _clockLabel;

- (id)initWithLevel:(NSInteger)level Range:(NSRange)range;
{
    self = [super init];
    if (self) {
        _level = level;
        _countRange = range;
    }
    return self;
}

- (void)dealloc
{
    [_beanSet release];
    [_maskView release];
    [_clockLabel release];
    [_resultTextField release];
    [_retainTime release];
    [_titleBar release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (void) releaseBeanSet
{
    if (_beanSet == nil) {
        return;
    }
    for (UIImageView *bean in _beanSet) {
        [bean removeFromSuperview];
    }
    [_beanSet removeAllObjects];
}

- (CGFloat)distanceFrom:(CGPoint)from to:(CGPoint)to
{
    return sqrtf(powf(from.x - to.x , 2) + powf(from.y - to.y , 2));
}
- (CGPoint)randBeanCenter
{
    while (YES) {
        NSInteger x = (rand() % (320 - 60)) + 20;
        NSInteger y = rand() % 300 + 60;
        CGPoint retPoint = CGPointMake(x, y);
        BOOL endLoop = YES;
        for (UIImageView *beanView in _beanSet) {
            CGPoint center = beanView.center;
            if ([self distanceFrom:retPoint to:center] < 20) {
                endLoop = NO;
                break;
            }
        }
        if (endLoop) {
            return retPoint;
        }
    }
}

- (void) addBeans:(BeanType) beanType withCount:(NSInteger)count
{
    [self releaseBeanSet];
    UIImage *beanImage = nil;
    switch (beanType) {
        case GreenBean:
            beanImage = [UIImage imageNamed:@"greenBean.png"];
            break;
        default:
            break;
    }
    if (beanImage) {
        for (int i = 0;  i < count; ++ i) {
            UIImageView *beanView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 16, 16)];
            [beanView setImage:beanImage];
            [beanView setCenter:[self randBeanCenter]];
            [self.view addSubview:beanView];
            [_beanSet addObject:beanView];
            [beanView release];
        }
    }
}


- (void)commitResult
{
    [self.resultTextField resignFirstResponder];
    if (self.resultTextField.text && self.resultTextField.text.length != 0) {
        NSInteger count = [self.resultTextField.text integerValue];
        [self endGame:(count == _count)];    
    }
}


- (void)performTapMainView:(UITapGestureRecognizer *)tap
{
    if (tap.view == self.view) {
    }else if(tap.view == self.maskView && !self.maskView.hidden){
        [self commitResult];
    }else{
        [self.resultTextField resignFirstResponder];
    }
        
}


- (void)setTitleBar
{
    NSString *levelString = [LevelPickerController levelStringForLevel:_level];
    NSString *countString = [NSString  stringWithFormat:@"%d ~ %d",_countRange.location, _countRange.location + _countRange.length];
    NSString *titleFormat = NSLocalizedString(@"Level: %@ Number: %@", nil);
    NSString *title = [NSString stringWithFormat:titleFormat,levelString,countString];
    [self.titleBar setTitle:title forState:UIControlStateNormal];
    [self.titleBar setUserInteractionEnabled:NO];
}
#pragma mark - View lifecycle


- (void)viewWillDisappear:(BOOL)animated
{
    [self stopTimer];
    [super viewWillDisappear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitleBar];
    srand(time(0));
    _beanSet = [[NSMutableSet alloc] init];
    
    UITapGestureRecognizer *tapMaskViewRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(performTapMainView:)];
    [self.maskView addGestureRecognizer:tapMaskViewRecognizer];
    [tapMaskViewRecognizer release];
    [self.resultTextField setPlaceholder:NSLocalizedString(@"Please input the number of beans", nil)];
    [self startGame];
}


- (void)viewDidUnload
{
    [self setMaskView:nil];
    [self setClockLabel:nil];
    [self setResultTextField:nil];
    [self setRetainTime:nil];
    [self setTitleBar:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



- (NSInteger)countForBean
{

    if (_countRange.length == 0) {
        return _countRange.location;
    }
    return rand() % _countRange.length + _countRange.location;
}

- (void)setClockLabelWithSeconds:(NSInteger)seconds
{
    if (seconds < 0) {
        seconds = 0;
    }
    [self.clockLabel setText:[NSString stringWithFormat:@"%d",seconds]];
}


- (void)clock:(NSTimer *)theTimer
{
    _countTime --;
    if (_countTime == 0) {
        [self endGame:Timeout];
    }
    [self setClockLabelWithSeconds:_countTime];
}

- (void)stopTimer
{
    if (_timer) {
        if ([_timer isValid]) {
            [_timer invalidate];
        }
        _timer = nil;
    }
}


- (void) startClockTimer:(CFTimeInterval)interval 
{
    [self stopTimer];
     _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(clock:) userInfo:nil repeats:YES];
    _countTime = interval;
    [self setClockLabelWithSeconds:_countTime];
}


- (void)startCounter
{
    NSInteger countTime = [Configure getCountTime];
    [self startClockTimer:countTime];
}


- (void)setBeanSetHidden:(BOOL)hidden
{
    for (UIImageView *beanView in _beanSet) {
        [beanView setHidden:hidden];
    }
}


- (void)showBeans
{
    _status = ShowBeans;
    [self.maskView setHidden:YES];
    [self.clockLabel setHidden:YES];
    [self.resultTextField setHidden:YES];
    [self setBeanSetHidden:NO];
    [self.resultTextField resignFirstResponder];
}

- (void)hideBeans
{
    _status = HideBeans;
    [self setBeanSetHidden:YES];
    [self.maskView setHidden:NO];
    [self.clockLabel setHidden:NO];
    [self.resultTextField setHidden:NO];
    [self.resultTextField setText:nil];
    [self.resultTextField becomeFirstResponder];

}

- (void)endShowBeans:(NSTimer*)theTimer
{
    [self stopTimer];
    [self hideBeans];
    [self startCounter];
}

- (void)setShowTime:(NSInteger)showTime
{
    _showTime = showTime;
    [self.retainTime setText:[NSString stringWithFormat:@"%d",_showTime]];
}

- (void)showTimeClock:(NSTimer *)theTimer
{
    [self setShowTime: --_showTime];
    if (_showTime == 0) {
        [self endShowBeans:theTimer];
    }
}
- (void) startMemoryTimer:(CFTimeInterval)interval
{
    [self stopTimer];
    [self setShowTime:interval];
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(showTimeClock:) userInfo:nil repeats:YES];
}

- (IBAction)clickBackButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)clickReplayButton:(id)sender {
    [self startGame];
}

- (void)rePlay
{
    [self showBeans];
    NSInteger showTime = [Configure getShowTime];
    [self startMemoryTimer:showTime];
}

- (void)startGame
{
    _count = [self countForBean];
    [self addBeans:GreenBean withCount:_count];
    [self showBeans];
    NSInteger showTime = [Configure getShowTime];
    [self startMemoryTimer:showTime];

}

- (void)endGame:(NSInteger)endType
{
    [self stopTimer];
    if (_status == ShowTips) {
        return;
    }
    _status = ShowTips;
    [self.resultTextField resignFirstResponder];

    CBAlertView *endAlert = nil;
    NSString *title, *msg;
    NSArray *array = nil;
    
//    "Pass" = "过关";
//    
//    "An Other Challenge?" = "恭喜过关！继续接受下一局的挑战？";
//    
//    "Time Out" = "超时";
//    
//    "Improve Your Speed. Replay?" = "要加快速度啦！重玩？";
//    
//    "Failure" = "失败";
//    
//    "You Are Wrong. Replay?" = "很遗憾，数错了！重玩？";

    
    if (endType == Successful) {
        title = NSLocalizedString(@"Pass", nil);
        msg = NSLocalizedString(@"An Other Challenge?", nil);
        array = [NSArray arrayWithObjects:BACK_IMAGE, REPLAY_IMAGE, NEXT_IMAGE, nil];
    }else if(endType == Timeout){
        title = NSLocalizedString(@"Timeout", nil);
        msg = NSLocalizedString(@"Improve Your Speed. Replay?", nil);
        array = [NSArray arrayWithObjects:BACK_IMAGE, REPLAY_IMAGE, nil];
    }else{
        title = NSLocalizedString(@"Failure", nil);
        msg = NSLocalizedString(@"You Are Wrong. Replay?", nil);
        array = [NSArray arrayWithObjects:BACK_IMAGE, REPLAY_IMAGE, nil];
    }
    endAlert = [[CBAlertView alloc] initWithTitle:title message:msg delegate:self images:array];
    [endAlert showWithSuperView:self.view];
    [endAlert release];

    
}

- (void)alertView:(CBAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [self clickBackButton:nil];
    }else if(buttonIndex == 1)
    {
        [self rePlay];
    }else{
        [self startGame];
    }

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self commitResult];
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ([gestureRecognizer isKindOfClass:[UITapGestureRecognizer class]]) {
        return (gestureRecognizer.view == self.view) || gestureRecognizer.view == self.maskView;    
    }else
    {
        return gestureRecognizer.view == self.view;
    }
}

@end
