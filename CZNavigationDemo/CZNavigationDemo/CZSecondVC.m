//
//  CZSecondVC.m
//  CZNavigationDemo
//
//  Created by new on 17/4/12.
//  Copyright © 2017年 it.sozi. All rights reserved.
//

#import "CZSecondVC.h"
#import "CZNavigationController.h"

@interface CZSecondVC ()

@end

@implementation CZSecondVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationBar.title = @"CZSecondVC";
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:[UIImage imageNamed:@"shareBtn_icon"] forState:UIControlStateNormal];
    [rightButton sizeToFit];
    [rightButton addTarget:self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationBar.rightButton = rightButton;
    
    //禁用pop交互手势
//    CZNavigationController *navVC = (CZNavigationController *)self.navigationController;
//    navVC.enablePopGesture = NO;
    
    //设置导航栏背景颜色
//    self.navigationBar.backgroundView.backgroundColor = [UIColor orangeColor];
    
    //显示navBar底部线条
//    self.navigationBar.line.hidden = NO;
}

- (void)rightButtonAction {
    NSLog(@"%s",__func__);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //导航栏的隐藏状态
    BOOL isHidden = self.navigationBarHidden;
    
    //设置导航栏隐藏或不隐藏
    [self setNavigationBarHidden:!isHidden animated:YES];
    //或者 self.navigationBarHidden = !isHidden;
}

- (void)willBePopped {
    NSLog(@"将要pop返回上一个界面。。。");
}

@end
