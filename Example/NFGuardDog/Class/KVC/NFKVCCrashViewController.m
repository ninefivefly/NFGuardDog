//
//  NFKVCCrashViewController.m
//  NFGuardDog
//
//  Created by JIANG PENGH CHENG on 2020/6/10.
//  Copyright © 2020 JIANG PENG CHENG. All rights reserved.
//

#import "NFKVCCrashViewController.h"
#import "NFCrashObject.h"

@interface NFKVCCrashViewController ()

@property(nonatomic)NFCrashObject* mObject;

@end

@implementation NFKVCCrashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self testKVCCrash1];
//    [self testKVCCrash2];
//    [self testKVCCrash3];
    [self testKVCCrash4];
//    [self testKVCCrash5];
}

// 1. key 不是对象的属性，造成崩溃
- (void)testKVCCrash1 {
    NFCrashObject *objc = [[NFCrashObject alloc] init];
    [objc setValue:@"value" forKey:@"address"];
    [objc valueForKey:@"address"];
}

// 2. keyPath 不正确，造成崩溃
- (void)testKVCCrash2 {
    NFCrashObject *objc = [[NFCrashObject alloc] init];
    [objc setValue:@"春熙路" forKeyPath:@"address.street"];
}

// 3. key 为 nil，造成崩溃
- (void)testKVCCrash3 {
    NSString *keyName;
    NFCrashObject *objc = [[NFCrashObject alloc] init];
    [objc setValue:@"value" forKey:keyName];
}

// 4. 类型不匹配
- (void)testKVCCrash4 {
    NFCrashObject *objc = [[NFCrashObject alloc] init];
    [objc setValue:nil forKey:@"age"];
}

// 5. key不是对象属性
- (void)testKVCCrash5 {
    NFCrashObject *objc = [[NFCrashObject alloc] init];
    [objc setValuesForKeysWithDictionary:@{@"age":@(10), @"phone":@"119"}];
}

@end
