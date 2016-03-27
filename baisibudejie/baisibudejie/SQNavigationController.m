//
//  SQNavigationController.m
//  baisibudejie
//
//  Created by 沈强 on 16/3/25.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQNavigationController.h"

@interface SQNavigationController ()

@end

@implementation SQNavigationController

/** 当第一次使用这个类的时候调用 */
+ (void)initialize {
    // 当导航栏用在SQNavigationController中，appearance设置才会生效
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 在这里修改navigationBar的背景色是不行的，会被系统的方法刷新掉
//    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/**
 *  可以在这个方法中芥蓝所有push进来的控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 如果push进来的不是第一个控制器
    if (self.childViewControllers.count > 0) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"返回" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [button setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        button.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        // button.size = CGSizeMake(70, 30);
        // 让按钮内部的所有内容左对齐
//        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [button sizeToFit];
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        // 隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    // 这句super的push要放在后面，让viewController可以覆盖上面设置的leftBarButtonItem
    [super pushViewController:viewController animated:animated];
}

- (void)back {
    [self popViewControllerAnimated:YES];
}

@end