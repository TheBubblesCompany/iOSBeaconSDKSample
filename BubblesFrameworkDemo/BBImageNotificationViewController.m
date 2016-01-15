//
//  BBImageNotificationViewController.m
//  BubblesFrameworkDemo
//
//  Created by Pierre RACINE on 21/12/2015.
//  Copyright © 2015 Absolutlabs. All rights reserved.
//

#import "BBImageNotificationViewController.h"

@interface BBImageNotificationViewController ()

- (IBAction)close:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UIButton *buttonShowMore;
- (IBAction)showMore:(UIButton *)sender;

@end

@implementation BBImageNotificationViewController

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [_buttonShowMore.layer setCornerRadius:4];
    
    [self displayImage];
}





-(void) displayImage
{
    if(!_infos)
        return;
    
    if([[_infos allKeys]containsObject:@"image"] && [[[_infos objectForKey:@"image"]allKeys]containsObject:@"url"])
    {
        NSString * imageURL = [[_infos objectForKey:@"image"]objectForKey:@"url"];
        if(imageURL)
        {
            dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
            dispatch_async(queue, ^(void) {
                
                NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageURL]];
                if (imageData) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [_imageView setImage:[UIImage imageWithData:imageData]];
                    });
                }
            });
        }
        
    }
}





#pragma mark - Actions





- (IBAction)close:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)showMore:(UIButton *)sender {
    
    if (_infos) {
        
        NSDictionary * dico = [_infos objectForKey:@"image"];
        
        if([[dico allKeys]containsObject:@"action"] && [[dico objectForKey:@"action"]isKindOfClass:[NSDictionary class]])
        {
            if([[[dico objectForKey:@"action"]objectForKey:@"type"]isEqualToString:@"WVW"])
            {
                NSString * url = [[dico objectForKey:@"action"]objectForKey:@"url"];
                [[UIApplication sharedApplication]openURL:[NSURL URLWithString:url]];
            }
            else if ([[[dico objectForKey:@"action"]objectForKey:@"type"]isEqualToString:@"URI"])
            {
                NSDictionary * dictionaryURI = [[dico objectForKey:@"action"]objectForKey:@"uri"];
                NSURL * urlURIDefault = nil;
                NSURL * urlURIFallback = nil;
                
                if([[dictionaryURI allKeys]containsObject:@"default"] && [[dictionaryURI objectForKey:@"default"]isKindOfClass:[NSString class]])
                    urlURIDefault = [NSURL URLWithString:[dictionaryURI objectForKey:@"default"]];
                
                if([[dictionaryURI allKeys]containsObject:@"fallback"] && [[dictionaryURI objectForKey:@"fallback"]isKindOfClass:[NSString class]])
                    urlURIFallback = [NSURL URLWithString:[dictionaryURI objectForKey:@"fallback"]];
                
                if(![[UIApplication sharedApplication]openURL:urlURIDefault])
                    [[UIApplication sharedApplication]openURL:urlURIFallback];
                
            }
        }
        
    }
}



@end
