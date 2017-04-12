//
//  CZNavigationBar.h
//  transitionDemo
//
//  Created by new on 17/1/13.
//  Copyright © 2017年 it.sozi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CZNavigationBar : UIView

@property (nonatomic,copy) NSString *title;
@property (nonatomic,strong) UIView *titleView;
@property (nonatomic,strong) UIButton *leftButton;
@property (nonatomic,strong) UIButton *rightButton;
@property (nonatomic,strong) UIView *backgroundView;//default color is white color.
@property (nonatomic,strong,readonly) UIView *line;//navBar底部的线条，默认隐藏。

+ (instancetype)navigationBar;

@end
