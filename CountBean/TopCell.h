//
//  TopCell.h
//  CountBean
//
//  Created by  on 12-2-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TopScore;
@interface TopCell : UITableViewCell

@property (retain, nonatomic) IBOutlet UILabel *rankLabel;
@property (retain, nonatomic) IBOutlet UILabel *countLabel;
@property (retain, nonatomic) IBOutlet UILabel *showTimeLabel;

+ (TopCell *)createCell;
+ (NSString*)getCellIdentifier;
+ (CGFloat)getCellHeight;
- (void)setCellInfo:(TopScore *)topScore rank:(NSInteger)rank;
@end
