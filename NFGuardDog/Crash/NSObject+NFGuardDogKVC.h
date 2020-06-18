//
//  NSObject+NFGuardDogKVC.h
//  NFGuardDog
//
//  Created by JIANG PENGH CHENG on 2020/6/9.
//  Copyright © 2020 JIANG PENG CHENG. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (NFGuardDogKVC)

+ (void)nf_swizzleMethodsKVC;

@end

NS_ASSUME_NONNULL_END
