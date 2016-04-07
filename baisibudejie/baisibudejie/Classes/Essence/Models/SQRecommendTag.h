//
//  SQRecommendTag.h
//  baisibudejie
//
//  Created by 沈强 on 16/4/5.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SQRecommendTag : NSObject

/** 图片 */
@property (nonatomic, copy) NSString *image_list;
/** 名字 */
@property (nonatomic, copy) NSString *theme_name;
/** 订阅数 */
@property (nonatomic, assign) NSInteger sub_number;

@end
