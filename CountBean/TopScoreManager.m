//
//  TopScoreManager.m
//  CountBean
//
//  Created by  on 12-2-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TopScoreManager.h"
#import "TopScore.h"
TopScoreManager * topScoreManager;

TopScoreManager *GlobalGetTopScoreManager()
{
    if (topScoreManager == nil) {
        topScoreManager = [[TopScoreManager alloc] init];
    }
    return topScoreManager;
}
@implementation TopScoreManager
@synthesize topScoreList = _topScoreList;

- (id)init
{
    self = [super init];
    if (self) {
        _topScoreList = [[NSMutableArray alloc] init];
        [self readData];
    }
    return self;
}

+ (TopScoreManager *)defaultManager
{
    return GlobalGetTopScoreManager();
}
#define TOP_DATA @"TOP_DATA"

- (void)addTopScore:(TopScore *)topScore
{
    [_topScoreList addObject:topScore];
    [self storeData];
}

- (void)createTestData
{
    for (int i = 0; i < 10; ++ i) {
        TopScore *score = [[TopScore alloc] initWithScore:rand() % 10 showTime:rand()%5];
        [_topScoreList addObject:score];
    }
}

- (void)readData
{
    NSUserDefaults* userDefault = [NSUserDefaults standardUserDefaults];
    NSData* data = [userDefault objectForKey:TOP_DATA];
    
    if (data) {
        self.topScoreList = [NSMutableArray arrayWithArray:[NSKeyedUnarchiver unarchiveObjectWithData:data]];
    }else{
       // [self createTestData];
        [self.topScoreList removeAllObjects];
    }
}
- (void)storeData
{
    NSUserDefaults* userDefault = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:_topScoreList];
    [userDefault setObject:data forKey:TOP_DATA];
    [userDefault synchronize];
}

- (NSArray *)sortedList
{
    return [self.topScoreList sortedArrayUsingComparator:^(id obj1, id obj2){
        //return 0;
        TopScore *top1 = (TopScore *)obj1;
        TopScore *top2 = (TopScore *)obj2;
        if (top1.score > top2.score) {
            return NSOrderedAscending;
        }else if(top1.score < top2.score)
        {
            return NSOrderedDescending;
        }else{
            if (top1.showTime < top2.showTime) {
                return NSOrderedAscending;
            }else{
                return NSOrderedDescending;
            }
        }
    }];
}
- (BOOL)isEmpty
{
    return [self.topScoreList count] == 0;
}

- (void)dealloc
{
    [_topScoreList release];
    [super dealloc];
}
@end
