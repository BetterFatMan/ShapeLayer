//
//  ZZZWaitingView.m
//  Menu
//
//  Created by zhtg on 15/4/6.
//  Copyright (c) 2015年 zhtg. All rights reserved.
//

#import "ZZZWaitingView.h"

static NSInteger const kZZZWaitingViewTag = 112233456;
static CGFloat const kZZZWaitingViewCenterViewWidth = 42.0;
static CGFloat const kZZZWaitingViewImageViewWidth = 44.0;
static CGFloat const kZZZWaitingCenterViewLineWidth = 2.0;

@interface ZZZWaitingView ()

@property(nonatomic,strong) UIImageView *imageView;

@end

@implementation ZZZWaitingView

+ (void)showWaitViewInView:(UIView *)srcView {
    [self showWaitingView:ZZZWaitingViewStyleGray inView:srcView];
}

+ (void)showWaitingView:(ZZZWaitingViewStyle)style inView:(UIView *)srcView {
    ZZZWaitingView *waitingView = (ZZZWaitingView *)[srcView viewWithTag:kZZZWaitingViewTag];
    if (waitingView == nil) {
        waitingView = [[ZZZWaitingView alloc] initWithStyle:style];
        waitingView.tag = kZZZWaitingViewTag;
        waitingView.srcView = srcView;
        [waitingView show];
    } else {
        [srcView bringSubviewToFront:waitingView];
    }
}
+ (void)hideInView:(UIView *)srcView {
    ZZZWaitingView *waitingView = (ZZZWaitingView *)[srcView viewWithTag:kZZZWaitingViewTag];
    if (waitingView != nil) {
        [waitingView hidden];
    }
}

- (ZZZWaitingView *)initWithStyle:(ZZZWaitingViewStyle)style {
    if (self = [super init]) {
        [self setup];
        self.style = style;
    }
    return self;
}

- (void)setup {
    
    self.backgroundColor = [UIColor clearColor];
    
    [self setupWebView];
}

- (void)setupWebView {
    CGFloat width = kZZZWaitingViewImageViewWidth;
    self.imageView = [[UIImageView alloc] init];
    self.imageView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.imageView];
    
    // nslayout
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *centerXLayout = [NSLayoutConstraint constraintWithItem:self.imageView
                                                                     attribute:NSLayoutAttributeCenterX
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self
                                                                     attribute:NSLayoutAttributeCenterX
                                                                    multiplier:1.0
                                                                      constant:0];
    NSLayoutConstraint *centerYLayout = [NSLayoutConstraint constraintWithItem:self.imageView
                                                                     attribute:NSLayoutAttributeCenterY
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self
                                                                     attribute:NSLayoutAttributeCenterY
                                                                    multiplier:1.0
                                                                      constant:0];
    [self addConstraints:@[centerXLayout, centerYLayout]];
    NSLayoutConstraint *widthLayout = [NSLayoutConstraint constraintWithItem:self.imageView
                                                                   attribute:NSLayoutAttributeWidth
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:nil
                                                                   attribute:NSLayoutAttributeNotAnAttribute
                                                                  multiplier:1.0
                                                                    constant:width];
    NSLayoutConstraint *heightLayout = [NSLayoutConstraint constraintWithItem:self.imageView
                                                                    attribute:NSLayoutAttributeHeight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:nil
                                                                    attribute:NSLayoutAttributeNotAnAttribute
                                                                   multiplier:1.0
                                                                     constant:width];
    [self.imageView addConstraints:@[widthLayout, heightLayout]];
}

- (void)setStyle:(ZZZWaitingViewStyle)style {
    if (_style != style) {
        _style = style;
    }
    
    [self loadGifWithStyle:style];
}

- (void)loadGifWithStyle:(ZZZWaitingViewStyle)style {
    UIColor *color = nil;
    if (style == ZZZWaitingViewStyleGray) {
        color = [UIColor colorWithRed:163.0/255.0 green:163.0/255.0 blue:163.0/255.0 alpha:1.0];
    } else {
        color = [UIColor whiteColor];
    }
    CAShapeLayer *backgroundLayer = [self creatLayerWithColor:[UIColor whiteColor] lineWidth:kZZZWaitingCenterViewLineWidth+0.25];
    [self.imageView.layer addSublayer:backgroundLayer];
    CAShapeLayer *layer = [self creatLayerWithColor:color lineWidth:kZZZWaitingCenterViewLineWidth];
    [self.imageView.layer addSublayer:layer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation.fromValue = 0;
    animation.toValue = @(2 * M_PI);
    animation.removedOnCompletion = NO;
    animation.repeatCount = NSIntegerMax;
    animation.duration = 1.5;
    [self.imageView.layer addAnimation:animation forKey:nil];
}

- (CAShapeLayer *)creatLayerWithColor:(UIColor *)color lineWidth:(CGFloat)lineWidth {
    CGFloat radius = kZZZWaitingViewCenterViewWidth / 2.0;
    CGFloat layerWidth = kZZZWaitingViewCenterViewWidth;
    CGFloat imageWidth = kZZZWaitingViewImageViewWidth;
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.contentsScale = [[UIScreen mainScreen] scale];
    layer.strokeStart = 0;
    layer.strokeEnd = 0.88;
    layer.strokeColor = color.CGColor;
    layer.fillColor = [UIColor clearColor].CGColor;
    CGFloat layerX = (imageWidth - layerWidth) / 2.0;
    layer.frame = CGRectMake(layerX, layerX, layerWidth, layerWidth);
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(radius, radius) radius:radius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    layer.path = bezierPath.CGPath;
    layer.lineWidth = lineWidth;
    layer.lineCap = kCALineCapRound;
    layer.lineJoin = kCALineJoinBevel;
    return layer;
}

- (void)show {
    [self.srcView addSubview:self];
    
    // nslayout
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:self
                                                            attribute:NSLayoutAttributeLeading
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.srcView
                                                            attribute:NSLayoutAttributeLeading
                                                           multiplier:1.0
                                                             constant:0];
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:self.srcView
                                                             attribute:NSLayoutAttributeTrailing
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self
                                                             attribute:NSLayoutAttributeTrailing
                                                            multiplier:1.0
                                                              constant:0];
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.srcView
                                                           attribute:NSLayoutAttributeTop
                                                          multiplier:1.0
                                                            constant:0];
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self.srcView
                                                              attribute:NSLayoutAttributeBottom
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self
                                                              attribute:NSLayoutAttributeBottom
                                                             multiplier:1.0
                                                               constant:0];
    [self.srcView addConstraints:@[left, top, right, bottom]];
}

- (void)hidden {
    [self removeFromSuperview];
}

@end
