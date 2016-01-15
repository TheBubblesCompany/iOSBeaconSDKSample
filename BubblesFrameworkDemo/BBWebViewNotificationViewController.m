//
//  BBWebViewNotificationViewController.m
//  BubblesFrameworkDemo
//
//  Created by Pierre RACINE on 21/12/2015.
//  Copyright © 2015 Absolutlabs. All rights reserved.
//

#import "BBWebViewNotificationViewController.h"

@interface BBWebViewNotificationViewController ()

- (IBAction)close:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end


@implementation BBWebViewNotificationViewController


-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self displayWebView];
}


-(void) displayWebView
{
    if(!_infos)
        return;
    
    NSString * webViewURL = [_infos objectForKey:@"url"];

    if(webViewURL)
        [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:webViewURL]]];
}



#pragma mark - Actions



- (IBAction)close:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}






@end
