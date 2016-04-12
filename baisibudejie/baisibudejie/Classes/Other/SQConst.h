//
//  SQConst.h
//  baisibudejie
//
//  Created by 沈强 on 16/4/7.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    SQTopicTypeAll = 1,
    SQTopicTypePicture = 10,
    SQTopicTypeWord = 29,
    SQTopicTypeVoice = 31,
    SQTopicTypeVideo = 41
} SQTopicType;

/** 精华-所有顶部标题高度 */
UIKIT_EXTERN CGFloat const SQTitlesViewH;
/** 精华-所有顶部标题宽度 */
UIKIT_EXTERN CGFloat const SQTitlesViewY;

/** 精华-cell-间距 */
UIKIT_EXTERN CGFloat const SQTopicCellMargin;
/** 精华-cell-文字内容的y值 */
UIKIT_EXTERN CGFloat const SQTopicCellTextY;
/** 精华-cell-底部工具条的高度 */
UIKIT_EXTERN CGFloat const SQTopicCellBottomBarH;

/** 精华-cell-图片帖子的最大高度 */
UIKIT_EXTERN CGFloat const SQTopicCellPictureMaxH;
/** 精华-cell-图片帖子一旦超过最大高度，就是用break */
UIKIT_EXTERN CGFloat const SQTopicCellPictureBreakH;