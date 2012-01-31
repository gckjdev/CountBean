//
//  LevelPickerController.h
//  CountBean
//
//  Created by  on 12-1-31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
enum {
    LowLevel = 1000,
    MediumLevel,
    HighLevel,
    SuperLevel
};

@interface LevelPickerController : UIViewController
- (IBAction)pickLevel:(id)sender;

@end
