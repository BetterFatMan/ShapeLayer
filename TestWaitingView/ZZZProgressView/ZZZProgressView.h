//
//  ZZZProgressView.h
//  TestWaitingView
//
//  Created by zhtg on 15/8/21.
//  Copyright (c) 2015年 zhtg. All rights reserved.
//

#import <UIKit/UIKit.h>

/*!
 @abstract 覆盖的颜色
 */
#define ZZZ_PROGRESSVIEW_BACKGROUNDCOLOR [UIColor colorWithWhite:0 alpha:0.3]

// 半径是宽的多少比例
static CGFloat const kZZZProgressViewRidusRate = 0.325;

// 空白的大小是宽度的多少比例
static CGFloat const kZZZProgressViewLineWidthRate = 0.05;

/*!
 @abstract 进度条视图
 */
@interface ZZZProgressView : UIView

/*!
 @abstract 加载这个视图的源视图
 */
@property(nonatomic) UIView *srcView;

/*!
 @abstract 进度，0到1
 */
@property(nonatomic) CGFloat progress;

@end
