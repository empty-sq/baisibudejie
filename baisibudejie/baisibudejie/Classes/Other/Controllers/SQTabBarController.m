//
//  SQTabBarController.m
//  baisibudejie
//
//  Created by 沈强 on 16/3/25.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQTabBarController.h"
#import "SQNavigationController.h"
#import "SQEssenceViewController.h"
#import "SQNewViewController.h"
#import "SQFriendTrendsViewController.h"
#import "SQMeViewController.h"
#import "SQTabBar.h"

@interface SQTabBarController ()

@end

@implementation SQTabBarController

/**
 *  UIColor colorWithRed:<#(CGFloat)#> green:<#(CGFloat)#> blue:<#(CGFloat)#> alpha:<#(CGFloat)#>
 颜色:
 
 24bit颜色: R G B
 32bit颜色: R G B A
 */

+ (void)initialize {
    // 通过appearance统一设置所有UITabBarItem的文字属性
    // 后面带有UI_APPEANCE_SELECTOR的方法，都可以通过appearance对象来统一设置
    // 设置正常状态下的文字大小与文字颜色
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12.0];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    // 设置选中状态下的文字与文字颜色
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12.0];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    // 通过appearence来设置所有的UITabBarItem文字大小与文字颜色
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加子控制器
    [self setupChildViewController:[[SQEssenceViewController alloc] init] title:@"精华" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    [self setupChildViewController:[[SQNewViewController alloc] init] title:@"新帖" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    [self setupChildViewController:[[SQFriendTrendsViewController alloc] init] title:@"关注" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    [self setupChildViewController:[[SQMeViewController alloc] init] title:@"我" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];
    
    // 更换tabBar
    [self setValue:[[SQTabBar alloc] init] forKey:@"tabBar"];
}

/**
 *  初始化控制器
 */
- (void)setupChildViewController:(UIViewController *)viewController title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    // 设置文字和图片
    viewController.tabBarItem.title = title;
    viewController.tabBarItem.image = [UIImage imageNamed:image];
    viewController.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    // 包装导航控制器，添加导航控制器tabBarController为子控制器
    SQNavigationController *navigationController = [[SQNavigationController alloc] initWithRootViewController:viewController];
    // 添加子控制器
    [self addChildViewController:navigationController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
