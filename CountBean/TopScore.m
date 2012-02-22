//
//  TopScore.m
//  CountBean
//
//  Created by  on 12-2-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TopScore.h"
#define SCORE_KEY @"SCORE_KEY"
#define SHOW_TIME_KEY @"SHOW_TIME_KEY"
@implementation TopScore
@synthesize score = _score;
@synthesize showTime = _showTime;


- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeInteger:_score forKey:SCORE_KEY];
    [aCoder encodeInteger:_showTime forKey:SHOW_TIME_KEY];
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.score = [aDecoder decodeIntegerForKey:SCORE_KEY];
        self.showTime = [aDecoder decodeIntegerForKey:SHOW_TIME_KEY];
    }
    return self;
}

- (id)initWithScore:(NSInteger)score showTime:(NSInteger)showTime
{
    self = [super init];
    if (self) {
        self.score = score;
        self.showTime = showTime;
    }
    return self;
}

@end
