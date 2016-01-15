//
//  ViewController.m
//  BubblesFrameworkDemo
//
//  Created by Pierre RACINE on 21/12/2015.
//  Copyright © 2015 Absolutlabs. All rights reserved.
//

#import "ViewController.h"
#import "BBImageNotificationViewController.h"
#import "BBWebViewNotificationViewController.h"

@interface ViewController () <BubblesDelegate>

@property (weak, nonatomic) IBOutlet UIButton *buttonAuthorizations;
- (IBAction)askAuthorization:(UIButton *)sender;

@end

@implementation ViewController

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [_buttonAuthorizations.layer setCornerRadius:4];
    
    [Bubbles setDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}



-(void)bubblesDidReceiveNotification:(NSDictionary *)infos
{

    if([self presentedViewController])
        return;
    
    if(infos && [[infos objectForKey:@"type"]isEqualToString:@"WVW"])
        [self performSegueWithIdentifier:@"BBWebViewSegue" sender:infos];
    else if (infos && [[infos objectForKey:@"type"]isEqualToString:@"IMG"])
        [self performSegueWithIdentifier:@"BBImageSegue" sender:infos];
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"BBWebViewSegue"])
    {
        BBWebViewNotificationViewController * BBWebview = [segue destinationViewController];
        [BBWebview setInfos:sender];
    }
    else if ([segue.identifier isEqualToString:@"BBImageSegue"])
    {
        BBImageNotificationViewController * BBImage = [segue destinationViewController];
        [BBImage setInfos:sender];
    }
}





- (IBAction)askAuthorization:(UIButton *)sender {
    [Bubbles requestLocalizationAndNotificationsAuthorization];
}


@end
