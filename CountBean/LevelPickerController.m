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
@synthesize levelTitle;
@synthesize mediuLevel;
@synthesize lowLevel;
@synthesize highLevel;
@synthesize superLevel;

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
    [self.levelTitle setText:NSLocalizedString(@"Level Selection", nil)];
    [self.lowLevel setTitle:NSLocalizedString(@"Low", nil) forState:UIControlStateNormal];
    [self.mediuLevel setTitle:NSLocalizedString(@"Mediu", nil) forState:UIControlStateNormal];
    [self.highLevel setTitle:NSLocalizedString(@"High", nil) forState:UIControlStateNormal];
    [self.superLevel setTitle:NSLocalizedString(@"Super", nil) forState:UIControlStateNormal];
}

- (void)viewDidUnload
{
    [self setLevelTitle:nil];
    [self setLowLevel:nil];
    [self setMediuLevel:nil];
    [self setHighLevel:nil];
    [self setSuperLevel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

+ (NSString *)levelStringForLevel:(NSInteger)level
{
    switch (level) {
        case MediumLevel:
            return  NSLocalizedString(@"Mediu", nil);
        case HighLevel:
            return  NSLocalizedString(@"High", nil);
        case SuperLevel:
            return  NSLocalizedString(@"Super", nil);
        case LowLevel:
            return  NSLocalizedString(@"Low", nil);
        default:
            return  nil;
    }
}

- (IBAction)pickLevel:(id)sender {
    NSInteger tag = ((UIButton *)sender).tag;
    NSRange range;
    switch (tag) {
        case MediumLevel:
            range = NSMakeRange(10, 10);
            break;
        case HighLevel:
            range = NSMakeRange(20, 15);
            break;
        case SuperLevel:
            range = NSMakeRange(30, 20);
            break;
        case LowLevel:
        default:
            range = NSMakeRange(5, 5);
            break;
    }
    CountBeanViewController *countBeans = [[CountBeanViewController alloc] initWithLevel:tag Range:range];
    [self.navigationController pushViewController:countBeans animated:YES];
    [countBeans release];
}

- (IBAction)clickBackButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)dealloc {
    [levelTitle release];
    [lowLevel release];
    [mediuLevel release];
    [highLevel release];
    [superLevel release];
    [super dealloc];
}
@end
