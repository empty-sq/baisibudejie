//
//  SQTextField.m
//  baisibudejie
//
//  Created by 沈强 on 16/4/6.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQTextField.h"
#import <objc/runtime.h>

static NSString * const SQPlacerholderColorKeyPath = @"_placeholderLabel.textColor";

@implementation SQTextField


- (void)awakeFromNib {
    // 不成为第一响应者
    [self resignFirstResponder];
    
    // 设置光标颜色和文字颜色一致
    self.tintColor = self.textColor;
}

/**
 *  当前文本框聚焦时就会调用
 */
- (BOOL)becomeFirstResponder {
    // 修改placeholder(占位)文字颜色
    [self setValue:self.textColor forKeyPath:SQPlacerholderColorKeyPath];
    return [super becomeFirstResponder];
}

/**
 *  当前文本框失去焦点时就会调用
 */
- (BOOL)resignFirstResponder {
    // 修改placeholder(占位)文字颜色
    [self setValue:[UIColor grayColor] forKeyPath:SQPlacerholderColorKeyPath];
    return [super resignFirstResponder];
}

@end
