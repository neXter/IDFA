//
//  IDFAViewController.m
//  IDFA
//
//  Created by pwalsweer on 10/3/12.
//  Copyright (c) 2012 pwalsweer. All rights reserved.
//

#import "IDFAViewController.h"
#import "DeviceIdentifiers.h"
#import "IDFAAppDelegate.h"

@implementation IDFAViewController

@synthesize IDFACell, IDFAPrivacyCheckCell, sendMailButton, infoText;

- (void)updateIDFAData {
    [[IDFACell textLabel] setText:[DeviceIdentifiers IDFA]];

    if ([DeviceIdentifiers IDFAPrivacyCheck] == YES) {
        [[IDFAPrivacyCheckCell detailTextLabel] setText:@"no"];
    } else if ([DeviceIdentifiers IDFAPrivacyCheck] == NO) {
        [[IDFAPrivacyCheckCell detailTextLabel] setText:@"yes"];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // setting self as the IDFAAppDelegate property in AppDelegate to be able
    // to invoke updateIDFAData from applicationWillEnterForeground to be able
    // to update IDFAPrivacyCheck info on return to app after potentially
    // changing system preferences
    IDFAAppDelegate *appDelegate = (IDFAAppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate setIdfaViewController:self];

    // customize the back button text for the about page
    [[self navigationItem] setBackBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStyleBordered target:nil action:nil]];

    // setting WebView background to be completely transparent and load content
    [infoText setOpaque:NO];
    [infoText setBackgroundColor:[UIColor clearColor]];
    [infoText loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                                                pathForResource:@"info"
                                                                                ofType:@"html"] isDirectory:NO]]];

    [[IDFACell textLabel] setAdjustsFontSizeToFitWidth:YES];
    [[IDFACell textLabel] setMinimumScaleFactor:0.6];

    [self updateIDFAData];
}

#pragma mark Mail IDFA Feature

- (IBAction)sendMail:(id)sender {
    MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
    mailer.mailComposeDelegate = self;
    [mailer setSubject:@"Advertising Identifier (IDFA)"];
    NSString *emailBody = @"<p><u>Advertiser Identifier (IDFA):</u><br/>";
    emailBody = [emailBody stringByAppendingString:[DeviceIdentifiers IDFA]];
    emailBody = [emailBody stringByAppendingString:@"</p><p><u>Limited Ad Tracking:</u><br/>"];
    emailBody = [emailBody stringByAppendingString:[[IDFAPrivacyCheckCell detailTextLabel] text]];
    emailBody = [emailBody stringByAppendingString:@"</p><p><u>System Version:</u><br/>"];
    emailBody = [emailBody stringByAppendingString:[[UIDevice currentDevice] systemVersion]];
    emailBody = [emailBody stringByAppendingString:@"</p>"];
    
    [mailer setMessageBody:emailBody isHTML:YES];
    [self presentViewController:mailer animated:YES completion:nil];
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark UITableViewController

-(void)tableView:(UITableView*)tableView performAction:(SEL)action forRowAtIndexPath:(NSIndexPath*)indexPath withSender:(id)sender
{
    UIPasteboard *generalPasteboard = [UIPasteboard generalPasteboard];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [generalPasteboard setString:cell.textLabel.text];
}

-(BOOL)tableView:(UITableView*)tableView canPerformAction:(SEL)action forRowAtIndexPath:(NSIndexPath*)indexPath withSender:(id)sender
{
    if (action == @selector(copy:))
        return YES;
	else
        return [super canPerformAction:action withSender:sender];
}

-(BOOL)tableView:(UITableView*)tableView shouldShowMenuForRowAtIndexPath:(NSIndexPath*)indexPath{
    return YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
