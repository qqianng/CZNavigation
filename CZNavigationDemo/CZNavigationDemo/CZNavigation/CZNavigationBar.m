//
//  CZNavigationBar.m
//  transitionDemo
//
//  Created by new on 17/1/13.
//  Copyright © 2017年 it.sozi. All rights reserved.
//

#import "CZNavigationBar.h"

static const CGFloat navBarH = 44.0;
#define UIScreenW [UIScreen mainScreen].bounds.size.width
#define CZTitleViewMaxWidth (UIScreenW-100)


@interface CZNavigationBar ()
@property (nonatomic,strong) UIView *line;
@end


@implementation CZNavigationBar

+ (instancetype)navigationBar {
    CZNavigationBar *navigationBar = [[self alloc] initWithFrame:CGRectMake(0, 0, UIScreenW, navBarH)];
    return navigationBar;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, -20, frame.size.width, frame.size.height+20)];
        backgroundView.backgroundColor = [UIColor whiteColor];
        [self addSubview:backgroundView];
        self.backgroundView = backgroundView;
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, frame.size.height-0.5, frame.size.width, 0.5)];
        line.backgroundColor = [UIColor blackColor];
        [self addSubview:line];
        line.hidden = YES;
        self.line = line;
    }
    return self;
}

- (void)setTitle:(NSString *)title {
    if ([_title isEqualToString:title]) {
        return;
    }
    
    [_titleView removeFromSuperview];
    _title = title;
    
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectZero];
    titleLab.text = title;
    titleLab.textColor = [UIColor blackColor];
    [titleLab sizeToFit];
    
    CGFloat width = MIN(titleLab.bounds.size.width, CZTitleViewMaxWidth);
    CGFloat height = MIN(titleLab.bounds.size.height, navBarH);
    titleLab.frame = CGRectMake((UIScreenW-width)/2, (self.bounds.size.height-height)/2, width, height);
    [self addSubview:titleLab];
    _titleView = titleLab;
}

- (void)setTitleView:(UIView *)titleView {
    [_titleView removeFromSuperview];
    _titleView = titleView;
    
    CGFloat width = MIN(_titleView.bounds.size.width, CZTitleViewMaxWidth);
    CGFloat height = MIN(_titleView.bounds.size.height, navBarH);
    _titleView.frame = CGRectMake((UIScreenW-width)/2, (self.bounds.size.height-height)/2, width, height);
    [self addSubview:_titleView];
}

- (void)setLeftButton:(UIButton *)leftButton {
    [_leftButton removeFromSuperview];
    _leftButton = leftButton;
    
    CGFloat width = _leftButton.bounds.size.width;
    CGFloat height = _leftButton.bounds.size.height;
    _leftButton.frame = CGRectMake(15, (self.bounds.size.height-height)/2, width, height);
    [self addSubview:_leftButton];
}

- (void)setRightButton:(UIButton *)rightButton {
    [_rightButton removeFromSuperview];
    _rightButton = rightButton;
    
    CGFloat width = _rightButton.bounds.size.width;
    CGFloat height = _rightButton.bounds.size.height;
    _rightButton.frame = CGRectMake(UIScreenW-width-15, (self.bounds.size.height-height)/2, width, height);
    [self addSubview:_rightButton];
}

@end
