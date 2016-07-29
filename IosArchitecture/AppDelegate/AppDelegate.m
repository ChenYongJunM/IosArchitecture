//
//  AppDelegate.m
//  IosArchitecture
//
//  Created by Chen on 16/7/26.
//  Copyright © 2016年 Chen. All rights reserved.
//

#import "AppDelegate.h"
//主控制器
#import "VCMyStoreViewController.h"
#import "VCMessageViewController.h"
#import "VCDiscoveryViewController.h"
#import "VCAboutViewController.h"

#import "CYBaseNavigationViewController.h"
#import "JPFPSStatus.h"
#import "JPUSHService.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor grayColor];
    
    [self installdata];
    [self initializeTabBarControllers];
    
    //测试
    [[JPFPSStatus sharedInstance] open];

    [JPUSHService registerForRemoteNotificationTypes:(UIUserNotificationTypeBadge |
                                                          UIUserNotificationTypeSound |
                                                          UIUserNotificationTypeAlert)
                                              categories:nil];
    [JPUSHService setupWithOption:launchOptions appKey:@"3e052731afe811be0e88f115"
                          channel:nil apsForProduction:NO];
    
    return YES;
}

-(void)installdata
{
    /******************************** Core Data ********************************/
    [[NLCoreData shared] setModelName:kCoreDataModelName];
    
    /******************************** Core Data ********************************/
}

- (void)initializeTabBarControllers
{
    VCMyStoreViewController *c1 =[[VCMyStoreViewController alloc] init];
    CYBaseNavigationViewController *nav1 = [[CYBaseNavigationViewController alloc] initWithRootViewController:c1];
    c1.tabBarItem.title=@"首页";
    c1.tabBarItem.image=[UIImage imageNamed:@"Store"];
    
    VCMessageViewController *c2 =[[VCMessageViewController alloc] init];
    CYBaseNavigationViewController *nav2 = [[CYBaseNavigationViewController alloc] initWithRootViewController:c2];
    c2.tabBarItem.title=@"消息";
    c2.tabBarItem.image=[UIImage imageNamed:@"Message"];
    c2.tabBarItem.badgeValue=@"99";
    
    VCDiscoveryViewController *c3 =[[VCDiscoveryViewController alloc] init];
    CYBaseNavigationViewController *nav3 = [[CYBaseNavigationViewController alloc] initWithRootViewController:c3];
    c3.tabBarItem.title=@"发现";
    c3.tabBarItem.image=[UIImage imageNamed:@"Discovery"];
    
    VCAboutViewController *c4 =[[VCAboutViewController alloc] init];
    CYBaseNavigationViewController *nav4 = [[CYBaseNavigationViewController alloc] initWithRootViewController:c4];
    c4.tabBarItem.title=@"我的";
    c4.tabBarItem.image=[UIImage imageNamed:@"Mine"];
    
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[nav1,nav2,nav3,nav4];
    

    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
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


#pragma Notification
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    [JPUSHService registerDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    [JPUSHService handleRemoteNotification:userInfo];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    // IOS 7 Support Required
    [JPUSHService handleRemoteNotification:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);
}
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    //Optional
    NSLog(@"did Fail To Register For Remote Notifications With Error: %@", error
          );
}

@end
