//
//  UIView+ZZZProgress.h
//  TestWaitingView
//
//  Created by zhtg on 15/8/21.
//  Copyright (c) 2015年 zhtg. All rights reserved.
//

#import <UIKit/UIKit.h>

#if !__has_feature(objc_arc)
#warning "这项功能需要arc支持，请在source对这两个文件添加参数"-f-objc-arc""
#endif

/*!
 @abstract 视图的添加进度条方法
 */
@interface UIView (ZZZProgress)

/*!
 @abstract 在视图中添加进度视图
 */
- (void)addProgressView;

/*!
 @abstract 进度视图的进度，0到1
 */
@property(nonatomic) CGFloat progress;

/*!
 @abstract 移除进度视图
 @param animated 移除时是否需要动画
 */
- (void)removeProgressViewAnimated:(BOOL)animated;

@end
