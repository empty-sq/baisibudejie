//
//  SQRecommendTagCell.m
//  baisibudejie
//
//  Created by 沈强 on 16/4/5.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQRecommendTagCell.h"
#import <UIImageView+WebCache.h>

@interface SQRecommendTagCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageListImageVIew;
@property (weak, nonatomic) IBOutlet UILabel *themeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *subNumberLabel;

@end

@implementation SQRecommendTagCell

- (void)setRecommendTag:(SQRecommendTag *)recommendTag {
    _recommendTag = recommendTag;
    [self.imageListImageVIew sd_setImageWithURL:[NSURL URLWithString:recommendTag.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.themeNameLabel.text = recommendTag.theme_name;
    
    NSString *subNumber = nil;
    if (recommendTag.sub_number < 10000) {
        subNumber = [NSString stringWithFormat:@"%zd人订阅", recommendTag.sub_number];
    } else { // 大于等于10000
        subNumber = [NSString stringWithFormat:@"%.1f万人订阅", recommendTag.sub_number / 10000.0];
    }
    self.subNumberLabel.text = subNumber;
}

/**
 *  改变cell的frame
 */
- (void)setFrame:(CGRect)frame {
    frame.origin.x = 10;
    frame.size.width -= 2 * frame.origin.x;
    frame.size.height -= 1;
    // 修改完frame后，给父类
    [super setFrame:frame];
}

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
