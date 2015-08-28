//
//  ZZZWaitingView.h
//  Menu
//
//  Created by zhtg on 15/4/6.
//  Copyright (c) 2015年 zhtg. All rights reserved.
//

#import <UIKit/UIKit.h>

/*!
 @abstract 等待的风格
 @discussion
 @param
 @result
 */
typedef NS_ENUM(NSUInteger, ZZZWaitingViewStyle) {
    ZZZWaitingViewStyleGray, // 灰色，适用于浅色底的视图，默认为这个
    ZZZWaitingViewStyleWhite // 白色，适用于深色底的视图
};

/*!
 @abstract 一个等待层的视图
 @discussion 这个类依靠ZZZImageView，所以需要将ImageView文件夹一并加入项目中
 @param
 @result
 */
@interface ZZZWaitingView : UIView

/*!
 @abstract 显示一个等待层在视图中
 @discussion 在一个视图中只能显示一个等待层，多次调用显示的话没有反应，多次调用只需要隐藏一次即可
 @param srcView 要显示的视图
 @result
 */
+ (void)showWaitViewInView:(UIView *)srcView;

/*!
 @abstract 显示一个等待层在视图中
 @discussion 在一个视图中只能显示一个等待层，多次调用显示的话没有反应，多次调用只需要隐藏一次即可
 @param style 等待层的风格
 @param srcView 要显示的视图
 @result
 */
+ (void)showWaitingView:(ZZZWaitingViewStyle)style inView:(UIView *)srcView;

/*!
 @abstract 在视图中隐藏
 @discussion
 @param srcView 源视图
 @result
 */
+ (void)hideInView:(UIView *)srcView;

- (ZZZWaitingView *)initWithStyle:(ZZZWaitingViewStyle)style;

@property(nonatomic,weak) UIView *srcView;

@property(nonatomic) ZZZWaitingViewStyle style;

- (void)show;
- (void)hidden;

@end
