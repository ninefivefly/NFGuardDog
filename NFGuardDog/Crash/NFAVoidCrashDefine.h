//
//  NFAVoidCrashDefine.h
//  NFGuardDog
//
//  Created by JIANG PENGH CHENG on 2020/6/18.
//  Copyright © 2020 JIANG PENGH CHENG. All rights reserved.
//

#ifndef NFAVoidCrashDefine_h
#define NFAVoidCrashDefine_h

#import "NFCrashException.h"

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

#endif /* NFAVoidCrashDefine_h */
