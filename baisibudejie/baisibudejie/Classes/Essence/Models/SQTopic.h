//
//  SQTopic.h
//  baisibudejie
//
//  Created by 沈强 on 16/4/7.
//  Copyright © 2016年 SQ. All rights reserved.
//  帖子

#import <UIKit/UIKit.h>

@interface SQTopic : NSObject

/** 名称 */
@property (nonatomic, copy) NSString *name;
/** 头像的URL */
@property (nonatomic, copy) NSString *profile_image;
/** 发帖时间 */
@property (nonatomic, copy) NSString *create_time;
/** 文字内容 */
@property (nonatomic, copy) NSString *text;
/** 顶的数量 */
@property (nonatomic, assign) NSInteger ding;
/** 踩的数量 */
@property (nonatomic, assign) NSInteger cai;
/** 转发的数量 */
@property (nonatomic, assign) NSInteger repost;
/** 评论的数量 */
@property (nonatomic, assign) NSInteger comment;
/** 是否为新浪加V用户 */
@property (nonatomic, assign, getter=isSina_v) BOOL sina_v;
/** 图片的宽度 */
@property (nonatomic, assign) NSInteger width;
/** 图片的高度 */
@property (nonatomic, assign) NSInteger height;
/** 图片的URL */
//@property (nonatomic, copy) NSString *<#name#>;

/** 额外的辅助属性 **/
/** cell的高度 */
@property (nonatomic, assign, readonly) CGFloat cellHeight;

@end