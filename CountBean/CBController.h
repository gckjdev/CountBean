//
//  CBController.h
//  CountBean
//
//  Created by  on 12-2-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBController : UIViewController<UIGestureRecognizerDelegate, UITextFieldDelegate>
{
    UITapGestureRecognizer *_tapGesture;
    UIPanGestureRecognizer *_panGesture;
}

@property(nonatomic, assign, getter = isTapGestureRecognizerEnable) BOOL tapGestureRecognizerEnable;
@property(nonatomic, assign, getter = isPanGestureRecognizerEnable) BOOL panGestureRecognizerEnable;

- (void)performTapGesture:(UITapGestureRecognizer *)tap;
- (void)performPanGesture:(UIPanGestureRecognizer *)pan;
@end
