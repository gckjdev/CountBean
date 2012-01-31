//
//  CountBeanViewController.m
//  CountBean
//
//  Created by gamy on 12-1-31.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "CountBeanViewController.h"
#define SHOW_TIME 4
#define COUNT_TIME 30


@implementation CountBeanViewController
@synthesize resultTextField = _resultTextField;
@synthesize maskView = _maskView;
@synthesize clockLabel = _clockLabel;
@synthesize startButton = _startButton;

- (id)initWithRange:(NSRange)range
{
    self = [super init];
    if (self) {
        _countRange = range;
    }
    return self;
}

- (void)dealloc
{
    [_beanSet release];
    [_startButton release];
    [_maskView release];
    [_clockLabel release];
    [_resultTextField release];
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
        NSInteger x = (rand() % (320 - 40)) + 20;
        NSInteger y = (rand() % (480 - 60)) + 30;
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


- (void)performTapMainView:(UITapGestureRecognizer *)tap
{
    if (tap.view == self.view) {
        [self startGame];
    }else{
        [self.resultTextField resignFirstResponder];
    }
}

- (void)performPanMainView:(UIPanGestureRecognizer *)pan
{
    if (pan.state == UIGestureRecognizerStateEnded) {
        CGPoint translation = [pan translationInView:self.view];
        if (translation.x < 0) {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    srand(time(0));
    _beanSet = [[NSMutableSet alloc] init];
    UITapGestureRecognizer *tapMainViewRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(performTapMainView:)];
    [self.view addGestureRecognizer:tapMainViewRecognizer];
    [tapMainViewRecognizer release];

    
    UIPanGestureRecognizer *panMainViewRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(performPanMainView:)];
    [self.view addGestureRecognizer:panMainViewRecognizer];
    [panMainViewRecognizer release];

    
    UITapGestureRecognizer *tapMaskViewRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(performTapMainView:)];
    [self.maskView addGestureRecognizer:tapMaskViewRecognizer];
    [tapMaskViewRecognizer release];
}


- (void)viewDidUnload
{
    [self setStartButton:nil];
    [self setMaskView:nil];
    [self setClockLabel:nil];
    [self setResultTextField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
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
        [_timer invalidate];
        _timer = nil;
        [self endGame:NO];
    }
    [self setClockLabelWithSeconds:_countTime];
}

- (void)stopTimer
{
    if (_timer) {
        [_timer invalidate];
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
    [self startClockTimer:COUNT_TIME];
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
    [self.startButton setHidden:YES];
    [self.maskView setHidden:YES];
    [self.clockLabel setHidden:YES];
    [self.resultTextField setHidden:YES];
    [self setBeanSetHidden:NO];
}

- (void)hideBeans
{
    _status = HideBeans;
    [self setBeanSetHidden:YES];
    [self.startButton setHidden:NO];
    [self.maskView setHidden:NO];
    [self.clockLabel setHidden:NO];
    [self.resultTextField setHidden:NO];
}

- (void)endShowBeans:(NSTimer*)theTimer
{
    [self hideBeans];
    [self startCounter];
}

- (void) startMemoryTimer:(CFTimeInterval)interval
{
    [self stopTimer];
    _timer = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(endShowBeans:) userInfo:nil repeats:NO];
}

- (void)startGame
{
    _count = [self countForBean];
    [self addBeans:GreenBean withCount:_count];
    [self showBeans];
    [self startMemoryTimer:SHOW_TIME];

}

- (IBAction)clickStartButton:(id)sender {
    [self startGame];
}

- (void)endGame:(BOOL)successful
{
 
    if (_status == ShowTips) {
        return;
    }
    _status = ShowTips;
    [self stopTimer];
    [self.resultTextField resignFirstResponder];
    UIAlertView *endAlert = nil;
    NSString *title, *msg, *buttonTitle;
    
    if (successful) {
        title = @"过关";
        msg = @"恭喜你过关了，继续接受下一关的挑战？";
        buttonTitle = @"下一关";
    }else{
        title = @"失败";
        msg = [NSString stringWithFormat:@"正确个数:%d,失败乃成功之母，重玩一局？",_count];
        buttonTitle = @"重玩";
    }
    endAlert= [[UIAlertView alloc] initWithTitle:title message:msg delegate:self cancelButtonTitle:@"查看" otherButtonTitles:buttonTitle, nil];
    [endAlert show];
    [endAlert release];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [self showBeans];
    }else if(buttonIndex == 1)
    {
        [self startGame];
    }
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSInteger count = [textField.text integerValue];
    [self endGame:(count == _count)];    
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
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
