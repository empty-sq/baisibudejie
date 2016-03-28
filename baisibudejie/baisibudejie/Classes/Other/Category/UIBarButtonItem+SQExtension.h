//
//  UIBarButtonItem+SQExtension.h
//  baisibudejie
//
//  Created by 沈强 on 16/3/25.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (SQExtension)

+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;

@end
