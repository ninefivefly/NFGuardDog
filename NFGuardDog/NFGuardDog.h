//
//  NFGuardDog.h
//  NFGuardDog
//
//  Created by JIANG PENGH CHENG on 2020/6/11.
//  Copyright © 2020 JIANG PENG CHENG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NFAvoidCrash.h"

NS_ASSUME_NONNULL_BEGIN

@interface NFGuardDog : NSObject

//
+ (void)startCatchException:(NFCrashExceptionType)type;

//
+ (void)stopCatchException;

@end

NS_ASSUME_NONNULL_END
