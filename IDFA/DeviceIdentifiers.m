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
    if (self.supportsIDFA) {
        return [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    } else {
        return @"iOS 6.0+ needed";
    }
}

+(BOOL)IDFAPrivacyCheck {
    if (self.supportsIDFA) {
        return [[ASIdentifierManager sharedManager] isAdvertisingTrackingEnabled];
    } else {
        return NO;
    }
}

+(BOOL)supportsIDFA {
    NSString *OSVersion = [[UIDevice currentDevice] systemVersion];
    NSString *neededOSVersion = @"6.0";
    
    if ([OSVersion compare:neededOSVersion options:NSNumericSearch] != NSOrderedAscending) {
        return YES;
    } else {
        NSLog(@"iOS version too low, >= iOS 6.0 needed");
        return NO;
    }
}

@end
