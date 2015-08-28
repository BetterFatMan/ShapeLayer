//
//  UIView+ZZZProgress.m
//  TestWaitingView
//
//  Created by zhtg on 15/8/21.
//  Copyright (c) 2015年 zhtg. All rights reserved.
//

#import "UIView+ZZZProgress.h"
#import "ZZZProgressView.h"

static NSInteger const kZZZProgressViewTag = 11234342;

@implementation UIView (ZZZProgress)

- (void)addProgressView {
    ZZZProgressView *progressView = (ZZZProgressView *)[self viewWithTag:kZZZProgressViewTag];
    if (progressView && [progressView isKindOfClass:[ZZZProgressView class]]) {
        progressView.progress = 0;
    } else {
        ZZZProgressView *progressView = [[ZZZProgressView alloc] init];
        progressView.tag = kZZZProgressViewTag;
        progressView.srcView = self;
        [self addSubview:progressView];
        
        // layout
        progressView.translatesAutoresizingMaskIntoConstraints = NO;
        NSArray *hLayouts = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[progressView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(progressView)];
        NSArray *vLayouts = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[progressView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(progressView)];
        [self addConstraints:hLayouts];
        [self addConstraints:vLayouts];
    }
    progressView.alpha = 0;
    
    // 动画
    [UIView animateWithDuration:0.25 animations:^{
        progressView.alpha = 1.0;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)setProgress:(CGFloat)progress {
    ZZZProgressView *progressView = (ZZZProgressView *)[self viewWithTag:kZZZProgressViewTag];
    if (progressView && [progressView isKindOfClass:[ZZZProgressView class]]) {
        progressView.progress = progress;
    }
}

- (CGFloat)progress {
    ZZZProgressView *progressView = (ZZZProgressView *)[self viewWithTag:kZZZProgressViewTag];
    if (progressView && [progressView isKindOfClass:[ZZZProgressView class]]) {
        return progressView.progress;
    }
    return 0;
}

- (void)removeProgressViewAnimated:(BOOL)animated {
    ZZZProgressView *progressView = (ZZZProgressView *)[self viewWithTag:kZZZProgressViewTag];
    if (progressView && [progressView isKindOfClass:[ZZZProgressView class]]) {
        if (animated) {
            [UIView animateWithDuration:0.25 animations:^{
                progressView.transform = CGAffineTransformMakeScale(2, 2);
            } completion:^(BOOL finished) {
                if (finished) {
                    [progressView removeFromSuperview];
                }
            }];
        } else {
            [progressView removeFromSuperview];
        }
    }
}

@end
