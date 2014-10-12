//
//  VidiyalHomeViewController.m
//  VidiyalFoundation
//
//  Created by iBeris Software Solutions Pvt. Ltd on 12/10/14.
//  Copyright (c) 2014 NGO. All rights reserved.
//

#import "VidiyalHomeViewController.h"
#import "NetworkHandler.h"

@interface VidiyalHomeViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *vidiyalWebview;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loader;

@end

@implementation VidiyalHomeViewController

+ (VidiyalHomeViewController *)viewController {
    
    VidiyalHomeViewController *vidiyalHome = [[VidiyalHomeViewController alloc] initWithNibName:@"VidiyalHomeViewController" bundle:[NSBundle mainBundle]];
    return vidiyalHome;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if ([NetworkHandler checkInternet]) {
     
        [self.vidiyalWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://vidiyalfoundation.org/"]]];
    } else {
        
        [self showAlert:@"Connection Problem!" withText:@"No Internet connecton!"];
    }
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    [_loader stopAnimating];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    
    [_loader stopAnimating];
    [self showAlert:@"" withText:@"Request Failed!"];
}

// Show alert.
- (void)showAlert:(NSString *)title withText:(NSString *)message {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
    alert.tag = 1;
    [alert show];
}

- (IBAction)Donate:(id)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.payumoney.com/webfronts/#/index/vidiyalfoundation"]];
}

- (IBAction)Mail:(id)sender {
    
    // From within your active view controller
    if([MFMailComposeViewController canSendMail]) {
        
        MFMailComposeViewController *mailCont = [[MFMailComposeViewController alloc] init];
        mailCont.mailComposeDelegate = self;
        
        [mailCont setSubject:@"Support from online!"];
        [mailCont setToRecipients:[NSArray arrayWithObject:@"vidiyal_trust@yahoo.com"]];
        
        [self presentViewController:mailCont animated:YES completion:nil];
    }
}

// Then implement the delegate method
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)Call:(id)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:9884190380"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
