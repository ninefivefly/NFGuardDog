//
//  NFGuardDog.m
//  NFGuardDog
//
//  Created by JIANG PENGH CHENG on 2020/6/11.
//  Copyright © 2020 JIANG PENG CHENG. All rights reserved.
//

#import "NFGuardDog.h"

@implementation NFGuardDog

//
+ (void)startCatchException:(NFCrashExceptionType)type{
    [[NFAvoidCrash shareInstance] startCatchException:type];
}

//
+ (void)stopCatchException{
    [[NFAvoidCrash shareInstance] stopCatchException];
}

@end
