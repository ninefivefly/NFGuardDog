//
//  NFKVOCrashViewController.m
//  NFGuardDog
//
//  Created by JIANG PENGH CHENG on 2020/6/10.
//  Copyright © 2020 JIANG PENG CHENG. All rights reserved.
//

#import "NFKVOCrashViewController.h"
#import "NFCrashObject.h"

@interface NFKVOCrashViewController ()

@property(nonatomic)NFCrashObject* mObject;

@end

@implementation NFKVOCrashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mObject = [NFCrashObject new];
    
//    [self testKVOCrash11];
//    [self testKVOCrash12];
//    [self testKVOCrash13];
//    [self testKVOCrash2];
//    [self testKVOCrash3];
//    [self testKVOCrash4];
}


/**
 1.1 移除了未注册的观察者，导致崩溃
 */
- (void)testKVOCrash11 {
    // 崩溃日志：Cannot remove an observer XXX for the key path "xxx" from XXX because it is not registered as an observer.
    [self.mObject removeObserver:self forKeyPath:@"name"];
}

/**
 1.2 重复移除多次，移除次数多于添加次数，导致崩溃
 */
- (void)testKVOCrash12 {
    // 崩溃日志：Cannot remove an observer XXX for the key path "xxx" from XXX because it is not registered as an observer.
    [self.mObject addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:NULL];
    self.mObject.name = @"0";
    [self.mObject removeObserver:self forKeyPath:@"name"];
    [self.mObject removeObserver:self forKeyPath:@"name"];
}

/**
 1.3 重复添加多次，虽然不会崩溃，但是发生改变时，也同时会被观察多次。
 */
- (void)testKVOCrash13 {
    [self.mObject addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:NULL];
    [self.mObject addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:NULL];
    self.mObject.name = @"0";
}

// 2. 被观察者 dealloc 时仍然注册着 KVO，导致崩溃
- (void)testKVOCrash2 {
    // 崩溃日志：An instance xxx of class xxx was deallocated while key value observers were still registered with it.
    // iOS 10 及以下会导致崩溃，iOS 11 之后就不会崩溃了
    NFCrashObject *obj = [[NFCrashObject alloc] init];
    [obj addObserver: self
          forKeyPath: @"name"
             options: NSKeyValueObservingOptionNew
             context: nil];
}

// 3. 观察者没有实现 -observeValueForKeyPath:ofObject:change:context:导致崩溃
- (void)testKVOCrash3 {
    // 崩溃日志：An -observeValueForKeyPath:ofObject:change:context: message was received but not handled.
    NFCrashObject *obj = [[NFCrashObject alloc] init];
    
    [self addObserver: obj
           forKeyPath: @"title"
              options: NSKeyValueObservingOptionNew
              context: nil];
    
    self.title = @"111";
}

// 4. 添加或者移除时 keypath == nil，导致崩溃。
- (void)testKVOCrash4 {
    // 崩溃日志： -[__NSCFConstantString characterAtIndex:]: Range or index out of bounds
    NFCrashObject *obj = [[NFCrashObject alloc] init];
    
    [self addObserver: obj
           forKeyPath: @""
              options: NSKeyValueObservingOptionNew
              context: nil];
    
    //    [self removeObserver:obj forKeyPath:@""];
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary*)change context:(void *)context {
    
    NSLog(@"object = %@, keyPath = %@", object, keyPath);
}


@end
