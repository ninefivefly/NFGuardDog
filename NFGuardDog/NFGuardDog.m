//
//  NFGuardDog.m
//  NFGuardDog
//
//  Created by JIANG PENGH CHENG on 2020/6/11.
//  Copyright © 2020 JIANG PENG CHENG. All rights reserved.
//

#import "NFGuardDog.h"
#import "NFAvoidCrash.h"

@implementation NFGuardDog

//
+ (void)startAvoidAllCrash{
    [self startAvoidCrashWithType:NFAvoidCrashTypeAll];
}

//
+ (void)startAvoidCrashWithType:(NFAvoidCrashType)type{
    [[NFAvoidCrash shareInstance] startAvoidCrash:type delegate:nil];
}

//
+ (void)startAvoidAllCrashWithdelegate:(id<NFAvoidCrashDelegate>)delegate{
    [[NFAvoidCrash shareInstance] startAvoidCrash:NFAvoidCrashTypeAll delegate:delegate];
}

//
+ (void)startAvoidAllCrashWithhandleException:(void (^)(NFCrashException *exception))handle {
    [[NFAvoidCrash shareInstance] startAvoidCrash:NFAvoidCrashTypeAll handleException:handle];
}

//
+ (void)startAvoidCrash:(NFAvoidCrashType)type delegate:(id<NFAvoidCrashDelegate>)delegate{
    [[NFAvoidCrash shareInstance] startAvoidCrash:type delegate:delegate];
}

//
+ (void)startAvoidCrash:(NFAvoidCrashType)type handleException:(void (^)(NFCrashException *exception))handle {
    [[NFAvoidCrash shareInstance] startAvoidCrash:type handleException:handle];
}

//
+ (void)stopAvoidCrash{
    [[NFAvoidCrash shareInstance] stopAvoidCrash];
}

@end
