//
//  CZNavigationController.m
//  gzweibo
//
//  Created by apple on 15/5/5.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "CZNavigationController.h"

@interface CZNavigationController () <UIGestureRecognizerDelegate>

@end


@implementation CZNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置pop交互手势的代理
    self.interactivePopGestureRecognizer.delegate = self;
    self.navigationBarHidden = YES;
}

//pop手势是否可以使用，默认为yes。
- (void)setEnablePopGesture:(BOOL)enablePopGesture {
    _enablePopGesture = enablePopGesture;
    self.interactivePopGestureRecognizer.enabled = enablePopGesture;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    // Ignore interactive pop gesture when there is only one view controller on the navigation stack
    if (self.viewControllers.count <= 1) {
        return NO;
    }
    return YES;
}

#pragma mark - Delegate

//导航控制器显示新控制器时，会调用下面方法
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    viewController.automaticallyAdjustsScrollViewInsets = NO;
    //获取导航控制器的子控制器的个数
    NSInteger navChildCount = self.viewControllers.count;
    //设置导航栏
    CZNavigationBar *navigationBar = [CZNavigationBar navigationBar];
    navigationBar.title = viewController.title;
    viewController.navigationBar = navigationBar;
    
    if (navChildCount > 0 && !navigationBar.leftButton) {//如果viewController已经设置了leftButton，这里便不在设置。
        viewController.hidesBottomBarWhenPushed = YES;//就隐藏tabBar
        UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [leftButton setBackgroundImage:[UIImage imageNamed:@"fanhui"] forState:UIControlStateNormal];
        [leftButton sizeToFit];
        [leftButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        navigationBar.leftButton = leftButton;
    }
    
    //一定要调用父类的方法
    [super pushViewController:viewController animated:animated];
    
    //将添加自定义导航栏的过程调整为push之后，防止push前加载view，在viewController的viewDidLoad方法中获取不到导航控制器。
    [viewController.view addSubview:navigationBar];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    //恢复隐藏导航栏的默认状态。
    self.navigationBarHidden = YES;
    //通知topVC将要pop。
    [self.topViewController willBePopped];
    return [super popViewControllerAnimated:animated];
}

//返回上一个控制器
-(void)back{
    [self popViewControllerAnimated:YES];
}


@end
