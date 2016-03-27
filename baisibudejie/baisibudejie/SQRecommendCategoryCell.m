//
//  SQRecommendCategoryCell.m
//  baisibudejie
//
//  Created by 沈强 on 16/3/27.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQRecommendCategoryCell.h"
#import "SQRecommendCategory.h"

@interface SQRecommendCategoryCell ()

/** 选中时显示的指示器控件 */
@property (weak, nonatomic) IBOutlet UIView *selectedIndicator;

@end

@implementation SQRecommendCategoryCell

- (void)awakeFromNib {
    self.backgroundColor = SQGlobalBkg;
    self.textLabel.textColor = SQRGBColor(78, 78, 78);
    self.selectedIndicator.backgroundColor = SQRGBColor(219, 21, 26);
    // 当cell的selection为None时，即使cell被选中时，内部的子控件就不会进入高亮状态
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.selectedIndicator.hidden = !selected;
    self.textLabel.textColor = selected ? self.selectedIndicator.backgroundColor : SQRGBColor(78, 78, 78);
}

- (void)setCategory:(SQRecommendCategory *)category {
    _category = category;
    self.textLabel.text = _category.name;
}

/**
 *  可以在这个方法中监听cell的选中和取消选中
 */
- (void)layoutSubviews {
    [super layoutSubviews];
    // 重新调整内部textLabel的frame
    self.textLabel.y = 2;
    self.textLabel.height = self.contentView.height - 4;
}

@end
