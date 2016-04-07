//
//  SQRecommendUserCell.m
//  baisibudejie
//
//  Created by 沈强 on 16/3/27.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQRecommendUserCell.h"
#import <UIImageView+WebCache.h>

@interface SQRecommendUserCell ()

@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *fansCountLabel;

@end

@implementation SQRecommendUserCell

- (void)setUser:(SQRecommendUser *)user {
    _user = user;
    self.screenNameLabel.text = user.screen_name;
    NSString *fansCount = nil;
    if (user.fans_count < 10000) {
        fansCount = [NSString stringWithFormat:@"%zd人关注", user.fans_count];
    } else { // 大于等于10000
        fansCount = [NSString stringWithFormat:@"%.1f万人关注", user.fans_count / 10000.0];
    }
    self.fansCountLabel.text = fansCount;
    [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:user.header] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
}

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
