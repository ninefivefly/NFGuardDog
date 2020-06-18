//
//  NFNSTimerCrashViewController.m
//  NFGuardDog
//
//  Created by JIANG PENGH CHENG on 2020/6/17.
//  Copyright © 2020 JIANG PENG CHENG. All rights reserved.
//

#import "NFNSTimerCrashViewController.h"

@interface NFNSTimerCrashViewController ()

@property(nonatomic)NSTimer* mTimer;
@property (nonatomic, strong) NSThread *thread1;

@property(nonatomic)NSRunLoop* threadRunLoop;
@property(nonatomic)NSPort* threadPort;
@property(nonatomic)BOOL stopLoopRunning;

@end

@implementation NFNSTimerCrashViewController

- (void)dealloc
{
    [self.mTimer invalidate];
    NSLog(@"dealloc %@", NSStringFromClass(self.class));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self testTimer1];
    [self testTimer2];
}

- (void)testTimer1{
    self.mTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timer_invoke) userInfo:nil repeats:YES];
}

- (void)testTimer2{
    NSLog(@"start timer.");
    self.mTimer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timer_invoke) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.mTimer forMode:NSDefaultRunLoopMode];
}


-(void)timer_invoke {
    NSLog(@"timer invoke!");
}

@end
