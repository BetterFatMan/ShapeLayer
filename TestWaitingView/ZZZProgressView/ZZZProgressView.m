//
//  ZZZProgressView.m
//  TestWaitingView
//
//  Created by zhtg on 15/8/21.
//  Copyright (c) 2015年 zhtg. All rights reserved.
//

#import "ZZZProgressView.h"

@interface ZZZProgressView ()

@property(nonatomic,strong) CAShapeLayer *backgroundLayer;
@property(nonatomic,strong) CAShapeLayer *progressLayer;

@end

@implementation ZZZProgressView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.backgroundColor = [UIColor clearColor];
}

- (void)setProgress:(CGFloat)progress {
    if (_progress != progress) {
        _progress = progress;
    }
    
    if (progress < 0 || progress > 1) {
        return;
    }
    
    self.progressLayer.strokeEnd = 1 - progress;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect frame = self.srcView.frame;
    
    CGFloat bgRadius = frame.size.width;
    CGFloat trueRadius = frame.size.width * kZZZProgressViewRidusRate;
    CAShapeLayer *backgroundLayer = [CAShapeLayer layer];
    backgroundLayer.frame = self.bounds;
    backgroundLayer.fillColor = [UIColor clearColor].CGColor;
    backgroundLayer.strokeColor = ZZZ_PROGRESSVIEW_BACKGROUNDCOLOR.CGColor;
    backgroundLayer.lineWidth = (bgRadius - trueRadius) * 2;
    UIBezierPath *bgBezierPath = [UIBezierPath bezierPathWithArcCenter:self.center radius:bgRadius startAngle:-M_PI_2 endAngle:-M_PI_2 + 2 * M_PI clockwise:YES];
    backgroundLayer.path = bgBezierPath.CGPath;
    [self.layer addSublayer:backgroundLayer];
    self.backgroundLayer = backgroundLayer;
    
    CGFloat space = frame.size.width * kZZZProgressViewLineWidthRate;
    CGFloat progressRadius = (trueRadius - space) / 2;
    CAShapeLayer *progressLayer = [CAShapeLayer layer];
    progressLayer.frame = self.bounds;
    progressLayer.strokeColor = ZZZ_PROGRESSVIEW_BACKGROUNDCOLOR.CGColor;
    progressLayer.fillColor = [UIColor clearColor].CGColor;
    progressLayer.lineWidth = progressRadius * 2;
    UIBezierPath *proBezierPath = [UIBezierPath bezierPathWithArcCenter:self.center radius:progressRadius startAngle:-M_PI_2 endAngle:-M_PI_2 + 2 * M_PI clockwise:YES];
    progressLayer.path = proBezierPath.CGPath;
    progressLayer.strokeEnd = 1;
    CATransform3D rotationTransform = CATransform3DMakeRotation(M_PI, 0, 1, 0);
    progressLayer.transform = rotationTransform;
    progressLayer.anchorPoint = CGPointMake(0.5, 0.5);
    [self.layer addSublayer:progressLayer];
    self.progressLayer = progressLayer;
}

@end
