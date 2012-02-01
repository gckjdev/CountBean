//
//  CountBeanAppDelegate.h
//  CountBean
//
//  Created by gamy on 12-1-31.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CountBeanViewController;
@class LevelPickerController;
@class MainMenuController;
@interface CountBeanAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet MainMenuController *viewController;

@end
