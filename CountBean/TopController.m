//
//  TopController.m
//  CountBean
//
//  Created by  on 12-2-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TopController.h"
#import "TopScoreManager.h"
#import "TopScore.h"
#import "TopCell.h"

@implementation TopController
@synthesize topTable;
@synthesize topTitle;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _topManager = [TopScoreManager defaultManager];
        [_topManager readData];    
        _scoreArray = _topManager.sortedList;
        [_scoreArray retain];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return MIN(10, [_scoreArray count]);
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = [TopCell getCellIdentifier];
    TopCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [TopCell createCell];
    }
    TopScore *top = [_scoreArray objectAtIndex:indexPath.row];
    [cell setCellInfo:top rank:indexPath.row + 1];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44.0;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    TopHeaderView *topHeader = [[TopHeaderView alloc] init];
    topHeader.backgroundColor = [UIColor clearColor];
    return [topHeader autorelease];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [TopCell getCellHeight];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.topTitle setText:NSLocalizedString(@"Top", nil)];

}

- (void)viewDidUnload
{
    [self setTopTitle:nil];
    [self setTopTable:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)clickBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)dealloc {
    [topTitle release];
    [topTable release];
    [_scoreArray release];
    [super dealloc];
}

@end

#define HEADER_LBAEL_COLOR [UIColor colorWithRed:168/255.0 green:128/255.0 blue:88/255.0 alpha:1]
@implementation TopHeaderView

-(id)init{
    self = [super init];
    if (self) {

        _rank = [[UILabel alloc] initWithFrame:CGRectMake(0, 11, 100, 21)];
        [_rank setText:NSLocalizedString(@"Rank", nil)];
        [_rank setTextAlignment:UITextAlignmentCenter];   
        [_rank setBackgroundColor:[UIColor clearColor]];
        [_rank setTextColor:HEADER_LBAEL_COLOR];
        [self addSubview:_rank];
        [_rank release];
        
        _count = [[UILabel alloc] initWithFrame:CGRectMake(100, 11, 100, 21)];
        [_count setText:NSLocalizedString(@"Count", nil)];               
        [_count setTextAlignment:UITextAlignmentCenter];
        [_count setBackgroundColor:[UIColor clearColor]];
        [_count setTextColor:HEADER_LBAEL_COLOR];
        [self addSubview:_count];
        [_count release];
        
        _time = [[UILabel alloc] initWithFrame:CGRectMake(200, 11, 100, 21)];
        [_time setText:NSLocalizedString(@"Time", nil)];
        [_time setTextAlignment:UITextAlignmentCenter];
        [_time setBackgroundColor:[UIColor clearColor]];
        [_time setTextColor:HEADER_LBAEL_COLOR];
        [self addSubview:_time];
        [_time release];
    }
    return self;
}

@end