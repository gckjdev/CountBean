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
//    [self setPanGestureRecognizerEnable:YES];
    [self setTapGestureRecognizerEnable:YES];
    NSInteger showTimeValue = [Configure getShowTime];
    NSInteger countTimeValue = [Configure getCountTime];
    [showTime setText:[NSString stringWithFormat:@"%d",showTimeValue]];
    [countTime setText:[NSString stringWithFormat:@"%d",countTimeValue]];

}

- (void)viewDidUnload
{
    [self setShowTime:nil];
    [self setCountTime:nil];
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
    [super dealloc];
}

- (void)performTapGesture:(UITapGestureRecognizer *)tap
{
    [showTime resignFirstResponder];
    [countTime resignFirstResponder];
    [Configure setCountTime:[countTime.text integerValue]];
    [Configure setShowTime:[showTime.text integerValue]];
}


- (IBAction)clickBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
