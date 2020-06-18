//
//  NSObject+NFGuardDogKVO.m
//  NFGuardDog
//
//  Created by JIANG PENGH CHENG on 2020/6/9.
//  Copyright © 2020 JIANG PENG CHENG. All rights reserved.
//

#import "NSObject+NFGuardDogKVO.h"
#import "NSObject+NFMethodSwizzling.h"
#import "NFCommonDefine.h"
#import "NFAvoidCrash.h"

@implementation NSObject (NFGuardDogKVO)

+ (void)nf_swizzleMethodsKVO{
    [self nf_SwizzlingInstanceMethod:@selector(addObserver:forKeyPath:options:context:) withMethod:@selector(nf_avoid_crash_addObserver:forKeyPath:options:context:)];
    [self nf_SwizzlingInstanceMethod:@selector(removeObserver:forKeyPath:context:) withMethod:@selector(nf_avoid_crash_removeObserver:forKeyPath:context:)];
    [self nf_SwizzlingInstanceMethod:@selector(removeObserver:forKeyPath:) withMethod:@selector(nf_avoid_crash_removeObserver:forKeyPath:)];
    [self nf_SwizzlingInstanceMethod:@selector(observeValueForKeyPath:ofObject:change:context:) withMethod:@selector(nf_avoid_crash_observeValueForKeyPath:ofObject:change:context:)];
}

- (void)nf_avoid_crash_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context{
    if (!keyPath) {
        return;
    }
    
    NFCatchExceptionWithIgonore([self nf_avoid_crash_addObserver:observer forKeyPath:keyPath options:options context:context];)
}

- (void)nf_avoid_crash_removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath context:(void *)context{
    NFCatchExceptionWithIgonore([self nf_avoid_crash_removeObserver:observer forKeyPath:keyPath context:context];)
}

- (void)nf_avoid_crash_removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath{
    NFCatchExceptionWithIgonore([self nf_avoid_crash_removeObserver:observer forKeyPath:keyPath];)
}

- (void)nf_avoid_crash_observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    NFCatchExceptionWithIgonore([self nf_avoid_crash_observeValueForKeyPath:keyPath ofObject:object change:change context:context];)
}

@end
