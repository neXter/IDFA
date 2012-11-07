//
//  IDFAAppDelegate.m
//  IDFA
//
//  Created by pwalsweer on 10/3/12.
//  Copyright (c) 2012 pwalsweer. All rights reserved.
//

#import "IDFAAppDelegate.h"
#import "IDFAViewController.h"      // needed for VC reference
#include "TargetConditionals.h"     // needed for TARGET_IPHONE_SIMULATOR macro
#import "Flurry.h"                  // Flurry App Analytics


@implementation IDFAAppDelegate

@synthesize idfaViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Initialize Flurry connection, only when not in simulator
    #if !(TARGET_IPHONE_SIMULATOR)
        // to use Flurry, put your API key in a settings.plist in a key named FLURRY_API_KEY
        NSString *path = [[NSBundle mainBundle] pathForResource:@"settings" ofType:@"plist"];
        NSDictionary *settings = [[NSDictionary alloc] initWithContentsOfFile:path];
    
        [Flurry setDebugLogEnabled:YES];
        [Flurry startSession:[settings objectForKey:@"FLURRY_API_KEY"]];
    #endif
    return YES;
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [idfaViewController updateIDFAData];
}

@end
