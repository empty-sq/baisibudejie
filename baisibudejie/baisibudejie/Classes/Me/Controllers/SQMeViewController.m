//
//  SQMeViewController.m
//  baisibudejie
//
//  Created by 沈强 on 16/3/27.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQMeViewController.h"

@interface SQMeViewController ()

@end

@implementation SQMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航栏内容
    self.navigationItem.title = @"我的";
    
    // 设置导航栏左边的按钮
    UIBarButtonItem *settingButton = [UIBarButtonItem itemWithImage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" target:self action:@selector(settingClick)];
    
    UIBarButtonItem *nightModeButton = [UIBarButtonItem itemWithImage:@"mine-moon-icon" highImage:@"mine-moon-icon-click" target:self action:@selector(nightModeClick)];
    self.navigationItem.rightBarButtonItems = @[settingButton, nightModeButton];
    
    //  设置背景色
    self.view.backgroundColor = SQGlobalBkg;
}

- (void)settingClick {
    SQLogFunc;
}

- (void)nightModeClick {
    SQLogFunc;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
