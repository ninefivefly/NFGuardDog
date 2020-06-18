//
//  NSTimer+NFGuardDog.m
//  NFGuardDog
//
//  Created by JIANG PENGH CHENG on 2020/6/17.
//  Copyright © 2020 JIANG PENG CHENG. All rights reserved.
//

#import "NSTimer+NFGuardDog.h"
#import "NFWeakObjectProxy.h"
#import "NSObject+NFMethodSwizzling.h"

@implementation NSTimer (NFGuardDog)

+ (void)nf_swizzleMethods{
    [self nf_SwizzlingClassMethod:@selector(timerWithTimeInterval:target:selector:userInfo:repeats:) withMethod:@selector(nf_avoid_crash_timerWithTimeInterval:target:selector:userInfo:repeats:)];
    [self nf_SwizzlingClassMethod:@selector(scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:) withMethod:@selector(nf_avoid_crash_scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:)];
}

+ (NSTimer *)nf_avoid_crash_timerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo repeats:(BOOL)yesOrNo{
    return [self nf_avoid_crash_timerWithTimeInterval:ti target:NFWeakObjectProxy(aTarget) selector:aSelector userInfo:userInfo repeats:yesOrNo];
}

+ (NSTimer *)nf_avoid_crash_scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo repeats:(BOOL)yesOrNo{
    return [self nf_avoid_crash_scheduledTimerWithTimeInterval:ti target:NFWeakObjectProxy(aTarget) selector:aSelector userInfo:userInfo repeats:yesOrNo];
}

@end
