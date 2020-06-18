//
//  NSDictionary+NFGuardDog.m
//  NFGuardDog
//
//  Created by JIANG PENGH CHENG on 2020/6/12.
//  Copyright © 2020 JIANG PENG CHENG. All rights reserved.
//

#import "NSDictionary+NFGuardDog.h"
#import "NSObject+NFMethodSwizzling.h"
#import "NFAvoidCrash.h"
#import "NFCommonDefine.h"

@implementation NSDictionary (NFGuardDog)

+ (void)nf_swizzleMethods{
    [self nf_SwizzlingClassMethod:@selector(dictionaryWithObjects:forKeys:count:) withMethod:@selector(nf_avoid_crash_dictionaryWithObjects:forKeys:count:)];
}


+ (instancetype)nf_avoid_crash_dictionaryWithObjects:(id  _Nonnull const [])objects forKeys:(id<NSCopying>  _Nonnull const [])keys count:(NSUInteger)cnt{
     @try {
         return [self nf_avoid_crash_dictionaryWithObjects:objects forKeys:keys count:cnt];
     }
     @catch (NSException *exception) {
         [[NFAvoidCrash shareInstance] notiErrorWithException:exception defaultToDo:NFAvoidCrashDefaultRemoveNil];
      
         NSUInteger index = 0;
         id  _Nonnull __unsafe_unretained newObjects[cnt];
         id  _Nonnull __unsafe_unretained newkeys[cnt];
         for (int i = 0; i < cnt; i++) {
             if (objects[i] && keys[i]) {
                 newObjects[index] = objects[i];
                 newkeys[index] = keys[i];
                 index++;
             }
         }
         return [self nf_avoid_crash_dictionaryWithObjects:newObjects forKeys:newkeys count:index];
     }
     @finally {
     }
}


@end
