//
//  NSObject+NFGuardDogKVO.h
//  NFGuardDog
//
//  Created by JIANG PENGH CHENG on 2020/6/9.
//  Copyright © 2020 JIANG PENG CHENG. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (NFGuardDogKVO)

+ (void)nf_swizzleMethodsKVO;

@end

NS_ASSUME_NONNULL_END
