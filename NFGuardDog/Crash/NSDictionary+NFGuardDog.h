//
//  NSDictionary+NFGuardDog.h
//  NFGuardDog
//
//  Created by JIANG PENGH CHENG on 2020/6/12.
//  Copyright © 2020 JIANG PENG CHENG. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (NFGuardDog)

+ (void)nf_swizzleMethods;

@end

NS_ASSUME_NONNULL_END
