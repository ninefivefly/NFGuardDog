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

//
- (void)startAvoidCrash:(NFAvoidCrashType)type delegate:(id<NFAvoidCrashDelegate>)delegate{
    self.avoidCrashType = type;
    self.isCatchExceptionOn = YES;
    self.delegate = delegate;
}

//
- (void)startAvoidCrash:(NFAvoidCrashType)type handleException:(void (^)(NFCrashException *exception))handle{
    self.avoidCrashType = type;
    self.isCatchExceptionOn = YES;
    self.handleCrashException = handle;
}

- (void)stopAvoidCrash{
    self.isCatchExceptionOn = NO;
}

- (void)notiErrorWithException:(NSException *)exception defaultToDo:(nonnull NSString *)dto {
    NFCrashException* exc = [NFCrashException exceptionWithNSException:exception dto:dto];
    [exc printBrief];
    
    //
    if ([self.delegate respondsToSelector:@selector(nf_handleAvoidCrashException:)]) {
        [self.delegate nf_handleAvoidCrashException:exc];
    }
    
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
    
    if (self.avoidCrashType & NFAvoidCrashTypeContainer) {
        [NSArray nf_swizzleMethods];
        [NSMutableArray nf_swizzleMethods];
        [NSDictionary nf_swizzleMethods];
        [NSMutableDictionary nf_swizzleMethods];
    }
    
    if (self.avoidCrashType & NFAvoidCrashTypeUnrecognizedSelector) {
        [NSObject nf_swizzleMethods];
    }
    
    if (self.avoidCrashType & NFAvoidCrashTypeKVO) {
        [NSObject nf_swizzleMethodsKVO];
    }
    
    if (self.avoidCrashType & NFAvoidCrashTypeKVC) {
        [NSObject nf_swizzleMethodsKVC];
    }
    
    if (self.avoidCrashType & NFAvoidCrashTypeTimer) {
        [NSTimer nf_swizzleMethods];
    }
    
    if (self.avoidCrashType & NFAvoidCrashTypeString) {
        [NSString nf_swizzleMethods];
        [NSMutableString nf_swizzleMethods];
        [NSAttributedString nf_swizzleMethods];
        [NSMutableAttributedString nf_swizzleMethods];
    }
}

@end
