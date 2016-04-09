//
//  SQEssenceViewController.m
//  baisibudejie
//
//  Created by 沈强 on 16/3/27.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQEssenceViewController.h"
#import "SQRecommendTagsViewController.h"
#import "SQTopicViewController.h"

@interface SQEssenceViewController ()<UIScrollViewDelegate>

/** 标签栏底部的红色指示器 */
@property (nonatomic, weak) UIView *indicatorView;
/** 当前选中的按钮 */
@property (nonatomic, weak) UIButton *selectedBtn;
/** 顶部的标签 */
@property (nonatomic, weak) UIView *titlesView;
/** 底部的所有内容 */
@property (nonatomic, weak) UIScrollView *contentView;

@end

@implementation SQEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航栏
    [self setupNav];
    
    // 初始化子控制器
    [self setupChildViewControllers];
    
    // 设置顶部的标签栏
    [self setupTitlesView];
    
    // 底部的scrollView
    [self setupContentView];
}

/**
 *  初始化子控制器
 */
- (void)setupChildViewControllers {
    SQTopicViewController *all = [[SQTopicViewController alloc] init];
    all.title = @"全部";
    all.type = SQTopicTypeAll;
    [self addChildViewController:all];
    
    SQTopicViewController *video = [[SQTopicViewController alloc] init];
    video.title = @"视频";
    video.type = SQTopicTypeVideo;
    [self addChildViewController:video];
    
    SQTopicViewController *voice = [[SQTopicViewController alloc] init];
    voice.title = @"声音";
    voice.type = SQTopicTypeVoice;
    [self addChildViewController:voice];
    
    SQTopicViewController *picture = [[SQTopicViewController alloc] init];
    picture.title = @"图片";
    picture.type = SQTopicTypePicture;
    [self addChildViewController:picture];
    
    SQTopicViewController *word = [[SQTopicViewController alloc] init];
    word.title = @"段子";
    word.type = SQTopicTypeWord;
    [self addChildViewController:word];
}

/**
 *  底部的scrollView
 */
- (void)setupContentView {
    // 不要自动调整inset
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *contentView = [[UIScrollView alloc] init];
    contentView.frame = self.view.bounds;
    contentView.delegate = self;
    contentView.pagingEnabled = YES;
    [self.view insertSubview:contentView atIndex:0];
    contentView.contentSize = CGSizeMake(contentView.width * self.childViewControllers.count, 0);
    self.contentView = contentView;
    
    // 添加第一个控制器的view
    [self scrollViewDidEndScrollingAnimation:contentView];
}

/**
 *  设置顶部的标签栏
 */
- (void)setupTitlesView {
    // 标签栏整体
    UIView *titlesView = [[UIView alloc] init];
    titlesView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    titlesView.width = self.view.width;
    titlesView.y = SQTitlesViewY;
    titlesView.height = SQTitlesViewH;
    // 导致里面的子控件也会成为半透明，不建议使用
//    titlesView.alpha = 0.5;
    [self.view addSubview:titlesView];
    self.titlesView = titlesView;
    
    // 底部的红色指示器
    UIView *indicatorView = [[UIView alloc] init];
    indicatorView.backgroundColor = [UIColor redColor];
    indicatorView.height = 2;
    indicatorView.tag = -1;
    indicatorView.y = titlesView.height - indicatorView.height;
    self.indicatorView = indicatorView;
    
    // 内部子标签
    CGFloat width = titlesView.width / self.childViewControllers.count;
    CGFloat height = titlesView.height;
    for (NSInteger i = 0; i < self.childViewControllers.count; i++) {
        UIButton *button = [[UIButton alloc] init];
        button.tag = i;
        button.height = height;
        button.width = width;
        button.x = i * width;
        UIViewController *vc = self.childViewControllers[i];
        [button setTitle:vc.title forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
        button.titleLabel.font = [UIFont systemFontOfSize:14.0];
        [button addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [titlesView addSubview:button];
        
        // 默认点击了第一个按钮
        if (0 == i) {
            button.enabled = NO;
            self.selectedBtn = button;
            
            // 让按钮内部的label根据文字内容来计算尺寸
            [button.titleLabel sizeToFit];
            self.indicatorView.width = button.titleLabel.width;
            self.indicatorView.centerX = button.centerX;
        }
    }
    
    [titlesView addSubview:indicatorView];
}

- (void)titleClick:(UIButton *)button {
    // 修改按钮状态
    self.selectedBtn.enabled = YES;
    button.enabled = NO;
    self.selectedBtn = button;

    [UIView animateWithDuration:.25 animations:^{
        self.indicatorView.width = button.titleLabel .width;
        self.indicatorView.centerX = button.centerX;
    }];
    
    // 滚动
    CGPoint offset = self.contentView.contentOffset;
    offset.x = button.tag * self.contentView.width;
    [self.contentView setContentOffset:offset animated:YES];
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

#pragma mark -<UIScrollViewDelegate>
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    // 当前索引
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    
    // 取出子控制器
    UIViewController *VC = self.childViewControllers[index];
    VC.view.x = scrollView.contentOffset.x;
    VC.view.y = 0; // 设置控制器的view的y值为0(默认是20)
    VC.view.height = scrollView.height; // 设置控制器view的height值为整个屏幕的高度(默认是比屏幕高度少个20)
    [scrollView addSubview:VC.view];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self scrollViewDidEndScrollingAnimation:scrollView];
    
    // 点击按钮
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    [self titleClick:self.titlesView.subviews[index]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
