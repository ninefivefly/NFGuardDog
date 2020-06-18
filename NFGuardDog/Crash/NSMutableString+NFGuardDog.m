//
//  NSMutableString+NFGuardDog.m
//  NFGuardDog
//
//  Created by JIANG PENGH CHENG on 2020/6/12.
//  Copyright © 2020 JIANG PENG CHENG. All rights reserved.
//

#import "NSMutableString+NFGuardDog.h"
#import "NSObject+NFMethodSwizzling.h"
#import "NFAvoidCrash.h"
#import "NFCommonDefine.h"

@implementation NSMutableString (NFGuardDog)

+ (void)nf_swizzleMethods{
    Class __NSCFString = NSClassFromString(@"__NSCFString");
    
    //replaceCharactersInRange
    [__NSCFString nf_SwizzlingInstanceMethod:@selector(replaceCharactersInRange:withString:) withMethod:@selector(nf_avoid_crash_replaceCharactersInRange:withString:)];
    
    //insertString:atIndex:
    [__NSCFString nf_SwizzlingInstanceMethod:@selector(insertString:atIndex:) withMethod:@selector(nf_avoid_crash_insertString:atIndex:)];
    
    //deleteCharactersInRange
    [__NSCFString nf_SwizzlingInstanceMethod:@selector(deleteCharactersInRange:) withMethod:@selector(nf_avoid_crash_deleteCharactersInRange:)];
}

- (void)nf_avoid_crash_replaceCharactersInRange:(NSRange)range withString:(NSString *)aString{
    NFCatchExceptionWithIgonore([self nf_avoid_crash_replaceCharactersInRange:range withString:aString];)
}

- (void)nf_avoid_crash_insertString:(NSString *)aString atIndex:(NSUInteger)loc{
    NFCatchExceptionWithIgonore([self nf_avoid_crash_insertString:aString atIndex:loc];)
}

- (void)nf_avoid_crash_deleteCharactersInRange:(NSRange)range{
    NFCatchExceptionWithIgonore([self nf_avoid_crash_deleteCharactersInRange:range];)
}

@end
