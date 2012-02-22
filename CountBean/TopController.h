//
//  TopController.h
//  CountBean
//
//  Created by  on 12-2-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TopScoreManager;
@interface TopController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    TopScoreManager *_topManager;
    NSArray *_scoreArray;
}
@property (retain, nonatomic) IBOutlet UILabel *topTitle;
@property (retain, nonatomic) IBOutlet UILabel *rankTitle;
@property (retain, nonatomic) IBOutlet UILabel *countTitle;
@property (retain, nonatomic) IBOutlet UILabel *timeTitle;
- (IBAction)clickBack:(id)sender;
@property (retain, nonatomic) IBOutlet UITableView *topTable;
@end



@interface TopHeaderView : UIView {
@private
    UILabel *_rank, *_count, *_time;
}

- (id)init;

@end