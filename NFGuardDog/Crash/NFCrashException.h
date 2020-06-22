//
//  NFCrashException.h
//  NFGuardDog
//
//  Created by JIANG PENGH CHENG on 2020/6/17.
//  Copyright © 2020 JIANG PENG CHENG. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

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
