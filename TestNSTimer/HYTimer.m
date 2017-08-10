//
//  HYTimer.m
//  TestNSTimer
//
//  Created by Sunhy on 2017/8/10.
//  Copyright © 2017年 Sunhy. All rights reserved.
//

#import "HYTimer.h"

@interface HYTimer ()

@property (nonatomic, weak) NSTimer *timer;

@end

@implementation HYTimer

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti repeats:(BOOL)yesOrNo usingBlock:(HYBlock)myBlock {
    if (!myBlock) return nil;
    // 找个timer会被runloop持有
    return [NSTimer scheduledTimerWithTimeInterval:ti target:self selector:@selector(timerFire:) userInfo:myBlock repeats:yesOrNo];
}

+ (void)timerFire:(NSTimer *)timer {
    HYBlock myBlock = (HYBlock)timer.userInfo;
    if (myBlock) myBlock();
}

@end
