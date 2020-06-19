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
#import "NSObject+NFGuardDogKVC.h"
#import "NSObject+NFGuardDogKVO.h"
#import "NSObject+NFGuardDogUnrecognizedSel.h"
#import "NSTimer+NFGuardDog.h"
#import "NSString+NFGuadDog.h"
#import "NSMutableString+NFGuardDog.h"
#import "NSAttributedString+NFGuardDog.h"
#import "NSMutableAttributedString+NFGuardDog.h"


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
    _isCatchExceptionOn = isCatchExceptionOn;
    
    if (self.catchExceptionType & NFCrashExceptionTypeContainer) {
        [NSArray nf_swizzleMethods];
        [NSMutableArray nf_swizzleMethods];
        [NSDictionary nf_swizzleMethods];
        [NSMutableDictionary nf_swizzleMethods];
    }
    
    if (self.catchExceptionType & NFCrashExceptionTypeUnrecognizedSelector) {
        [NSObject nf_swizzleMethods];
    }
    
    if (self.catchExceptionType & NFCrashExceptionTypeKVO) {
        [NSObject nf_swizzleMethodsKVO];
    }
    
    if (self.catchExceptionType & NFCrashExceptionTypeKVC) {
        [NSObject nf_swizzleMethodsKVC];
    }
    
    if (self.catchExceptionType & NFCrashExceptionTypeTimer) {
        [NSTimer nf_swizzleMethods];
    }
    
    if (self.catchExceptionType & NFCrashExceptionTypeString) {
        [NSString nf_swizzleMethods];
        [NSMutableString nf_swizzleMethods];
        [NSAttributedString nf_swizzleMethods];
        [NSMutableAttributedString nf_swizzleMethods];
    }
}

@end
