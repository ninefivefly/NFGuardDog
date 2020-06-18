//
//  NFWeakObjectProxy.h
//  NFGuardDog
//
//  Created by JIANG PENGH CHENG on 2020/6/17.
//  Copyright © 2020 JIANG PENG CHENG. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NFWeakObjectProxy : NSProxy

//
@property(nonatomic, weak)id target;

//
+ (id)proxyForTarget:(id)target;

@end

#define NFWeakObjectProxy(target) [NFWeakObjectProxy proxyForTarget:target]

NS_ASSUME_NONNULL_END
