//
//  TopCell.m
//  CountBean
//
//  Created by  on 12-2-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TopCell.h"
#import "TopScore.h"
@implementation TopCell
@synthesize rankLabel;
@synthesize countLabel;
@synthesize showTimeLabel;

+ (TopCell *)createCell
{
    NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"TopCell" owner:self options:nil];
    // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).  
    if (topLevelObjects == nil || [topLevelObjects count] <= 0){
        NSLog(@"create <TopCell> but cannot find cell object from Nib");
        return nil;
    }
    TopCell* cell =  (TopCell*)[topLevelObjects objectAtIndex:0];
    return cell;
    
}

+ (NSString*)getCellIdentifier
{
    return @"TopCell";
}
+ (CGFloat)getCellHeight
{
    return 44.0;   
}

- (void)setCellInfo:(TopScore *)topScore rank:(NSInteger)rank
{
    if (topScore) {
        
        [rankLabel setText:[NSString stringWithFormat:@"%d",rank]];
        [countLabel setText:[NSString stringWithFormat:@"%d",topScore.score]];
        [showTimeLabel setText:[NSString stringWithFormat:@"%d",topScore.showTime]];
    }
}
- (void)dealloc {
    [rankLabel release];
    [countLabel release];
    [showTimeLabel release];
    [super dealloc];
}
@end
