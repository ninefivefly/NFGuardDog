//
//  NFNSDictionaryCrashViewController.m
//  NFGuardDog
//
//  Created by JIANG PENGH CHENG on 2020/6/17.
//  Copyright © 2020 JIANG PENG CHENG. All rights reserved.
//

#import "NFNSDictionaryCrashViewController.h"

@interface NFNSDictionaryCrashViewController ()

@end

@implementation NFNSDictionaryCrashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self testNSDictionaryCrash1];
    [self testNSDictionaryCrash2];
    [self testNSDictionaryCrash3];
    [self testNSDictionaryCrash4];
}

// dictionaryWithObjects:forKeys:count:
- (void)testNSDictionaryCrash1{
    NSString *nilStr = nil;
    NSDictionary *dict = @{
        @"name" : @"xxx.xxx",
        @"age" : nilStr,
        nilStr : @"yyy.yyy"
    };
    NSLog(@"%@", dict);
}

// setObject:forKeyedSubscript:
- (void)testNSDictionaryCrash2 {
    NSMutableDictionary *dict = @{
        @"name" : @"xxx.xxx"
    }.mutableCopy;
    NSString *ageKey = nil;
    dict[ageKey] = @(25);
    NSLog(@"%@", dict);
}

// setObject:forKey:
- (void)testNSDictionaryCrash3 {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    NSString *ageKey = nil;
    [dict setObject:@(25) forKey:ageKey];
    NSLog(@"%@", dict);
}

// removeObjectForKey:
- (void)testNSDictionaryCrash4 {
    
    NSMutableDictionary *dict = @{
        @"name" : @"xxx.xxx",
        @"age" : @(25)
    }.mutableCopy;
    
    NSString *key = nil;
    [dict removeObjectForKey:key];
    NSLog(@"%@", dict);
}



@end
