//
//  NFAvoidCrash.h
//  NFGuardDog
//
//  Created by JIANG PENGH CHENG on 2020/6/9.
//  Copyright © 2020 JIANG PENG CHENG. All rights reserved.

#import <Foundation/Foundation.h>
#import "NFCrashException.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, NFCrashExceptionType) {
    NFCrashExceptionTypeNone = 0,
    NFCrashExceptionTypeUnrecognizedSelector        = 1 << 1,
    NFCrashExceptionTypeKVO                         = 1 << 2,
    NFCrashExceptionTypeKVC                         = 1 << 3,
    NFCrashExceptionTypeTimer                       = 1 << 4,
    NFCrashExceptionTypeContainer                   = 1 << 5,
    NFCrashExceptionTypeString                      = 1 << 6,
    NFCrashExceptionTypeAll                         = -1
};

@interface NFAvoidCrash : NSObject


//
@property(nonatomic)NFCrashExceptionType catchExceptionType;

//
@property(nonatomic, copy, nullable) void (^handleCrashException)(NFCrashException *exception);

//
+ (instancetype)shareInstance;

//
- (void)notiErrorWithException:(NSException *)exception defaultToDo:(nonnull NSString *)dto;

@end

NS_ASSUME_NONNULL_END
