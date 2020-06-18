//
//  NFNSAttributedStringCrashViewController.m
//  NFGuardDog
//
//  Created by JIANG PENGH CHENG on 2020/6/17.
//  Copyright © 2020 JIANG PENG CHENG. All rights reserved.
//

#import "NFNSAttributedStringCrashViewController.h"

@interface NFNSAttributedStringCrashViewController ()

@end

@implementation NFNSAttributedStringCrashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self testNSAttributedStringCrash1];
    [self testNSAttributedStringCrash2];
}

// NSAttributedString Crash
- (void)testNSAttributedStringCrash1{
    NSString *nilStr = nil;
    
    //initWithString:
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:nilStr];
    NSLog(@"initWithString: %@",attributeStr);
    
    //initWithAttributedString
    NSAttributedString *nilAttributedStr = nil;
    attributeStr = [[NSAttributedString alloc] initWithAttributedString:nilAttributedStr];
    NSLog(@"initWithAttributedString: %@",attributeStr);
    
    //initWithString:attributes:
    attributeStr = [[NSAttributedString alloc]initWithString:nilStr attributes:@{NSForegroundColorAttributeName: UIColor.whiteColor}];
    NSLog(@"initWithString: %@",attributeStr);
}

// NSMutableAttributedString Crash
- (void)testNSAttributedStringCrash2{
    NSString *nilStr = nil;
    
    //initWithString:
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:nilStr];
    NSLog(@"initWithString: %@",attributeStr);
    
    //initWithAttributedString
    NSAttributedString *nilAttributedStr = nil;
    attributeStr = [[NSMutableAttributedString alloc] initWithAttributedString:nilAttributedStr];
    NSLog(@"initWithAttributedString: %@",attributeStr);
    
    //initWithString:attributes:
    attributeStr = [[NSMutableAttributedString alloc]initWithString:nilStr attributes:@{NSForegroundColorAttributeName: UIColor.whiteColor}];
    NSLog(@"initWithString: %@",attributeStr);
}

@end
