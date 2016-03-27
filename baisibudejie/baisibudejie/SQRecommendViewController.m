//
//  SQRecommendViewController.m
//  baisibudejie
//
//  Created by 沈强 on 16/3/27.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQRecommendViewController.h"
#import <AFNetworking.h>
#import <SVProgressHUD.h>
#import <MJExtension.h>
#import <MJRefresh/MJRefresh.h>
#import "SQRecommendCategoryCell.h"
#import "SQRecommendCategory.h"
#import "SQRecommendUser.h"

#define SQSelectedCategory self.categories[self.categoryTableView.indexPathForSelectedRow.row]

@interface SQRecommendViewController ()

/** 左边的类别表格 */
@property (weak, nonatomic) IBOutlet UITableView *categoryTableView;
/** 右边的用户表格 */
@property (weak, nonatomic) IBOutlet UITableView *userTableView;

/** 请求参数 */
@property (nonatomic, strong) NSMutableDictionary *params;
/** AFN请求管理者 */
@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation SQRecommendViewController

static NSString * const SQCategoryID = @"category";
static NSString * const SQUserID = @"user";

/**
 *  初始化管理者
 */
- (AFHTTPSessionManager *)manager {
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 控件的初始化
    [self setupTableView];
    
    // 添加刷新控件
    [self setupRefresh];
    
    // 加载左侧的类别数据
    [self loadCategories];
}

/**
 *  加载左侧数据
 */
- (void)loadCategories {
    // 显示指示器
    // 请求回来之前不能点击东西，请求很长时间就只能退出软件
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
}

- (void)setupRefresh {
    
}

- (void)setupTableView {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
