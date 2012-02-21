//
//  HelpController.m
//  CountBean
//
//  Created by  on 12-2-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "HelpController.h"

@implementation HelpController
@synthesize helpText;

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
        [self.helpText setText:NSLocalizedString(@"Rules:\n\n1) Select the appropriate level then enter the game.\n\n2) There will be N small beans random distribution on the screen. Do not rush to count the number of beans, just photo the screen with your mind. The page will stay default for 5 seconds (user can modify it in the settings page).\n\n3) Beans disappeared, closes eyes, and then review the image in your eyes and count the beans in your mind. This process is time limited to 30 seconds (user can modify it in the settings page).\n\n4) Input the number of beans in the text field, if the number is mathched, you win. If the number is not matched or timeout, you lose.\n\n5) With the constant exercise, your memory will be enhanced, then you can challenge the next level of difficulty.\n\nGame Description:\n\n    Image memory function, photographic memory to use the right brain and right brain hippocampus moment to capture the information function, the memory of things become easy and simple, it will be all the information into the image, like a camera taking pictures, the intake of brain freeze as a The images remain in my mind permanently, used with the check, and re-integration of the information needed.\n\n    Learn how to use the right brain photographic memory function, can greatly improve the level of memory, to remember a lot of information quickly. Keep in mind the information will be deeply engraved in the brain, and can be permanently stored until use when will be the same as the picture clearly to me in my mind.\n\n    Number beans is a good way to cultivate the ability of photographic memory, not only can greatly improve the efficiency of memory, more able to develop the right brain potential. Every day early in the evening to spend a few minutes of exercise, will greatly enhance the efficiency of memory." , nil)];
//    [self.helpText setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"paper.png"]]];
}

- (void)viewDidUnload
{
    [self setHelpText:nil];
    [super viewDidUnload];

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [helpText release];
    [super dealloc];
}
- (IBAction)clickBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
