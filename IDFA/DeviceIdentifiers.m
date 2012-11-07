//
//  DeviceIdentifiers.m
//  IDFA
//
//  Created by pwalsweer on 10/3/12.
//  Copyright (c) 2012 pwalsweer. All rights reserved.
//

#import "DeviceIdentifiers.h"
#import <AdSupport/ASIdentifierManager.h>

@implementation DeviceIdentifiers

+(NSString *)IDFA {
    NSString *OSVersion = [[UIDevice currentDevice] systemVersion];
    NSString *neededOSVersion = @"6.0";
    
    NSComparisonResult result = [neededOSVersion compare:OSVersion];
    
    if (result == NSOrderedAscending) {
        NSLog(@"iOS version too low, >= iOS 6.0 needed");
        return @"iOS 6.0+ needed";
    } else {
        return [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    }
}

+(BOOL)IDFAPrivacyCheck {
    NSString *OSVersion = [[UIDevice currentDevice] systemVersion];
    NSString *neededOSVersion = @"6.0";
    
    NSComparisonResult result = [neededOSVersion compare:OSVersion];

    // iOS >= 6.0 needed
    if (result == NSOrderedAscending) {
        return NO;
    } else {
        return [[ASIdentifierManager sharedManager] isAdvertisingTrackingEnabled];
    }
}


@end
