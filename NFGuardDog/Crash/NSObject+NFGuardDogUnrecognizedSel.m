//
//  NSObject+NFGuardDogUnrecognizedSel.m
//  NFGuardDog
//
//  Created by JIANG PENGH CHENG on 2020/6/10.
//  Copyright © 2020 JIANG PENG CHENG. All rights reserved.
//

#import "NSObject+NFGuardDogUnrecognizedSel.h"
#import "NFAvoidCrash.h"
#import "NFCommonDefine.h"
#import "NSObject+NFMethodSwizzling.h"

@implementation NSObject (NFGuardDogUnrecognizedSel)

+ (void)nf_swizzleMethods{
    // instance method.
    [self nf_SwizzlingInstanceMethod:@selector(methodSignatureForSelector:) withMethod:@selector(nf_avoid_crash_methodSignatureForSelector:)];
    [self nf_SwizzlingInstanceMethod:@selector(forwardInvocation:) withMethod:@selector(nf_avoid_crash_forwardInvocation:)];
    
    // clase method.
    [self nf_SwizzlingClassMethod:@selector(methodSignatureForSelector:) withMethod:@selector(nf_avoid_crash_methodSignatureForSelector:)];
    [self nf_SwizzlingClassMethod:@selector(forwardInvocation:) withMethod:@selector(nf_avoid_crash_forwardInvocation:)];
}

- (NSMethodSignature *)nf_avoid_crash_methodSignatureForSelector:(SEL)aSelector{
    NFCatchExceptionWithIgonore({
        NSMethodSignature* ms = [self nf_avoid_crash_methodSignatureForSelector:aSelector];
        if (ms == nil) {
            ms = [NSMethodSignature signatureWithObjCTypes:"v@:"];
        }
        return ms;
    })
}

- (void)nf_avoid_crash_forwardInvocation:(NSInvocation *)anInvocation{
    NFCatchExceptionWithIgonore([self nf_avoid_crash_forwardInvocation:anInvocation];)
}

+ (NSMethodSignature *)nf_avoid_crash_methodSignatureForSelector:(SEL)aSelector{
    NFCatchExceptionWithIgonore({
        NSMethodSignature* ms = [self nf_avoid_crash_methodSignatureForSelector:aSelector];
        if (ms == nil) {
            ms = [NSMethodSignature signatureWithObjCTypes:"v@:"];
        }
        return ms;
    })
}

+ (void)nf_avoid_crash_forwardInvocation:(NSInvocation *)anInvocation{
    NFCatchExceptionWithIgonore([self nf_avoid_crash_forwardInvocation:anInvocation];)
}

@end
