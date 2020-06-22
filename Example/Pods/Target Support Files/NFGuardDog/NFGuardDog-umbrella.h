#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "NFGuardDog.h"
#import "NFAvoidCrash.h"
#import "NFAVoidCrashDefine.h"
#import "NFCommonDefine.h"
#import "NFCrashException.h"
#import "NFWeakObjectProxy.h"
#import "NSArray+NFGuardDog.h"
#import "NSAttributedString+NFGuardDog.h"
#import "NSDictionary+NFGuardDog.h"
#import "NSMutableArray+NFGuardDog.h"
#import "NSMutableAttributedString+NFGuardDog.h"
#import "NSMutableDictionary+NFGuardDog.h"
#import "NSMutableString+NFGuardDog.h"
#import "NSObject+NFGuardDogKVC.h"
#import "NSObject+NFGuardDogKVO.h"
#import "NSObject+NFGuardDogUnrecognizedSel.h"
#import "NSObject+NFMethodSwizzling.h"
#import "NSString+NFGuadDog.h"
#import "NSTimer+NFGuardDog.h"

FOUNDATION_EXPORT double NFGuardDogVersionNumber;
FOUNDATION_EXPORT const unsigned char NFGuardDogVersionString[];

