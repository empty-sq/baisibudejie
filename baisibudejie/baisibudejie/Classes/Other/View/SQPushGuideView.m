//
//  SQPushGuideView.m
//  baisibudejie
//
//  Created by 沈强 on 16/4/7.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQPushGuideView.h"

@implementation SQPushGuideView

+ (instancetype)guideView {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

- (IBAction)close {
    [self removeFromSuperview];
}

+ (void)show {
    // 版本号键
    NSString *key = @"CFBundleShortVersionString";
    // 从 info.plist 文件里面取键所对应的版本号(值)，获得当前软件的版本号
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    // 从沙盒里面取出上一个版本号
    NSString *sanboxVersion = [[NSUserDefaults standardUserDefaults] stringForKey:key];
    
    if (![currentVersion isEqualToString:sanboxVersion]) {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        
        // 创建推送引导
        SQPushGuideView *guideView = [SQPushGuideView guideView];
        guideView.frame = window.bounds;
        [window addSubview:guideView];
        
        // 存储版本号
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

@end
