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

//- (void)drawPlaceholderInRect:(CGRect)rect {
//    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
//    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
//    attrs[NSFontAttributeName] = self.font;
//    [self.placeholder drawInRect:CGRectMake(0, 15, rect.size.width, 16) withAttributes:attrs];
//}

/**
 *  运行时(Runtime):苹果官方一套C语言库
 能做很多底层操作(比如访问隐藏的一些成员变量\成员方法...)
 */
+ (void)getProperties {
    unsigned int count = 0;
    
    objc_property_t *properties = class_copyPropertyList([UITextField class], &count);
    
    for (int i = 0; i < count; i++) {
        // 取出属性
        objc_property_t property = properties[i];
        
        // 打印属性名字
        SQLog(@"%s", property_getName(property));
        
        // 打印属性类型
        SQLog(@"%s",property_getAttributes(property));
    }
    
    free(properties);
}

- (void)getIvars {
    unsigned int count = 0;
    
    // 拷贝出所有的成员变量列表
    Ivar *ivars = class_copyIvarList([UITextField class], &count);
    
    
    for (int i = 0; i < count; i++) {
        // 取出成员变量
        //        Ivar ivar = *(ivars + i);
        Ivar ivar = ivars[i];
        
        // 打印成员变量名字
        SQLog(@"%s", ivar_getName(ivar));
    }
    
    // 释放
    free(ivars);
}

- (void)awakeFromNib {
//    UILabel *placeholderLabel = [self valueForKeyPath:@"_placeholderLabel"];
//    placeholderLabel.textColor = [UIColor redColor];
    
    // 不成为第一响应者
    [self resignFirstResponder];
    
    // 设置光标颜色和文字颜色一致
    self.tintColor = self.textColor;
}

//- (void)setPlaceholderColor:(UIColor *)placeholderColor {
//    _placeholderColor = placeholderColor;
//}

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

//- (void)setHighlighted:(BOOL)highlighted {
//    // 修改placeholder(占位)文字颜色
//    [self setValue:self.textColor forKeyPath:@"_placeholderLabel.textColor"];
//}

@end
