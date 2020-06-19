//
//  NFUnrecogniseSelViewController.m
//  NFGuardDog
//
//  Created by JIANG PENGH CHENG on 2020/6/10.
//  Copyright © 2020 JIANG PENG CHENG. All rights reserved.
//

#import "NFUnrecogniseSelViewController.h"

@interface NFUnrecogniseSelViewController ()

@end

@implementation NFUnrecogniseSelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self testUnrecogniseSelector1];
    [self testUnrecogniseSelector2];
    [self testUnrecogniseSelector3];
    [self testUnrecogniseSelector4];
    [self testUnrecogniseSelector5];
}

// 找不动对象方法
- (void)testUnrecogniseSelector1{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    [self performSelector:@selector(undefinedVCSelector)];
#pragma clang diagnostic pop
}

// 找不动类方法
- (void)testUnrecogniseSelector2{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    [NFUnrecogniseSelViewController performSelector:@selector(undefinedVCSelector)];
#pragma clang diagnostic pop
}

// NSNULL调用
- (void)testUnrecogniseSelector3{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    [[NSNull null] performSelector:@selector(undefinedSelector)];
#pragma clang diagnostic pop
}

// objectForKey setObject
- (void)testUnrecogniseSelector4{
    id obj = @"crash string";
    [obj objectForKey:@"name"];
    [obj setObject:@"" forKey:@"age"];
}

- (void)testUnrecogniseSelector5{
    id nul = [NSNull null];
    [nul performSelector:@selector(testUnrecogniseSelector4)];
}

@end
