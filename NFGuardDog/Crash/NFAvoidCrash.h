//
//  NFAvoidCrash.h
//  NFGuardDog
//
//  Created by JIANG PENGH CHENG on 2020/6/9.
//  Copyright © 2020 JIANG PENG CHENG. All rights reserved.

#import <Foundation/Foundation.h>
#import "NFCrashException.h"

NS_ASSUME_NONNULL_BEGIN

@interface NFAvoidCrash : NSObject

//
@property(nonatomic)NFAvoidCrashType avoidCrashType;

//
@property(nonatomic, weak)id<NFAvoidCrashDelegate> delegate;

//
@property(nonatomic, copy, nullable) void (^handleCrashException)(NFCrashException *exception);

//
+ (instancetype)shareInstance;

//
- (void)notiErrorWithException:(NSException *)exception defaultToDo:(nonnull NSString *)dto;

//
- (void)startAvoidCrash:(NFAvoidCrashType)type delegate:(nullable id<NFAvoidCrashDelegate>)delegate;

//
- (void)startAvoidCrash:(NFAvoidCrashType)type handleException:(nullable void (^)(NFCrashException *exception))handle;

//
- (void)stopAvoidCrash;

@end

NS_ASSUME_NONNULL_END
