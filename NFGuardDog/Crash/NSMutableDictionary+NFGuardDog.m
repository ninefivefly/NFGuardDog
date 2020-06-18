//
//  NSMutableDictionary+NFGuardDog.m
//  NFGuardDog
//
//  Created by JIANG PENGH CHENG on 2020/6/12.
//  Copyright © 2020 JIANG PENG CHENG. All rights reserved.
//

#import "NSMutableDictionary+NFGuardDog.h"
#import "NSObject+NFMethodSwizzling.h"
#import "NFAvoidCrash.h"
#import "NFCommonDefine.h"

@implementation NSMutableDictionary (NFGuardDog)

+ (void)nf_swizzleMethods{
    Class __NSDictionaryM = NSClassFromString(@"__NSDictionaryM");
    [__NSDictionaryM nf_SwizzlingInstanceMethod:@selector(setObject:forKey:) withMethod:@selector(nf_avoid_crash_setObject:forKey:)];
    [__NSDictionaryM nf_SwizzlingInstanceMethod:@selector(setObject:forKeyedSubscript:) withMethod:@selector(nf_avoid_crash_setObject:forKeyedSubscript:)];
    [__NSDictionaryM nf_SwizzlingInstanceMethod:@selector(removeObjectForKey:) withMethod:@selector(nf_avoid_crash_removeObjectForKey:)];
}

- (void)nf_avoid_crash_setObject:(id)anObject forKey:(id<NSCopying>)aKey{
    NFCatchExceptionWithIgonore([self nf_avoid_crash_setObject:anObject forKey:aKey];)
}

- (void)nf_avoid_crash_setObject:(id)obj forKeyedSubscript:(id<NSCopying>)key{
    NFCatchExceptionWithIgonore([self nf_avoid_crash_setObject:obj forKeyedSubscript:key];)
}

- (void)nf_avoid_crash_removeObjectForKey:(id)aKey{
    NFCatchExceptionWithIgonore([self nf_avoid_crash_removeObjectForKey:aKey];)
}

@end
