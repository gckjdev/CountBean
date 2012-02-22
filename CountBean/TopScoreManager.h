//
//  TopScoreManager.h
//  CountBean
//
//  Created by  on 12-2-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TopScore;
@interface TopScoreManager : NSObject
{
    NSMutableArray *_topScoreList;
}
@property(nonatomic, retain)NSMutableArray *topScoreList;
+ (TopScoreManager *)defaultManager;
- (NSArray *)sortedList;
- (BOOL)isEmpty;
- (void)readData;
- (void)storeData;
- (void)addTopScore:(TopScore *)topScore;
@end

extern TopScoreManager *GlobalGetTopScoreManager();