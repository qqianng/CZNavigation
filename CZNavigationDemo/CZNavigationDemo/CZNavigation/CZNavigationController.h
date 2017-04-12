//
//  CZNavigationController.h
//  gzweibo
//
//  Created by apple on 15/5/5.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CZNavigationBar.h"
#import "UIViewController+CZNavigationController.h"


@interface CZNavigationController : UINavigationController <UINavigationControllerDelegate>

@property (nonatomic,assign) BOOL enablePopGesture;//pop手势是否可以使用，默认为yes。

@end
