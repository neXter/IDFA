//
//  IDFAAppDelegate.h
//  IDFA
//
//  Created by pwalsweer on 10/3/12.
//  Copyright (c) 2012 pwalsweer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IDFAViewController.h"

@interface IDFAAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) IBOutlet IDFAViewController *idfaViewController;

@end
