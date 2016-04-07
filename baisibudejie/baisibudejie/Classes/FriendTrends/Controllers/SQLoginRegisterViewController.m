//
//  SQLoginRegisterViewController.m
//  baisibudejie
//
//  Created by 沈强 on 16/4/6.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQLoginRegisterViewController.h"

@interface SQLoginRegisterViewController ()

/** 登录框距离控制器view左边的间距 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginViewLeftMargin;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;

@end

@implementation SQLoginRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 文字属性
//    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
//    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
//    
//    // NSAttributedString: 带有属性的文字(富文本)
//    NSMutableAttributedString *placeholder = [[NSMutableAttributedString alloc] initWithString:@"手机号" attributes:attrs];
//    self.phoneField.attributedPlaceholder = placeholder;
    
//    NSMutableAttributedString *placeholder = [[NSMutableAttributedString alloc] initWithString:@"手机号"];
//    [placeholder setAttributes:@{NSForegroundColorAttributeName : [UIColor redColor]} range:NSMakeRange(0, 3)];
//    self.phoneField.attributedPlaceholder = placeholder;
}

- (IBAction)showLoginOrRegister:(UIButton *)sender {
    // 退出键盘
    [self.view endEditing:YES];
    
    if (!self.loginViewLeftMargin.constant) { // 显示注册界面
        self.loginViewLeftMargin.constant = - self.view.width;
        sender.selected = YES;
//        [sender setTitle:@"已有账号?" forState:UIControlStateNormal];
    } else { // 显示登录界面
        self.loginViewLeftMargin.constant = 0;
        sender.selected = NO;
//        [sender setTitle:@"注册账号" forState:UIControlStateNormal];
    }
    
    [UIView animateWithDuration:.25 animations:^(void){
        // 如果，有需要刷新的标记，立即调用layoutSubviews进行布局（如果没有标记，不会调用layoutSubviews）
        [self.view layoutIfNeeded];
    }];
}

- (IBAction)exit:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  让当前控制器对应的状态栏是白色
 */
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
