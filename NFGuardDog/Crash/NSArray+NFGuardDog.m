//
//  NSArray+NFGuardDog.m
//  NFGuardDog
//
//  Created by JIANG PENGH CHENG on 2020/6/11.
//  Copyright © 2020 JIANG PENG CHENG. All rights reserved.
//

#import "NSArray+NFGuardDog.h"
#import "NSObject+NFMethodSwizzling.h"
#import "NFGuardDog.h"
#import "NFCommonDefine.h"

@implementation NSArray (NFGuardDog)

+ (void)nf_swizzleNSArray{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self nf_SwizzlingClassMethod:@selector(arrayWithObjects:count:) withMethod:@selector(nf_avoid_crash_arrayWithObjects:count:)];
        
        //
        Class __NSArray = NSClassFromString(@"NSArray");
        Class __NSArrayI = NSClassFromString(@"__NSArrayI");
        Class __NSSingleObjectArrayI = NSClassFromString(@"__NSSingleObjectArrayI");
        Class __NSArray0 = NSClassFromString(@"__NSArray0");
    
        //objectsAtIndexes:
        [__NSArray nf_SwizzlingInstanceMethod:@selector(objectsAtIndexes:) withMethod:@selector(nf_avoid_crash_objectsAtIndexes:)];
        
        //objectAtIndex:
        [__NSArray0 nf_SwizzlingInstanceMethod:@selector(objectAtIndex:) withMethod:@selector(nf_avoid_crash_array0ObjectAtIndex:)];
        [__NSSingleObjectArrayI nf_SwizzlingInstanceMethod:@selector(objectAtIndex:) withMethod:@selector(nf_avoid_crash_array1ObjectAtIndex:)];
        [__NSArrayI nf_SwizzlingInstanceMethod:@selector(objectAtIndex:) withMethod:@selector(nf_avoid_crash_arrayMObjectAtIndex:)];
    
        //objectAtIndexedSubscript:
        [__NSArrayI nf_SwizzlingInstanceMethod:@selector(objectAtIndexedSubscript:) withMethod:@selector(nf_avoid_crash_objectAtIndexedSubscript:)];
           
        //getObjects:range:
        [__NSArray0 nf_SwizzlingInstanceMethod:@selector(getObjects:range:) withMethod:@selector(nf_avoid_crash_array0getObjects:range:)];
        [__NSSingleObjectArrayI nf_SwizzlingInstanceMethod:@selector(getObjects:range:) withMethod:@selector(nf_avoid_crash_array1getObjects:range:)];
        [__NSArrayI nf_SwizzlingInstanceMethod:@selector(getObjects:range:) withMethod:@selector(nf_avoid_crash_arrayMgetObjects:range:)];
    });
}

// __NSArray objectsAtIndexes:
+ (instancetype)nf_avoid_crash_arrayWithObjects:(id  _Nonnull const [])objects count:(NSUInteger)cnt{
    @try {
        return [self nf_avoid_crash_arrayWithObjects:objects count:cnt];
    } @catch (NSException *exception) {
        //
        [NFGuardDog notiErrorWithException:exception defaultToDo:NFAvoidCrashDefaultRemoveNil];
    
        //
        NSInteger newObjsIndex = 0;
        id  _Nonnull __unsafe_unretained newObjects[cnt];
        for (int i = 0; i < cnt; i++) {
            if (objects[i] != nil) {
                newObjects[newObjsIndex] = objects[i];
                newObjsIndex++;
            }
        }
        return [self nf_avoid_crash_arrayWithObjects:newObjects count:newObjsIndex];
    } @finally {
    }
}

- (NSArray *)nf_avoid_crash_objectsAtIndexes:(NSIndexSet *)indexes{
    NFCatchExceptionWithReturnNil([self nf_avoid_crash_objectsAtIndexes:indexes];)
}

// __NSArray0 objectAtIndex:
- (id)nf_avoid_crash_array0ObjectAtIndex:(NSUInteger)index{
    NFCatchExceptionWithReturnNil([self nf_avoid_crash_array0ObjectAtIndex:index];)
}

// __NSSingleObjectArrayI objectAtIndex:
- (id)nf_avoid_crash_array1ObjectAtIndex:(NSUInteger)index{
    NFCatchExceptionWithReturnNil([self nf_avoid_crash_array1ObjectAtIndex:index];)
}

// __NSArrayI objectAtIndex:
- (id)nf_avoid_crash_arrayMObjectAtIndex:(NSUInteger)index{
    NFCatchExceptionWithReturnNil([self nf_avoid_crash_arrayMObjectAtIndex:index];)
}

- (id)nf_avoid_crash_objectAtIndexedSubscript:(NSUInteger)idx{
    NFCatchExceptionWithReturnNil([self nf_avoid_crash_objectAtIndexedSubscript:idx];)
}

// __NSArray0 getObjects:range:
- (void)nf_avoid_crash_array0getObjects:(id  _Nonnull __unsafe_unretained [])objects range:(NSRange)range{
    NFCatchExceptionWithIgonore([self nf_avoid_crash_array0getObjects:objects range:range];)
}

// __NSSingleObjectArrayI getObjects:range:
- (void)nf_avoid_crash_array1getObjects:(id  _Nonnull __unsafe_unretained [])objects range:(NSRange)range{
    NFCatchExceptionWithIgonore([self nf_avoid_crash_array1getObjects:objects range:range];)
}

// __NSArrayI getObjects:range:
- (void)nf_avoid_crash_arrayMgetObjects:(id  _Nonnull __unsafe_unretained [])objects range:(NSRange)range{
    NFCatchExceptionWithIgonore([self nf_avoid_crash_arrayMgetObjects:objects range:range];)
}

@end
