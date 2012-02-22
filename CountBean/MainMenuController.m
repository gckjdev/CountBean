//
//  MainMenuController.m
//  CountBean
//
//  Created by  on 12-2-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MainMenuController.h"
#import "SettingController.h"
#import "LevelPickerController.h"
#import "HelpController.h"
#import "TopController.h"

@implementation MainMenuController
@synthesize helpButton;
@synthesize startButton;
@synthesize settingButton;
@synthesize topButton;

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
    [self.startButton setTitle:NSLocalizedString(@"Start", nil) forState:UIControlStateNormal];
    [self.settingButton setTitle:NSLocalizedString(@"Settings", nil) forState:UIControlStateNormal];
    [self.helpButton setTitle:NSLocalizedString(@"Help", nil) forState:UIControlStateNormal];    
    [self.topButton setTitle:NSLocalizedString(@"Top", nil) forState:UIControlStateNormal];    

}

- (void)viewDidUnload
{
    [self setHelpButton:nil];
    [self setStartButton:nil];
    [self setSettingButton:nil];
    [self setTopButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)clickPlayButton:(id)sender {
    LevelPickerController *levelPicker = [[LevelPickerController alloc] init];
    [self.navigationController pushViewController:levelPicker animated:YES];
    [levelPicker release];
}

- (IBAction)clickSetting:(id)sender {
    SettingController *setting = [[SettingController alloc] init];
    [self.navigationController pushViewController:setting animated:YES];
    [setting release];
}
- (void)dealloc {
    [helpButton release];
    [startButton release];
    [settingButton release];
    [topButton release];
    [super dealloc];
}
- (IBAction)clickHelpButton:(id)sender {
    HelpController *hc = [[HelpController alloc] init];
    [self.navigationController pushViewController:hc animated:YES];
    [hc release];
}

- (IBAction)clickTop:(id)sender {
    TopController *tc = [[TopController alloc] init];
    [self.navigationController pushViewController:tc animated:YES];
    [tc release];
}
@end
