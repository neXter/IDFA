//
//  DeviceIdentifiers.h
//  IDFA
//
//  Created by pwalsweer on 10/3/12.
//  Copyright (c) 2012 pwalsweer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeviceIdentifiers : NSObject

+(NSString *)IDFA ;
+(BOOL)IDFAPrivacyCheck;

@end
