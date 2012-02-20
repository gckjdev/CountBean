//
//  SettingController.h
//  CountBean
//
//  Created by  on 12-2-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CBController.h"
@interface SettingController : CBController
{
    
}
@property (retain, nonatomic) IBOutlet UITextField *showTime;
@property (retain, nonatomic) IBOutlet UITextField *countTime;
@property (retain, nonatomic) IBOutlet UILabel *settingsTitle;
@property (retain, nonatomic) IBOutlet UILabel *showTimeLabel;
@property (retain, nonatomic) IBOutlet UILabel *countLabel;
- (IBAction)clickBack:(id)sender;
- (IBAction)clickComfirm:(id)sender;
@end
