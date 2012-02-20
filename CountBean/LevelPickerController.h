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
@property (retain, nonatomic) IBOutlet UILabel *levelTitle;
@property (retain, nonatomic) IBOutlet UIButton *mediuLevel;
@property (retain, nonatomic) IBOutlet UIButton *lowLevel;
@property (retain, nonatomic) IBOutlet UIButton *highLevel;
@property (retain, nonatomic) IBOutlet UIButton *superLevel;
- (IBAction)pickLevel:(id)sender;
- (IBAction)clickBackButton:(id)sender;
+ (NSString *)levelStringForLevel:(NSInteger)level;
@end
