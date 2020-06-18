//
//  NFNStringCrashViewController.m
//  NFGuardDog
//
//  Created by JIANG PENGH CHENG on 2020/6/17.
//  Copyright © 2020 JIANG PENG CHENG. All rights reserved.
//

#import "NFNStringCrashViewController.h"

@interface NFNStringCrashViewController ()

@end

@implementation NFNStringCrashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self testNSStringCrash1];
    [self testNSStringCrash2];
    [self testNSStringCrash3];
}

// NSString Crash
- (void)testNSStringCrash1{
    [self testNSStringCrash:@"xxx.xxx"];
}

// NSMutableString Crash
- (void)testNSStringCrash2{
    [self testNSStringCrash:@"xxx.xxx".mutableCopy];
}

// NSMutableString Crash
- (void)testNSStringCrash3{
    NSMutableString *mutableStr = [NSMutableString stringWithFormat:@"xxx.xxx"];
    NSRange range = NSMakeRange(0, 1000);
    
    //replaceCharactersInRange
    [mutableStr replaceCharactersInRange:range withString:@"--"];
    NSLog(@"replaceCharactersInRange: %@", mutableStr);

    //insertString:atIndex:
    [mutableStr insertString:@"yyy" atIndex:100];
    NSLog(@"insertString: %@", mutableStr);
    
    //deleteCharactersInRange
    [mutableStr deleteCharactersInRange:range];
    NSLog(@"insertString: %@", mutableStr);
}

- (void)testNSStringCrash:(NSString *)str{
    //characterAtIndex
    unichar characteristic = [str characterAtIndex:100];
    NSLog(@"characterAtIndex: %c",characteristic);
    
    //substringFromIndex:
    NSString* subStr = [str substringFromIndex:100];
    NSLog(@"substringFromIndex: %@", subStr);

    //substringToIndex
    subStr = [str substringToIndex:100];
    NSLog(@"substringToIndex: %@", subStr);
    
    //substringWithRange:
    subStr = [str substringWithRange:NSMakeRange(0, 100)];
    NSLog(@"substringWithRange: %@", subStr);
    
    //stringByReplacingOccurrencesOfString:
    NSString* nilStr = nil;
    subStr = [str stringByReplacingOccurrencesOfString:nilStr withString:nilStr];
    NSLog(@"stringByReplacingOccurrencesOfString: %@", subStr);
    subStr = [str stringByReplacingOccurrencesOfString:@"xx" withString:@"y"];
    NSLog(@"stringByReplacingOccurrencesOfString: %@", subStr);
    subStr = [str stringByReplacingOccurrencesOfString:@"x" withString:@"y"];
    NSLog(@"stringByReplacingOccurrencesOfString: %@", subStr);
    
    //stringByReplacingOccurrencesOfString:withString:options:range:
    subStr = [str stringByReplacingOccurrencesOfString:@"yy" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, 100)];
    NSLog(@"stringByReplacingOccurrencesOfString: %@", subStr);
    subStr = [str stringByReplacingOccurrencesOfString:@"Xx" withString:@"y" options:NSCaseInsensitiveSearch range:NSMakeRange(0, str.length)];
    NSLog(@"stringByReplacingOccurrencesOfString: %@", subStr);
    
    //stringByReplacingCharactersInRange:withString:
    subStr = [str stringByReplacingCharactersInRange:NSMakeRange(0, 100) withString:@"yyy.yyy"];
    NSLog(@"stringByReplacingCharactersInRange: %@", subStr);
}


@end
