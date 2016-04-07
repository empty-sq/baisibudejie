//
//  SQRecommendTagsViewController.m
//  baisibudejie
//
//  Created by 沈强 on 16/3/30.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQRecommendTagsViewController.h"
#import "SQRecommendTag.h"
#import "SQRecommendTagCell.h"
#import <AFNetworking.h>
#import <SVProgressHUD.h>
#import <MJExtension.h>

@interface SQRecommendTagsViewController ()

/** 标签数据 */
@property (nonatomic, strong) NSArray *tags;

@end

static NSString * const SQTagsID = @"tag";

@implementation SQRecommendTagsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建tableView
    [self setupTableView];
    
    // 加载数据
    [self loadTags];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  加载标签数据
 */
- (void)loadTags {
    // 发送请求
    [SVProgressHUD show];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    
    // 请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"tag_recommend";
    params[@"action"] = @"sub";
    params[@"c"] = @"topic";
    
    [[AFHTTPSessionManager manager] GET:@"http:api.budejie.com/api/api_open.php" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self.tags = [SQRecommendTag mj_objectArrayWithKeyValuesArray:responseObject];
        [self.tableView reloadData];
        
        [SVProgressHUD dismiss];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"加载标签数据失败!"];
    }];
}

/**
 *  创建tableView
 */
- (void)setupTableView {
    self.title = @"推荐标签";
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SQRecommendTagCell class]) bundle:nil] forCellReuseIdentifier:SQTagsID];
    self.tableView.rowHeight = 70;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.tableView.backgroundColor = SQGlobalBkg;
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tags.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SQRecommendTagCell *cell = [tableView dequeueReusableCellWithIdentifier:SQTagsID];
    cell.recommendTag = self.tags[indexPath.row];
    return cell;
}

@end
