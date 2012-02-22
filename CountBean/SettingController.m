//
//  SettingController.m
//  CountBean
//
//  Created by  on 12-2-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SettingController.h"
#import "Configure.h"
@implementation SettingController
@synthesize showTime;
@synthesize countTime;
@synthesize settingsTitle;
@synthesize showTimeLabel;
@synthesize countLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTapGestureRecognizerEnable:YES];
    NSInteger showTimeValue = [Configure getShowTime];
    NSInteger countTimeValue = [Configure getCountTime];
    [showTime setText:[NSString stringWithFormat:@"%d",showTimeValue]];
    [countTime setText:[NSString stringWithFormat:@"%d",countTimeValue]];
    [self.settingsTitle setText:NSLocalizedString(@"Settings", nil)];
    [self.showTimeLabel setText:NSLocalizedString(@"Showing Time", nil)];
    [self.countLabel setText:NSLocalizedString(@"Counting Time", nil)];
}

- (void)viewDidUnload
{
    [self setShowTime:nil];
    [self setCountTime:nil];
    [self setSettingsTitle:nil];
    [self setShowTimeLabel:nil];
    [self setCountLabel:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [showTime release];
    [countTime release];
    [settingsTitle release];
    [showTimeLabel release];
    [countLabel release];
    [super dealloc];
}

- (void)setShowTimeWithInteger:(NSInteger)time
{
    [self.showTime setText:[NSString stringWithFormat:@"%d",time]];
}

- (void)setCountTimeWithInteger:(NSInteger)time
{
    [self.countTime setText:[NSString stringWithFormat:@"%d",time]];
}

- (void)performTapGesture:(UITapGestureRecognizer *)tap
{
    [showTime resignFirstResponder];
    [countTime resignFirstResponder];
    
    NSInteger showT = [showTime.text integerValue];
    NSInteger countT = [countTime.text integerValue];
    if (showT < MIN_SHOW_TIME || showT > MAX_SHOW_TIME) {
        [self setShowTimeWithInteger:[Configure getShowTime]];
    }
    if (countT < MIN_COUNT_TIME || countT > MAX_COUNT_TIME) {
        [self setCountTimeWithInteger:[Configure getCountTime]];
    }

}

- (IBAction)clickBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)clickComfirm:(id)sender {
    NSInteger showT = [showTime.text integerValue];
    NSInteger countT = [countTime.text integerValue];
    [Configure setShowTime:showT];
    [Configure setCountTime:countT];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)clickDefaultSettings:(id)sender {
    [self setCountTimeWithInteger:DEFAULT_COUNT_TIME];
    [self setShowTimeWithInteger:DEFAULT_SHOW_TIME];
    [Configure setShowTime:DEFAULT_SHOW_TIME];
    [Configure setCountTime:DEFAULT_COUNT_TIME];
}
@end
