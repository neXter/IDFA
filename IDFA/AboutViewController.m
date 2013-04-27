//
//  AboutViewController.m
//  IDFA
//
//  Created by pwalsweer on 10/3/12.
//  Copyright (c) 2012 pwalsweer. All rights reserved.
//

#import "AboutViewController.h"

@implementation AboutViewController

@synthesize aboutText;

- (void)viewDidLoad
{
    [super viewDidLoad];

    [aboutText loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                                                pathForResource:@"about"
                                                                                ofType:@"html"] isDirectory:NO]]];
}

@end
