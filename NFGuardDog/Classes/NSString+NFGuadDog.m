//
//  NSString+NFGuadDog.m
//  NFGuardDog
//
//  Created by JIANG PENGH CHENG on 2020/6/12.
//  Copyright © 2020 JIANG PENG CHENG. All rights reserved.
//

#import "NSString+NFGuadDog.h"
#import "NSObject+NFMethodSwizzling.h"
#import "NFGuardDog.h"
#import "NFCommonDefine.h"

@implementation NSString (NFGuadDog)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class __NSCFConstantString = NSClassFromString(@"__NSCFConstantString");
        [self swizzlingInstanceMethodForCls:__NSCFConstantString];
        Class __NSCFString = NSClassFromString(@"__NSCFString");
        [self swizzlingInstanceMethodForCls:__NSCFString];
    });
}

+ (void)swizzlingInstanceMethodForCls:(Class)cls{
    //characterAtIndex
    [cls nf_SwizzlingInstanceMethod:@selector(characterAtIndex:) withMethod:@selector(nf_avoid_crash_characterAtIndex:)];
    
    //substringFromIndex
    [cls nf_SwizzlingInstanceMethod:@selector(substringFromIndex:) withMethod:@selector(nf_avoid_crash_substringFromIndex:)];
    
    //substringToIndex
    [cls nf_SwizzlingInstanceMethod:@selector(substringToIndex:) withMethod:@selector(nf_avoid_crash_substringToIndex:)];
    
    //substringWithRange:
    [cls nf_SwizzlingInstanceMethod:@selector(substringWithRange:) withMethod:@selector(nf_avoid_crash_substringWithRange:)];
    
    //stringByReplacingOccurrencesOfString:
    [cls nf_SwizzlingInstanceMethod:@selector(stringByReplacingOccurrencesOfString:withString:) withMethod:@selector(nf_avoid_crash_stringByReplacingOccurrencesOfString:withString:)];
    
    //stringByReplacingOccurrencesOfString:withString:options:range:
    [cls nf_SwizzlingInstanceMethod:@selector(stringByReplacingOccurrencesOfString:withString:options:range:) withMethod:@selector(nf_avoid_crash_stringByReplacingOccurrencesOfString:withString:options:range:)];
    
    //stringByReplacingCharactersInRange:withString:
    [cls nf_SwizzlingInstanceMethod:@selector(stringByReplacingCharactersInRange:withString:) withMethod:@selector(nf_avoid_crash_stringByReplacingCharactersInRange:withString:)];
}

- (unichar)nf_avoid_crash_characterAtIndex:(NSUInteger)index{
    unichar ret = 0;
    @try {
        ret = [self nf_avoid_crash_characterAtIndex:index];
    } @catch (NSException *exception) {
        [NFGuardDog notiErrorWithException:exception defaultToDo:NFAvoidCrashDefaultReturnZero];
    } @finally {
        return ret;
    }
}

- (NSString *)nf_avoid_crash_substringFromIndex:(NSUInteger)from{
    NFCatchExceptionWithReturnNil([self nf_avoid_crash_substringFromIndex:from];)
}

- (NSString *)nf_avoid_crash_substringToIndex:(NSUInteger)to{
    NFCatchExceptionWithReturnNil([self nf_avoid_crash_substringToIndex:to];)
}

- (NSString *)nf_avoid_crash_substringWithRange:(NSRange)range{
    NFCatchExceptionWithReturnNil([self nf_avoid_crash_substringWithRange:range];)
}

- (NSString *)nf_avoid_crash_stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement{
    NFCatchExceptionWithReturnNil([self nf_avoid_crash_stringByReplacingOccurrencesOfString:target withString:replacement];)
}

- (NSString *)nf_avoid_crash_stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange{
    NFCatchExceptionWithReturnNil([self nf_avoid_crash_stringByReplacingOccurrencesOfString:target withString:replacement options:options range:searchRange];)
}

- (NSString *)nf_avoid_crash_stringByReplacingCharactersInRange:(NSRange)range withString:(NSString *)replacement{
    NFCatchExceptionWithReturnNil([self nf_avoid_crash_stringByReplacingCharactersInRange:range withString:replacement];)
}

@end
