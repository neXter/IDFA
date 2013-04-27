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
    if(NSClassFromString(@"ASIdentifierManager")) {
        return YES;
    } else {
        return NO;
    }
}

@end
