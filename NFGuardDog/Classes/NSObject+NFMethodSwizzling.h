//
//  NSObject+NFMethodSwizzling.h
//  NFGuardDog
//
//  Created by JIANG PENGH CHENG on 2020/6/9.
//  Copyright © 2020 JIANG PENG CHENG. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (NFMethodSwizzling)

//
+ (void)nf_SwizzlingClassMethod:(SEL)originalSelector withMethod:(SEL)swizzledSelector;
//
+ (void)nf_SwizzlingInstanceMethod:(SEL)originalSelector withMethod:(SEL)swizzledSelector;
//
void nf_swizzlingClassMethod(Class class, SEL originalSelector, SEL swizzledSelector);
//
void nf_swizzlingInstanceMethod(Class class, SEL originalSelector, SEL swizzledSelector);

@end

NS_ASSUME_NONNULL_END
