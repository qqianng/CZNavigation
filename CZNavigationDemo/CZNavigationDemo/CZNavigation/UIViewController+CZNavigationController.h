//
//  UIViewController+CZNavigationController.h
//  transitionDemo
//
//  Created by new on 17/1/12.
//  Copyright © 2017年 it.sozi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CZNavigationBar.h"

@interface UIViewController (CZNavigationController)

- (void)setNavigationBar:(CZNavigationBar *)navigationBar;
- (CZNavigationBar *)navigationBar;

- (void)setNavigationBarHidden:(BOOL)hidden;
- (void)setNavigationBarHidden:(BOOL)hidden animated:(BOOL)animated;
- (BOOL)navigationBarHidden;


- (void)willBePopped;//当前控制器将被pop时调用,默认实现为空，子类可以重写这个方法来做些自定义操作。

@end
