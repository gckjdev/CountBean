//
//  TopScore.h
//  CountBean
//
//  Created by  on 12-2-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TopScore : NSObject<NSCoding>
{
    
}

@property(nonatomic, assign)NSInteger score;
@property(nonatomic, assign)NSInteger showTime;

- (id)initWithScore:(NSInteger)score showTime:(NSInteger)showTime;
@end
