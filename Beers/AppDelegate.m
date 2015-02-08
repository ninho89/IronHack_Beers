//
//  AppDelegate.m
//  Beers
//
//  Created by Filippo Aresu on 5/2/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import "AppDelegate.h"
#import "Beer.h"
#import "Beers.h"
#import "BeersTableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    /*Beer *myBeer = [Beer beerWithName:@"Cruzcampo"];
     myBeer.country = @"España";
     myBeer.alcoholGrade = 5;
     myBeer.imageUrl = @"http://upload.wikimedia.org/wikipedia/commons/9/92/Guinness.jpg";
     
     Beers *beersList = [[Beers alloc] init];
     [beersList addBeer:myBeer];
     [beersList addBeer:myBeer];
     [beersList addBeer:myBeer];*/
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"BeersDatabase" ofType:@"json"];
    Beers *beerList = [[Beers alloc] initFromJSONFile:path];
    
    //NSURL *url = [NSURL URLWithString:@"http://localhost:8888/Beers/BeersDatabase.json"];
    //Beers *beerList = [[Beers alloc] initFromJSONUrl:url];
    
    
    UINavigationController *nc = (UINavigationController *)self.window.rootViewController;
    
    BeersTableViewController *c = (BeersTableViewController *)nc.topViewController;
    c.beers = beerList;
    
    
    
    return YES;
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
