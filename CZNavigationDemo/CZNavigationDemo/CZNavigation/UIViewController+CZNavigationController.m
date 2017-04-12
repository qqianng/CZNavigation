//
//  UIViewController+CZNavigationController.m
//  transitionDemo
//
//  Created by new on 17/1/12.
//  Copyright © 2017年 it.sozi. All rights reserved.
//

#import "UIViewController+CZNavigationController.h"
#import <objc/runtime.h>
static const CGFloat CZNavBarHideShowDuration = 0.25;

static void *navigationBarKey = "navigationBarKey";

@implementation UIViewController (CZNavigationController)


- (void)setNavigationBar:(CZNavigationBar *)navigationBar {
    [self.navigationBar removeFromSuperview];
    objc_setAssociatedObject(self, navigationBarKey, navigationBar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    if (self.title) {
        navigationBar.title = self.title;
    }
    //如果状态栏是由控制器来管理，可以通过控制器来获取状态栏的状态。
    CGFloat y;
    if (self.prefersStatusBarHidden) {
        y = 0;
    } else {
        y = 20;
    }
    navigationBar.frame = CGRectMake(0, y, navigationBar.bounds.size.width, navigationBar.bounds.size.height);
}

- (CZNavigationBar *)navigationBar {
    CZNavigationBar *navigationBar = objc_getAssociatedObject(self, navigationBarKey);
    return navigationBar;
}

- (void)setNavigationBarHidden:(BOOL)hidden {
    [self setNavigationBarHidden:hidden animated:NO];
}

- (void)setNavigationBarHidden:(BOOL)hidden animated:(BOOL)animated {
    CGFloat y;
    if (self.prefersStatusBarHidden) {
        y = 0;
    } else {
        y = 20;
    }
    CGFloat width = self.navigationBar.bounds.size.width;
    CGFloat height = self.navigationBar.bounds.size.height;
    
    if (hidden) {
        if (animated) {
            [UIView animateWithDuration:CZNavBarHideShowDuration animations:^{
                self.navigationBar.frame = CGRectMake(0, -height, width, height);
            }];
        } else {
            self.navigationBar.frame = CGRectMake(0, -height, width, height);
        }
    } else {
        if (animated) {
            [UIView animateWithDuration:CZNavBarHideShowDuration animations:^{
                self.navigationBar.frame = CGRectMake(0, y, width, height);
            }];
        } else {
            self.navigationBar.frame = CGRectMake(0, y, width, height);
        }
    }
}

- (BOOL)navigationBarHidden {
    CGFloat height = self.navigationBar.bounds.size.height;
    if (self.navigationBar.frame.origin.y == -height) {
        return YES;
    } else {
        return NO;
    }
}

- (void)willBePopped {}

@end
