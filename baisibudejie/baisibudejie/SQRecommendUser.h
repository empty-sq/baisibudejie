//
//  SQRecommendUser.h
//  baisibudejie
//
//  Created by 沈强 on 16/3/27.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SQRecommendUser : NSObject

/** 头像 */
@property (nonatomic, copy) NSString *header;
/** 粉丝数 */
@property (nonatomic, assign) NSInteger fans_count;
/** 昵称 */
@property (nonatomic, copy) NSString *screen_name;

@end
