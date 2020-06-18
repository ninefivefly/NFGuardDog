//
//  NFCommonDefine.h
//  NFGuardDog
//
//  Created by JIANG PENGH CHENG on 2020/6/9.
//  Copyright © 2020 JIANG PENG CHENG. All rights reserved.
//

#ifndef NFCommonDefine_h
#define NFCommonDefine_h

#define NFAvoidCrashNotification      @"AvoidCrashNotification"
#define NFAvoidCrashIsiOS(version)    ([[UIDevice currentDevice].systemVersion floatValue] >= version)


//user can ignore below define
#define NFAvoidCrashDefaultReturnNil  @"AvoidCrash default is to return nil to avoid crash."
#define NFAvoidCrashDefaultIgnore     @"AvoidCrash default is to ignore this operation to avoid crash."
#define NFAvoidCrashDefaultRemoveNil  @"AvoidCrash default is to remove nil object to avoid crash."
#define NFAvoidCrashDefaultReturnZero @"AvoidCrash default is to return a without assign unichar."

#define NFAvoidCrashSeparator         @"================================================================"
#define NFAvoidCrashSeparatorWithFlag @"========================AvoidCrash Log=========================="

#ifdef DEBUG
#define NFAvoidCrashLog(...)          NSLog(@"%@",[NSString stringWithFormat:__VA_ARGS__])
#else
#define NFAvoidCrashLog(...)
#endif


#define NFCatchExceptionWithIgonore(expr) \
    @try {\
        expr\
    } @catch (NSException *exception) {\
        [NFGuardDog notiErrorWithException:exception defaultToDo:NFAvoidCrashDefaultIgnore];\
    } @finally {\
    }

#define NFCatchExceptionWithReturnNil(expr)\
    id ret = nil;\
    @try {\
        ret = expr\
    } @catch (NSException *exception) {\
        [NFGuardDog notiErrorWithException:exception defaultToDo:NFAvoidCrashDefaultReturnNil];\
    } @finally {\
        return ret;\
    }

#endif /* NFCommonDefine_h */
