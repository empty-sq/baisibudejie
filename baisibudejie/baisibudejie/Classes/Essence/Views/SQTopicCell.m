//
//  SQTopicCell.m
//  baisibudejie
//
//  Created by 沈强 on 16/4/7.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQTopicCell.h"
#import <UIImageView+WebCache.h>

@interface SQTopicCell ()

/** 头像 */
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
/** 昵称 */
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
/** 时间 */
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
/** 顶 */
@property (weak, nonatomic) IBOutlet UIButton *dingBtn;
/** 踩 */
@property (weak, nonatomic) IBOutlet UIButton *caiBtn;
/** 分享 */
@property (weak, nonatomic) IBOutlet UIButton *shareBtn;
/** 评论 */
@property (weak, nonatomic) IBOutlet UIButton *commentBtn;
/** 新浪加V */
@property (weak, nonatomic) IBOutlet UIImageView *sinaVView;
/** 帖子的文字内容 */
@property (weak, nonatomic) IBOutlet UILabel *text_Label;

@end

@implementation SQTopicCell

- (void)awakeFromNib {
    UIImageView *bgView = [[UIImageView alloc] init];
    bgView.image = [UIImage imageNamed:@"mainCellBackground"];
    self.backgroundView = bgView;
}

- (void)setTopic:(SQTopic *)topic {
    _topic = topic;
    
    // 新浪加V
    self.sinaVView.hidden = !topic.isSina_v;
    
    // 设置头像
    [self.profileImageView sd_setImageWithURL:[NSURL URLWithString:topic.profile_image] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    
    // 设置名字
    self.nameLabel.text = topic.name;
    
    // 设置帖子的创建时间
    self.timeLabel.text = topic.create_time;
    
    // 设置按钮文字
    [self setupButtonTitle:self.dingBtn count:topic.ding placeholder:@"顶"];
    [self setupButtonTitle:self.caiBtn count:topic.cai placeholder:@"踩"];
    [self setupButtonTitle:self.shareBtn count:topic.repost placeholder:@"分享"];
    [self setupButtonTitle:self.commentBtn count:topic.comment placeholder:@"评论"];
    
    // 设置帖子的文字内容
    self.text_Label.text = topic.text;
}

/**
 *  设置底部按钮文字
 */
- (void)setupButtonTitle:(UIButton *)button count:(NSInteger)count placeholder:(NSString *)placeholder {
    if (count > 10000) {
        placeholder = [NSString stringWithFormat:@"%.1f万", count / 10000.0];
    } else if (count > 0) {
        placeholder = [NSString stringWithFormat:@"%zd", count];
    }
    [button setTitle:placeholder forState:UIControlStateNormal];
}

- (void)setFrame:(CGRect)frame {
    frame.origin.x = SQTopicCellMargin;
    frame.size.width -= 2 * SQTopicCellMargin;
    frame.size.height -= SQTopicCellMargin;
    frame.origin.y += SQTopicCellMargin;
    
    [super setFrame:frame];
}

@end
