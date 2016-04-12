//
//  SQRecommendCategory.h
//  baisibudejie
//
//  Created by 沈强 on 16/3/27.
//  Copyright © 2016年 SQ. All rights reserved.
// 推荐关注 左边的数据模型

#import <Foundation/Foundation.h>

@interface SQRecommendCategory : NSObject

/** id */
@property (nonatomic, assign) NSInteger ID;
/** 总数 */
@property (nonatomic, assign) NSInteger count;
/** 名字 */
@property (nonatomic, copy) NSString *name;

/** 这个类别对应的用户数据 */
@property (nonatomic, strong) NSMutableArray *users;
/** 总数 */
@property (nonatomic, assign) NSInteger total;
/** 当前页 */
@property (nonatomic, assign) NSInteger currentPage;

@end
