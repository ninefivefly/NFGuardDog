//
//  NFWeakObjectProxy.m
//  NFGuardDog
//
//  Created by JIANG PENGH CHENG on 2020/6/17.
//  Copyright © 2020 JIANG PENG CHENG. All rights reserved.
//

#import "NFWeakObjectProxy.h"

@implementation NFWeakObjectProxy

+ (id)proxyForTarget:(id)target{
    NFWeakObjectProxy* p = [NFWeakObjectProxy alloc];
    p.target = target;
    return p;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel{
    return [self.target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation{
    if ([self.target respondsToSelector:invocation.selector]) {
        [invocation invokeWithTarget:self.target];
    }
}

@end
