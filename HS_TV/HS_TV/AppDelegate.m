//
//  AppDelegate.m
//  HS_TV
//
//  Created by iURCoder on 12/13/15.
//  Copyright © 2015 iUR. All rights reserved.
//

#import "AppDelegate.h"
#import "IHNavigationController.h"
#import "Reachability.h"
@interface AppDelegate ()
{
    Reachability *_reach;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    IHNavigationController * nac = [[IHNavigationController alloc] init];
    self.window.rootViewController = nac;
    [self.window makeKeyAndVisible];

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    _reach=[Reachability reachabilityWithHostName:@"www.baidu.com"];
    [_reach startNotifier];
    
    return YES;
}
//  每次试图切换的时候都会走的方法,用于控制设备的旋转方向.
-(UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    if (_isRotation) {
        return UIInterfaceOrientationMaskLandscape;
    }else {
        return UIInterfaceOrientationMaskPortrait;
    }
}
-(void)reachabilityChanged:(NSNotification *)noti{
    Reachability *reach=[noti object];
    if (reach.isReachable) {
        NSLog(@"网络正常");
        if (reach.currentReachabilityStatus==kReachableViaWiFi) {
            NSLog(@"当前网络wifi");
        }
        if (reach.currentReachabilityStatus==kReachableViaWWAN) {
            NSLog(@"当前网络3g/4g");
        }
    }else{
        NSLog(@"网络异常，请检查你的网络");
    }
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
