//
//  IDFAViewController.h
//  IDFA
//
//  Created by pwalsweer on 10/3/12.
//  Copyright (c) 2012 pwalsweer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface IDFAViewController : UITableViewController <MFMailComposeViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UITableViewCell *IDFACell;
@property (strong, nonatomic) IBOutlet UITableViewCell *IDFAPrivacyCheckCell;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *sendMailButton;
@property (strong, nonatomic) IBOutlet UIWebView *infoText;

- (IBAction)sendMail:(id)sender;

- (void)updateIDFAData;

@end
