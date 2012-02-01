//
//  Configure.h
//  CountBean
//
//  Created by  on 12-2-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#define DEFAULT_COUNT_TIME 30
#define DEFAULT_SHOW_TIME 5
#define KEY_SHOW_TIME @"SHOW_TIME"
#define KEY_COUNT_TIME @"COUNT_TIME"

@interface Configure : NSObject


+ (NSInteger)getShowTime;
+ (NSInteger)getCountTime;
+ (void)setShowTime:(NSInteger)showTime;
+ (void)setCountTime:(NSInteger)countTime;
@end
