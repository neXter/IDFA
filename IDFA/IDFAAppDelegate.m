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

@implementation IDFAAppDelegate

@synthesize idfaViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    return YES;
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [idfaViewController updateIDFAData];
}

@end
