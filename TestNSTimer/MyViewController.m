//
//  MyViewController.m
//  TestNSTimer
//
//  Created by Sunhy on 2017/8/10.
//  Copyright © 2017年 Sunhy. All rights reserved.
//

#import "MyViewController.h"
#import "HYTimer.h"
#import "MSWeakTimer.h"

@interface MyViewController ()

@property (nonatomic, weak) NSTimer *myTimer2;

@property (nonatomic, strong) MSWeakTimer *msTimer;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    #pragma mark - **************** 内存泄漏代码
//    self.myTimer2 = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(fireTimer:) userInfo:nil repeats:YES];

    #pragma mark - **************** 使用iOS10之后的API，没有问题
//    self.myTimer2 = [NSTimer scheduledTimerWithTimeInterval:2 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        NSLog(@"fire");
//    }];
    #pragma mark - **************** 找一个中间者承当target
//    self.myTimer2 = [HYTimer scheduledTimerWithTimeInterval:1 repeats:YES usingBlock:^{
//        NSLog(@"fire");
//    }];
    #pragma mark - **************** 使用MSWeakTimer
    _msTimer = [MSWeakTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(fireMSWeakTimer:) userInfo:nil repeats:YES dispatchQueue:dispatch_get_main_queue()];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fireMSWeakTimer:(MSWeakTimer *)timer {
    NSLog(@"fire");
}

- (void)fireTimer:(NSTimer *)timer {
    NSLog(@"fire");
}

- (void)dealloc {
    NSLog(@"dealloc");
    [_myTimer2 invalidate];
    _myTimer2 = nil;
    
    [_msTimer invalidate];
    _msTimer = nil;
}


@end
