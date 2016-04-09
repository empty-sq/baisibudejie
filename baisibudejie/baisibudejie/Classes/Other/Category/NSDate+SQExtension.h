//
//  NSDate+SQExtension.h
//  baisibudejie
//
//  Created by 沈强 on 16/4/9.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (SQExtension)

/**
 *  比较from和self的时间差值
 */
- (NSDateComponents *)deltaFrom:(NSDate *)from;



/**
 *  是否为今年
 */
- (BOOL)isThisYear;

/**
 *  是否为今天
 */
- (BOOL)isToday;

/**
 *  是否为昨天
 */
- (BOOL)isYesterday;

@end
