//
//  HelpController.h
//  CountBean
//
//  Created by  on 12-2-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelpController : UIViewController
{
    
}
@property (retain, nonatomic) IBOutlet UITextView *helpText;

@property (retain, nonatomic) IBOutlet UILabel *helpTitle;
- (IBAction)clickBack:(id)sender;
@end
