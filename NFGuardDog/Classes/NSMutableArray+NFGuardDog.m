//
//  NSMutableArray+NFGuardDog.m
//  NFGuardDog
//
//  Created by JIANG PENGH CHENG on 2020/6/11.
//  Copyright © 2020 JIANG PENG CHENG. All rights reserved.
//

#import "NFGuardDog.h"
#import "NFCommonDefine.h"
#import "NSMutableArray+NFGuardDog.h"
#import "NSObject+NFMethodSwizzling.h"

@implementation NSMutableArray (NFGuardDog)

+ (void)load{
    Class __NSArrayM = NSClassFromString(@"__NSArrayM");
    
    //objectAtIndex:
    [__NSArrayM nf_SwizzlingInstanceMethod:@selector(objectAtIndex:) withMethod:@selector(nf_avoid_crash_ObjectAtIndex:)];
    
    //objectAtIndexedSubscript
    [__NSArrayM nf_SwizzlingInstanceMethod:@selector(objectAtIndexedSubscript:) withMethod:@selector(nf_avoid_crash_objectAtIndexedSubscript:)];
    
    //setObject:atIndexedSubscript:
    [__NSArrayM nf_SwizzlingInstanceMethod:@selector(setObject:atIndexedSubscript:) withMethod:@selector(nf_avoid_crash_setObject:atIndexedSubscript:)];
    
    //removeObjectAtIndex:
    [__NSArrayM nf_SwizzlingInstanceMethod:@selector(removeObjectAtIndex:) withMethod:@selector(nf_avoid_crash_removeObjectAtIndex:)];
    
    //insertObject:atIndex:
    [__NSArrayM nf_SwizzlingInstanceMethod:@selector(insertObject:atIndex:) withMethod:@selector(nf_avoid_crash_insertObject:atIndex:)];
    
    //getObjects:range:
    [__NSArrayM nf_SwizzlingInstanceMethod:@selector(getObjects:range:) withMethod:@selector(nf_avoid_crash_getObjects:range:)];
}


// __NSArrayM objectAtIndex:
- (id)nf_avoid_crash_ObjectAtIndex:(NSUInteger)index{
    NFCatchExceptionWithReturnNil([self nf_avoid_crash_ObjectAtIndex:index];)
}

// __NSArrayM objectAtIndexedSubscript:
- (id)nf_avoid_crash_objectAtIndexedSubscript:(NSUInteger)idx{
    NFCatchExceptionWithReturnNil([self nf_avoid_crash_objectAtIndexedSubscript:idx];)
}

// __NSArrayM setObject:atIndexedSubscript:
- (void)nf_avoid_crash_setObject:(id)obj atIndexedSubscript:(NSUInteger)idx{
    NFCatchExceptionWithIgonore([self nf_avoid_crash_setObject:obj atIndexedSubscript:idx];)
}

- (void)nf_avoid_crash_removeObjectAtIndex:(NSUInteger)index{
    NFCatchExceptionWithIgonore([self nf_avoid_crash_removeObjectAtIndex:index];)
}

- (void)nf_avoid_crash_removeObject:(id)anObject inRange:(NSRange)range{
    NFCatchExceptionWithIgonore([self nf_avoid_crash_removeObject:anObject inRange:range];)
}

- (void)nf_avoid_crash_insertObject:(id)anObject atIndex:(NSUInteger)index{
    NFCatchExceptionWithIgonore([self nf_avoid_crash_insertObject:anObject atIndex:index];)
}

// __NSArrayM getObjects:range:
- (void)nf_avoid_crash_getObjects:(id  _Nonnull __unsafe_unretained [])objects range:(NSRange)range{
    NFCatchExceptionWithIgonore([self nf_avoid_crash_getObjects:objects range:range];)
}

@end
