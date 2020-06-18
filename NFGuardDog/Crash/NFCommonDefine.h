//
//  NFCommonDefine.h
//  NFGuardDog
//
//  Created by JIANG PENGH CHENG on 2020/6/9.
//  Copyright © 2020 JIANG PENG CHENG. All rights reserved.
//

#ifndef NFCommonDefine_h
#define NFCommonDefine_h

#define NFAvoidCrashDefaultReturnNil  @"NFAvoidCrash default is to return nil to avoid crash."
#define NFAvoidCrashDefaultIgnore     @"NFAvoidCrash default is to ignore this operation to avoid crash."
#define NFAvoidCrashDefaultRemoveNil  @"NFAvoidCrash default is to remove nil object to avoid crash."
#define NFAvoidCrashDefaultReturnZero @"NFAvoidCrash default is to return a without assign unichar."


#define NFCatchExceptionWithIgonore(expr) \
    @try {\
        expr\
    } @catch (NSException *exception) {\
        [[NFAvoidCrash shareInstance] notiErrorWithException:exception defaultToDo:NFAvoidCrashDefaultIgnore];\
    } @finally {\
    }

#define NFCatchExceptionWithReturnNil(expr)\
    id ret = nil;\
    @try {\
        ret = expr\
    } @catch (NSException *exception) {\
        [[NFAvoidCrash shareInstance] notiErrorWithException:exception defaultToDo:NFAvoidCrashDefaultReturnNil];\
    } @finally {\
        return ret;\
    }

#endif /* NFCommonDefine_h */
