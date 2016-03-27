//
//  SQRecommendCategory.m
//  baisibudejie
//
//  Created by 沈强 on 16/3/27.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQRecommendCategory.h"

@implementation SQRecommendCategory

- (NSMutableArray *)users {
    if (_users == nil) {
        _users = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return _users;
}

@end
