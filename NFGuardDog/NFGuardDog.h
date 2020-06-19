//
//  NFGuardDog.h
//  NFGuardDog
//
//  Created by JIANG PENGH CHENG on 2020/6/11.
//  Copyright © 2020 JIANG PENG CHENG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NFCrashException.h"

NS_ASSUME_NONNULL_BEGIN

// 支持的捕获异常类型
typedef NS_ENUM(NSInteger, NFAvoidCrashType) {
    NFAvoidCrashTypeNone = 0,
    //Unrecognized Selector Exception
    NFAvoidCrashTypeUnrecognizedSelector        = 1 << 1,
    //KVO Exception
    NFAvoidCrashTypeKVO                         = 1 << 2,
    //KVC EXception
    NFAvoidCrashTypeKVC                         = 1 << 3,
    //Timer EXception
    NFAvoidCrashTypeTimer                       = 1 << 4,
    //Container EXception,
    //NSArray,NSMutableArray,NSDictionary,NSMutableDictionary
    NFAvoidCrashTypeContainer                   = 1 << 5,
    //String Exception,
    //NSString,NSMutableString,NSAttributedString,NSMutableAttributedString
    NFAvoidCrashTypeString                      = 1 << 6,
    // All Exception
    NFAvoidCrashTypeAll                         = -1
};

@protocol NFAvoidCrashDelegate <NSObject>

@optional
- (void)nf_handleAvoidCrashException:(NFCrashException *)exception;

@end

@interface NFGuardDog : NSObject

/**
启动所有避免Crash的组件
*/
+ (void)startAvoidAllCrash;

/**
启动避免Crash组件，根据参数，可以配置启动不同类型的避免crash组件
例如：只启动避免KVO和KVC崩溃的组件，可以设置type为： NFAvoidCrashTypeKVO | NFAvoidCrashTypeKVC

@param type  异常类型
*/
+ (void)startAvoidCrashWithType:(NFAvoidCrashType)type;

/**
启动所有避免Crash的组件，并设置获取异常的代理对象

@param delegate  weak代理对象，实现协议，可以获取异常信息，用于自主上报
*/
+ (void)startAvoidAllCrashWithdelegate:(nullable id<NFAvoidCrashDelegate>)delegate;

/**
启动所有避免Crash的组件，并设置获取异常的block

@param handle  block，可以获取异常信息，用于自主上报
*/
+ (void)startAvoidAllCrashWithhandleException:(nullable void (^)(NFCrashException *exception))handle;

/**
启动避免Crash组件，根据参数，可以配置启动不同类型的避免crash组件
例如：只启动避免KVO和KVC崩溃的组件，可以设置type为： NFAvoidCrashTypeKVO | NFAvoidCrashTypeKVC

@param type  异常类型
@param delegate  weak代理对象，实现协议，可以获取异常信息，用于自主上报
*/
+ (void)startAvoidCrash:(NFAvoidCrashType)type delegate:(nullable id<NFAvoidCrashDelegate>)delegate;

/**
启动避免Crash组件，根据参数，可以配置启动不同类型的避免crash组件
例如：只启动避免KVO和KVC崩溃的组件，可以设置type为： NFAvoidCrashTypeKVO | NFAvoidCrashTypeKVC
 
@param type  异常类型
@param handle  block，可以获取异常信息，用于自主上报
*/
+ (void)startAvoidCrash:(NFAvoidCrashType)type handleException:(nullable void (^)(NFCrashException *exception))handle;

/**
停止捕获异常
*/
+ (void)stopAvoidCrash;

@end

NS_ASSUME_NONNULL_END
