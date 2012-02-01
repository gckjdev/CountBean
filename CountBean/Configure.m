//
//  Configure.m
//  CountBean
//
//  Created by  on 12-2-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Configure.h"

@implementation Configure

+ (NSInteger)getIntegerForKey:(NSString *)key
{
    if(key){
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        return [defaults integerForKey:key];   
    }
    return 0;
}
+ (void)setInteger:(NSInteger)value ForKey:(NSString *)key
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:value forKey:key];
    [defaults synchronize];
}

+ (NSInteger)getShowTime
{
    NSInteger time = [Configure getIntegerForKey:KEY_SHOW_TIME];
    return time == 0 ? DEFAULT_SHOW_TIME : time;
}
+ (NSInteger)getCountTime
{
    NSInteger time = [Configure getIntegerForKey:KEY_COUNT_TIME];
    return time == 0 ? DEFAULT_COUNT_TIME : time;
    
}
+ (void)setShowTime:(NSInteger)showTime
{
    [Configure setInteger:showTime ForKey:KEY_SHOW_TIME];
}

+ (void)setCountTime:(NSInteger)countTime
{
    [Configure setInteger:countTime ForKey:KEY_COUNT_TIME];
}

@end
