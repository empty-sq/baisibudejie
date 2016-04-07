//
//  SQEssenceViewController.m
//  baisibudejie
//
//  Created by 沈强 on 16/3/27.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQEssenceViewController.h"
#import "SQRecommendTagsViewController.h"

@interface SQEssenceViewController ()

@end

@implementation SQEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航栏
    [self setupNav];
    
    // 设置顶部的标签栏
    [self setupTitlesView];
}

/**
 *  设置顶部的标签栏
 */
- (void)setupTitlesView {
    UIView *titlesView = [[UIView alloc] init];
    [self.view addSubview:titlesView];
}

/**
 *  设置导航栏
 */
- (void)setupNav {
    // 设置导航栏内容
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    // 设置导航栏左边的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(tagClick)];
    
    // 设置背景色
    self.view.backgroundColor = SQGlobalBkg;
}

- (void)tagClick {
    SQRecommendTagsViewController *tagsVC = [[SQRecommendTagsViewController alloc] init];
    [self.navigationController pushViewController:tagsVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
