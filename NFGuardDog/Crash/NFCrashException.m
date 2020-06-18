//
//  NFCrashException.m
//  NFGuardDog
//
//  Created by JIANG PENGH CHENG on 2020/6/17.
//  Copyright © 2020 JIANG PENG CHENG. All rights reserved.
//

#import "NFCrashException.h"

@interface NFCrashException()

@property(nonatomic)NSException* exception;

@end

@implementation NFCrashException

+ (instancetype)exceptionWithNSException:(NSException *)exception dto:(NSString *)dto{
    return [[NFCrashException alloc] initWithNSException:exception dto:dto];
}

- (instancetype)initWithNSException:(NSException *)exception dto:(NSString *)dto
{
    self = [super init];
    if (self) {
        _defaultToDo = dto;
        _exception = exception;
        
    }
    return self;
}

- (void)setException:(NSException *)exception{
    _exception = exception;
    
    //
    _name = exception.name;
    _reason = exception.reason;
    _userInfo = exception.userInfo;
    _callStackReturnAddresses = exception.callStackReturnAddresses;
    
    //
    NSMutableArray* symbols = [NSMutableArray arrayWithArray:exception.callStackSymbols];
    for (int i = 0; i < symbols.count; i++) {
        NSString* symbol = symbols[i];
        if ([symbol containsString:@"nf_avoid_crash_"]) {
            symbols[i] = [symbol stringByReplacingOccurrencesOfString:@"nf_avoid_crash_" withString:@""];
            _place = symbols[i];
            break;
        }
    }
    //
    if (!self.place.length) {
        _place = @"Crash method positioning failed.";
    }
    
    //
    _callStackSymbols = symbols.copy;
}

- (void)printBrief{
#ifdef DEBUG
    NSLog(@"================================NFAVoidCrash Start==================================");
    NSLog(@"NFAVoidCrash Name:%@", self.name);
    NSLog(@"NFAVoidCrash Reason:%@", self.reason);
    NSLog(@"NFAVoidCrash Place:%@", self.place);
    NSLog(@"NFAVoidCrash Deafult to do:%@", self.defaultToDo);
    NSLog(@"NFAVoidCrash Call Stack Symbols:\n%@", self.callStackSymbols);
    NSLog(@"================================NFAVoidCrash End====================================");
#endif
}

@end
