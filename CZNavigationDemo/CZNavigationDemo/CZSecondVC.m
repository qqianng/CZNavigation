//
//  CZSecondVC.m
//  CZNavigationDemo
//
//  Created by new on 17/4/12.
//  Copyright © 2017年 it.sozi. All rights reserved.
//

#import "CZSecondVC.h"
#import "UIViewController+CZNavigationController.h"

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
}

- (void)rightButtonAction {
    NSLog(@"%s",__func__);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self setNavigationBarHidden:!self.navigationBarHidden animated:YES];
}


@end
