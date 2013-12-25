//
//  AppDelegate.m
//  JustYours
//
//  Created by Milan on 13-12-9.
//  Copyright (c) 2013年 A4A. All rights reserved.
//

#import "AppDelegate.h"
#import "AppStart.h"
#import "RootViewController.h"

#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    [[UINavigationBar appearance]setBarTintColor:RGBA(23, 184, 209, 1.0)];
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowColor = RGBA(0, 0, 0, 0.8);
    shadow.shadowOffset = CGSizeMake(0, 1);
    [[UINavigationBar appearance]setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:RGBA(245, 245, 245, 1.0),NSForegroundColorAttributeName,shadow,NSShadowAttributeName,
                                                        [UIFont systemFontOfSize:28.0],NSFontAttributeName, nil]];
    
    [AppStart show];
    
    [self performSelector:@selector(hideAppStart) withObject:self afterDelay:1.0f];

    RootViewController *root = [[RootViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:root];
    self.window.rootViewController = nav;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)hideAppStart
{
    NSLog(@"hideAppStart");
    [AppStart hide];
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
