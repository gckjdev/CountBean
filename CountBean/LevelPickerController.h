//
//  LevelPickerController.h
//  CountBean
//
//  Created by  on 12-1-31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CBController.h"
enum {
    LowLevel = 1000,
    MediumLevel,
    HighLevel,
    SuperLevel
};

@interface LevelPickerController : CBController
- (IBAction)pickLevel:(id)sender;
- (IBAction)clickBackButton:(id)sender;

@end
