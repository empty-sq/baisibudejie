//
//  SQVerticalButton.m
//  baisibudejie
//
//  Created by 沈强 on 16/4/6.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQVerticalButton.h"

@implementation SQVerticalButton

- (void)setup {
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib {
    [self setup];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 调整图片
    self.imageView.x = 0;
    self.imageView.y = 0;
    self.imageView.width = self.width;
    self.imageView.height = self.imageView.height;
    
    // 调整文字
    self.titleLabel.x = 0;
    self.titleLabel.y = self.imageView.height;
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.titleLabel.y;
}

@end
