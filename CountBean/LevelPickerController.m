//
//  LevelPickerController.m
//  CountBean
//
//  Created by  on 12-1-31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LevelPickerController.h"
#import "CountBeanViewController.h"
@implementation LevelPickerController

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
 //   [self setPanGestureRecognizerEnable:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)pickLevel:(id)sender {
    NSInteger tag = ((UIButton *)sender).tag;
    NSRange range;
    switch (tag) {
        case MediumLevel:
            range = NSMakeRange(10, 9);
            break;
        case HighLevel:
            range = NSMakeRange(20, 9);
            break;
        case SuperLevel:
            range = NSMakeRange(30, 19);
            break;
        case LowLevel:
        default:
            range = NSMakeRange(5, 5);
            break;
    }
    CountBeanViewController *countBeans = [[CountBeanViewController alloc] initWithRange:range];
    [self.navigationController pushViewController:countBeans animated:YES];
    [countBeans release];
}

- (IBAction)clickBackButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
