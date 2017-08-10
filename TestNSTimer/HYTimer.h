//
//  HYTimer.h
//  TestNSTimer
//
//  Created by Sunhy on 2017/8/10.
//  Copyright © 2017年 Sunhy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^HYBlock)();

@interface HYTimer : NSObject

+ (NSTimer *_Nullable)scheduledTimerWithTimeInterval:(NSTimeInterval)ti repeats:(BOOL)yesOrNo usingBlock:(HYBlock _Nullable )myBlock;

@end
