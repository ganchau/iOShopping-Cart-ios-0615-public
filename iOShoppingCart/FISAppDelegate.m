//
//  FISAppDelegate.m
//  iOShoppingCart
//
//  Created by Chris Gonzales on 5/8/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import "FISAppDelegate.h"
#import "FISCart.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    FISCart *cart = [[FISCart alloc] init];
    FISItem *hat = [[FISItem alloc] initWithName:@"hat" andPrice:@20];
    FISItem *shirt = [[FISItem alloc] initWithName:@"shirt" andPrice:@15];
    FISItem *iPhone = [[FISItem alloc] initWithName:@"iPhone" andPrice:@650];
    FISItem *MacBook = [[FISItem alloc] initWithName:@"MacBook" andPrice:@1300];
    
    [cart addItem:hat];
    [cart addItem:iPhone];
    [cart addItem:shirt];
    [cart removeItem:hat];
    [cart addItem:shirt];
    [cart addItem:iPhone];
    [cart addItem:shirt];
    [cart addItem:MacBook];
    [cart addItem:shirt];
    [cart addItem:shirt];
    [cart addItem:shirt];
    [cart addItem:shirt];
    [cart addItem:shirt];
    [cart addItem:hat];
    [cart addItem:shirt];
    [cart removeItem:iPhone];
    [cart addItem:shirt];
    [cart addItem:shirt];
    [cart removeItem:shirt];
    [cart addItem:hat];

    
    NSLog(@"%@", cart);
    
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

@end
