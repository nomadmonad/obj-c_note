//
//  AppDelegate.m
//  ex_TabbedAppTemplate
//
//  Created by tyamamo on 2014/04/14.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@property (nonatomic, strong) UITabBarController *myTabBarController;

@end


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    _myTabBarController = (UITabBarController *)_window.rootViewController;
    _myTabBarController.delegate = self;
    
    UITabBarItem *myTabBarItem = _myTabBarController.tabBar.items[2];
    myTabBarItem.badgeValue = @"5";
    
    myTabBarItem = _myTabBarController.tabBar.items[1];
    myTabBarItem.badgeValue = @"danger";
    
    NSLog((@"ビューコントローラの配列 %@"), _myTabBarController.viewControllers);
    
    return YES;
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    NSLog((@"切り替え前のインデックス: %d"), tabBarController.selectedIndex);
    NSLog(@"切り替え先のViewController %@", viewController);
    
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    UITabBarItem *myTabBarItem;
    if (tabBarController.selectedIndex == 2) {
        myTabBarItem = tabBarController.tabBar.items[2];
        myTabBarItem.badgeValue = nil;
    } else if (tabBarController.selectedIndex == 1) {
        myTabBarItem = tabBarController.tabBar.items[1];
        myTabBarItem.badgeValue = nil;
    }
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

@end
