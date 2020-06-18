//
//  NSObject+NFGuardDogKVC.m
//  NFGuardDog
//
//  Created by JIANG PENGH CHENG on 2020/6/9.
//  Copyright © 2020 JIANG PENG CHENG. All rights reserved.
//

#import "NSObject+NFGuardDogKVC.h"
#import "NSObject+NFMethodSwizzling.h"
#import "NFCommonDefine.h"
#import "NFAvoidCrash.h"

@implementation NSObject (NFGuardDogKVC)

+ (void)nf_swizzleMethodsKVC{
    // set methods
    [self nf_SwizzlingInstanceMethod:@selector(setValue:forKey:) withMethod:@selector(nf_avoid_crash_setValue:forKey:)];
    [self nf_SwizzlingInstanceMethod:@selector(setValue:forKeyPath:) withMethod:@selector(nf_avoid_crash_setValue:forKeyPath:)];
    
    // get methods
    [self nf_SwizzlingInstanceMethod:@selector(valueForKey:) withMethod:@selector(nf_avoid_crash_valueForKey:)];
    [self nf_SwizzlingInstanceMethod:@selector(valueForKeyPath:) withMethod:@selector(nf_avoid_crash_valueForKeyPath:)];
}

- (void)nf_avoid_crash_setValue:(id)value forKey:(NSString *)key{
    NFCatchExceptionWithIgonore(return [self nf_avoid_crash_setValue:value forKey:key];)
}

- (void)nf_avoid_crash_setValue:(id)value forKeyPath:(NSString *)keyPath{
    NFCatchExceptionWithIgonore(return [self nf_avoid_crash_setValue:value forKeyPath:keyPath];)
}

- (id)nf_avoid_crash_valueForKey:(NSString *)key{
    NFCatchExceptionWithIgonore(return [self nf_avoid_crash_valueForKey:key];)
}

- (id)nf_avoid_crash_valueForKeyPath:(NSString *)keyPath{
    NFCatchExceptionWithIgonore(return [self nf_avoid_crash_valueForKeyPath:keyPath];)
}

@end
