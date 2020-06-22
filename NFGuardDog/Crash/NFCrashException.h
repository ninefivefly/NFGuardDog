//
//  NFCrashException.h
//  NFGuardDog
//
//  Created by JIANG PENGH CHENG on 2020/6/17.
//  Copyright © 2020 JIANG PENG CHENG. All rights reserved.
//

#import <Foundation/Foundation.h>

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

@class NFCrashException;
@protocol NFAvoidCrashDelegate <NSObject>

@optional
- (void)nf_handleAvoidCrashException:(NFCrashException *)exception;

@end


@interface NFCrashException : NSObject

@property(nonatomic, nullable, readonly, copy)NSString* name;
@property(nonatomic, nullable, readonly, copy)NSString* reason;
@property(nonatomic, nullable, readonly, copy)NSString* place;
@property(nonatomic, nullable, readonly, copy)NSString* defaultToDo;
@property(nonatomic, nullable, readonly, copy)NSDictionary* userInfo;
@property(nonatomic, nullable, readonly, copy)NSArray<NSNumber *> *callStackReturnAddresses;
@property(nonatomic, nullable, readonly, copy)NSArray<NSString *> *callStackSymbols;
@property(nonatomic, readonly)NSException* exception;

+ (instancetype)exceptionWithNSException:(NSException *)exception dto:(NSString *)dto;
- (instancetype)initWithNSException:(NSException *)exception dto:(NSString *)dto;
- (void)printBrief;

@end

NS_ASSUME_NONNULL_END
