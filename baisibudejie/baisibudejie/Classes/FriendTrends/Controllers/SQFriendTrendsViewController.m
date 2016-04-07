//
//  SQFriendTrendsViewController.m
//  baisibudejie
//
//  Created by 沈强 on 16/3/27.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQFriendTrendsViewController.h"
#import "SQRecommendViewController.h"
#import "SQLoginRegisterViewController.h"

@interface SQFriendTrendsViewController ()

@end

@implementation SQFriendTrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航栏标题
    self.navigationItem.title = @"我的关注";
    // 设置导航栏左边的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" highImage:@"friendsRecommentIcon-click" target:self action:@selector(friendsClick)];
    
    //  设置背景色
    self.view.backgroundColor = SQGlobalBkg;
}

- (void)friendsClick {
    SQRecommendViewController *recommendViewController = [[SQRecommendViewController alloc] init];
    [self.navigationController pushViewController:recommendViewController animated:NO];
}

- (IBAction)loginRegister:(id)sender {
    SQLoginRegisterViewController *login = [[SQLoginRegisterViewController alloc] init];
    [self presentViewController:login animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
