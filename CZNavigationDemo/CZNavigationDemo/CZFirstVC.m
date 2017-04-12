//
//  CZFirstVC.m
//  CZNavigationDemo
//
//  Created by new on 17/4/12.
//  Copyright © 2017年 it.sozi. All rights reserved.
//

#import "CZFirstVC.h"
#import "UIViewController+CZNavigationController.h"
#import "CZSecondVC.h"

@interface CZFirstVC ()

@end

@implementation CZFirstVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationBar.title = @"CZFirstVC";
    UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [leftButton setTitle:@"客服" forState:UIControlStateNormal];
    leftButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [leftButton sizeToFit];
    self.navigationBar.leftButton = leftButton;
    
    UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [rightButton setImage:[UIImage imageNamed:@"gouwudai"] forState:UIControlStateNormal];
    [rightButton sizeToFit];
    [rightButton addTarget:self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationBar.rightButton = rightButton;
}

- (void)rightButtonAction {
    CZSecondVC *secondVC = [[CZSecondVC alloc] init];
    [self.navigationController pushViewController:secondVC animated:YES];
}

@end
