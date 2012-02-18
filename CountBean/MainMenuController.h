//
//  MainMenuController.h
//  CountBean
//
//  Created by  on 12-2-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainMenuController : UIViewController

- (IBAction)clickPlayButton:(id)sender;
- (IBAction)clickSetting:(id)sender;
- (IBAction)clickHelpButton:(id)sender;

@property (retain, nonatomic) IBOutlet UIButton *helpButton;
@property (retain, nonatomic) IBOutlet UIButton *startButton;
@property (retain, nonatomic) IBOutlet UIButton *settingButton;

@end
