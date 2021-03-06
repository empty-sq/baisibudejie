//
//  UIView+SQExtension.h
//  baisibudejie
//
//  Created by 沈强 on 16/3/25.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SQExtension)

/** x值 */
@property (nonatomic, assign) CGFloat x;
/** y值 */
@property (nonatomic, assign) CGFloat y;
/** 宽度 */
@property (nonatomic, assign) CGFloat width;
/** 高度 */
@property (nonatomic, assign) CGFloat height;
/** 尺寸 */
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

/** 在分类中声明@property,只会生成方法的声明，不会生成方法的实现和带有_(下划线)的成员变量 */

@end
