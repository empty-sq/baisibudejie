//
//  SQTopicViewController.h
//  baisibudejie
//
//  Created by 沈强 on 16/4/9.
//  Copyright © 2016年 SQ. All rights reserved.
//  最基本的帖子控制器

#import <UIKit/UIKit.h>

@interface SQTopicViewController : UITableViewController

/** 帖子类型(交给子类方法去实现) */
@property (nonatomic, assign) SQTopicType type;

@end
