//
//  NFNSArrayCrashViewController.m
//  NFGuardDog
//
//  Created by JIANG PENGH CHENG on 2020/6/11.
//  Copyright © 2020 JIANG PENG CHENG. All rights reserved.
//

#import "NFNSArrayCrashViewController.h"

@interface NFNSArrayCrashViewController ()

@end

@implementation NFNSArrayCrashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self testNSArrayCrash1];
    [self testNSArrayCrash2];
    [self testNSArrayCrash3];
}

// 数值中包含nil对象
- (void)testNSArrayCrash1 {
    NSString *nilStr = nil;
    id  _Nonnull __unsafe_unretained newObjects[2];
    newObjects[0] = @"xxx.xxx";
    newObjects[1] = nil;
    NSArray *array1 = [NSArray arrayWithObjects:newObjects count:2];
    NSArray *array2 = @[@"J.P.C", nilStr, @"iOSDeveloper"];
    NSLog(@"%@,%@",array1, array2);
}

// NSArray下标越界
- (void)testNSArrayCrash2 {
    NSArray *placeholder = [NSArray alloc];
    NSArray *arr1 = [[NSArray alloc] init];
    NSArray *arr2 = [[NSArray alloc] initWithObjects:@0, nil];
    NSArray *arr3 = [[NSArray alloc] initWithObjects:@0, @1, nil];
    NSArray *arr4 = [[NSArray alloc] initWithObjects:@0, @1, @2, nil];
    
    NSLog(@"placeholder: %s", object_getClassName(placeholder));
    NSLog(@"arr1: %s", object_getClassName(arr1));
    NSLog(@"arr2: %s", object_getClassName(arr2));
    NSLog(@"arr3: %s", object_getClassName(arr3));
    NSLog(@"arr4: %s", object_getClassName(arr4));
    
    id obj = nil;
    obj = arr1[100];
    obj = arr2[100];
    obj = arr3[100];
    obj = arr4[100];
    
    obj = [arr1 objectsAtIndexes:[[NSIndexSet alloc] initWithIndexesInRange:NSMakeRange(1, 100)]];
    obj = [arr2 objectsAtIndexes:[[NSIndexSet alloc] initWithIndexesInRange:NSMakeRange(1, 100)]];
    obj = [arr3 objectsAtIndexes:[[NSIndexSet alloc] initWithIndexesInRange:NSMakeRange(1, 100)]];
    obj = [arr4 objectsAtIndexes:[[NSIndexSet alloc] initWithIndexesInRange:NSMakeRange(1, 100)]];
    
    id  _Nonnull __unsafe_unretained newObjects[2];
    [arr1 getObjects:newObjects range:NSMakeRange(1, 100)];
    [arr2 getObjects:newObjects range:NSMakeRange(1, 100)];
    [arr3 getObjects:newObjects range:NSMakeRange(1, 100)];
    [arr4 getObjects:newObjects range:NSMakeRange(1, 1)];
}

// NSMutableArray下标越界
- (void)testNSArrayCrash3{
    NSMutableArray *mPlaceholder = [NSMutableArray alloc];
    NSMutableArray *mArr1 = [[NSMutableArray alloc] init];
    NSMutableArray *mArr2 = [[NSMutableArray alloc] initWithObjects:@0, nil];
    NSMutableArray *mArr3 = [[NSMutableArray alloc] initWithObjects:@0, @1, nil];
    
    NSLog(@"mPlaceholder: %s", object_getClassName(mPlaceholder));
    NSLog(@"mArr1: %s", object_getClassName(mArr1));
    NSLog(@"mArr2: %s", object_getClassName(mArr2));
    NSLog(@"mArr3: %s", object_getClassName(mArr3));
    
    id obj = nil;
    
    //objectsAtIndexes:
    obj = [mArr1 objectsAtIndexes:[[NSIndexSet alloc] initWithIndexesInRange:NSMakeRange(1, 100)]];
    
    //objectAtIndex:
    obj = [mArr1 objectAtIndex:100];
       
    //objectAtIndexedSubscript
    obj = mArr1[100];
    
    //setObject:atIndexedSubscript:
    [mArr1 setObject:nil atIndexedSubscript:100];
    [mArr1 setObject:@"J.P.C.1" atIndexedSubscript:1];
    [mArr1 setObject:@"J.P.C.1" atIndexedSubscript:0];
        
    //removeObjectAtIndex:
    [mArr1 removeObjectAtIndex:100];
    
    //insertObject:atIndex:
    [mArr1 insertObject:@"J.P.C.2" atIndex:2];
    [mArr1 insertObject:@"J.P.C.2" atIndex:1];
    [mArr1 insertObject:@"J.P.C.3" atIndex:0];
    [mArr1 insertObject:nil atIndex:0];
    
    //getObjects:range:
    id  _Nonnull __unsafe_unretained newObjects[2];
    [mArr1 getObjects:newObjects range:NSMakeRange(1, 100)];
}

@end
