//
//  SQTabBar.m
//  baisibudejie
//
//  Created by 沈强 on 16/3/25.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQTabBar.h"

@interface SQTabBar ()

/** 发布按钮 */
@property (nonatomic, strong) UIButton *publishButton;

@end

@implementation SQTabBar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 设置tabBar的背景图
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
        _publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [self.publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [self addSubview:self.publishButton];
        self.publishButton.size = self.publishButton.currentBackgroundImage.size;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat width = self.width;
    CGFloat height = self.height;
    // 设置发布按钮的frame
    self.publishButton.center = CGPointMake(width / 2, height / 2 );
    
    // 自定义UITabBarButton的frame
    CGFloat buttonY = 0;
    CGFloat buttonW = width / 5.0;
    CGFloat buttonH = height;
    NSInteger index = 0;
    // 设置其他UITabBarButton的frame
    for (UIView *button in self.subviews) {
//        if (![button isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        if (![button isKindOfClass:[UIControl class]] || button == self.publishButton) continue;
        CGFloat buttonX = buttonW * ((index > 1) ? (index + 1) : index);
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        // 增加索引
        index++;
    }
}

@end
