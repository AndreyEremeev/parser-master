//
//  AppDelegate.m
//  RSS reader sec
//
//  Created by admin on 10/27/12.
//  Copyright (c) 2012 AndrewEremeev. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"

@implementation AppDelegate
@synthesize window;

- (void)dealloc
{
    [window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];

    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:[[RootViewController new]autorelease]];
    self.window.rootViewController = navController;
    [navController release];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    return YES;
}


@end
