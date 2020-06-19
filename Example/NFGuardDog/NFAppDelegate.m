//
//  NFAppDelegate.m
//  NFGuardDog
//
//  Created by JIANG PENGH CHENG on 06/18/2020.
//  Copyright (c) 2020 JIANG PENGH CHENG. All rights reserved.
//

#import "NFAppDelegate.h"
#import "NFGuardDog.h"

@interface NFAppDelegate()<NFAvoidCrashDelegate>

@end

@implementation NFAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    //1. 启动所有避免crash组件
    [NFGuardDog startAvoidAllCrashWithdelegate:self];
    
    //2. 启动部分避免crash组件
    //NFAvoidCrashType type = NFAvoidCrashTypeKVC | NFAvoidCrashTypeKVO;
    //[NFGuardDog startAvoidCrash:type delegate:self];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)nf_handleAvoidCrashException:(NFCrashException *)exception{
    NSLog(@"🐞🐞🐞：you have a crash need to process，see upward⬆️");
    
    //To do: 你可以在这儿上传捕获的异常😎😎😎
}

@end
