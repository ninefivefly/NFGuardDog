//
//  NSAttributedString+NFGuardDog.m
//  NFGuardDog
//
//  Created by JIANG PENGH CHENG on 2020/6/12.
//  Copyright © 2020 JIANG PENG CHENG. All rights reserved.
//

#import "NSAttributedString+NFGuardDog.h"
#import "NSObject+NFMethodSwizzling.h"
#import "NFGuardDog.h"
#import "NFCommonDefine.h"

@implementation NSAttributedString (NFGuardDog)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class cls = NSClassFromString(@"NSConcreteAttributedString");
        
        //initWithString:
        [cls nf_SwizzlingInstanceMethod:@selector(initWithString:) withMethod:@selector(nf_avoid_crash_initWithString:)];
        
        //initWithAttributedString
        [cls nf_SwizzlingInstanceMethod:@selector(initWithAttributedString:) withMethod:@selector(nf_avoid_crash_initWithAttributedString:)];
        
        //initWithString:attributes:
        [cls nf_SwizzlingInstanceMethod:@selector(initWithString:attributes:) withMethod:@selector(nf_avoid_crash_initWithString:attributes:)];
    });
}

- (instancetype)nf_avoid_crash_initWithString:(NSString *)str{
    NFCatchExceptionWithReturnNil([self nf_avoid_crash_initWithString:str];)
}

- (instancetype)nf_avoid_crash_initWithAttributedString:(NSAttributedString *)attrStr{
    NFCatchExceptionWithReturnNil([self nf_avoid_crash_initWithAttributedString:attrStr];)
}

- (instancetype)nf_avoid_crash_initWithString:(NSString *)str attributes:(NSDictionary<NSAttributedStringKey,id> *)attrs{
    NFCatchExceptionWithReturnNil([self nf_avoid_crash_initWithString:str attributes:attrs];)
}


@end
