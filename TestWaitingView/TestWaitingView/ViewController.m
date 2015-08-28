//
//  ViewController.m
//  TestWaitingView
//
//  Created by zhtg on 15/8/20.
//  Copyright (c) 2015年 zhtg. All rights reserved.
//

#import "ViewController.h"
#import "UIView+ZZZProgress.h"
#import "ZZZWaitingView.h"

@interface ViewController () {
    NSTimer *_animationTimer;
}

@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.button.layer.masksToBounds = YES;
    self.button.layer.cornerRadius = 10;
    
    [self pressed:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressed:(id)sender {
    [self.button addProgressView];
    [ZZZWaitingView showWaitViewInView:self.view];
    _animationTimer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(addProgress) userInfo:nil repeats:YES];
}

- (void)addProgress {
    [self.button setProgress:self.button.progress+0.1];
    if (self.button.progress >= 1) {
        [self.button removeProgressViewAnimated:YES];
        [_animationTimer invalidate];
        _animationTimer = nil;
        [ZZZWaitingView hideInView:self.view];
    }
}

@end
