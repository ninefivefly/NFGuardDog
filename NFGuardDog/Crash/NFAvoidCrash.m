//
//  NFAvoidCrash.m
//  NFGuardDog
//
//  Created by JIANG PENGH CHENG on 2020/6/9.
//  Copyright © 2020 JIANG PENG CHENG. All rights reserved.

#import "NFAvoidCrash.h"
#import "NSArray+NFGuardDog.h"
#import "NSMutableArray+NFGuardDog.h"
#import "NSDictionary+NFGuardDog.h"
#import "NSMutableDictionary+NFGuardDog.h"


@interface NFAvoidCrash()

@property(nonatomic)BOOL isCatchExceptionOn;

@end

@implementation NFAvoidCrash

+ (instancetype)shareInstance{
    static NFAvoidCrash* instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[NFAvoidCrash alloc] init];
    });
    return instance;
}

- (void)startCatchException:(NFCrashExceptionType)type{
    self.catchExceptionType = type;
    self.isCatchExceptionOn = YES;
}

- (void)stopCatchException{
    self.isCatchExceptionOn = NO;
}

- (void)notiErrorWithException:(NSException *)exception defaultToDo:(nonnull NSString *)dto {
    NFCrashException* exc = [NFCrashException exceptionWithNSException:exception dto:dto];
    [exc printBrief];
    
    //
    if (self.handleCrashException) {
        self.handleCrashException(exc);
    }
}

- (void)setIsCatchExceptionOn:(BOOL)isCatchExceptionOn{
    if (_isCatchExceptionOn == isCatchExceptionOn) {
        return;
    }
    
    if (self.catchExceptionType & NFCrashExceptionTypeContainer) {
        [NSArray performSelector:@selector(nf_swizzleMethods)];
        [NSMutableArray performSelector:@selector(nf_swizzleMethods)];
        [NSDictionary performSelector:@selector(nf_swizzleMethods)];
        [NSMutableDictionary performSelector:@selector(nf_swizzleMethods)];
    }
    
    if (self.catchExceptionType & NFCrashExceptionTypeUnrecognizedSelector) {
        [NSObject performSelector:@selector(nf_swizzleMethods)];
    }
}

@end
