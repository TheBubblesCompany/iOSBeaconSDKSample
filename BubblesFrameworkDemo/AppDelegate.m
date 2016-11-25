//
//  AppDelegate.m
//  BubblesFrameworkDemo
//
//  Created by Pierre RACINE on 21/12/2015.
//  Copyright © 2015 Absolutlabs. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [Bubbles initWithAPIKey:@"48d3edf9d69061cb41c123be9097ddbc" andLocalNotification:[launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey] andIsProd:YES];
    
    [Bubbles setModeCustomView:YES];
    [Bubbles setDebugLogEnabled:YES];
    
    return YES;
}


-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    [Bubbles didReceiveLocalNotification:notification.userInfo];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [Bubbles didEnterBackground];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [Bubbles didBecomeActive];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
