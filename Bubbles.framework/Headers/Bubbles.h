//
//  Bubbles.h
//  bubblesFramework
//
//  Created by Pierre RACINE on 08/10/2015.
//  Copyright © 2015 AbsolutLabs. All rights reserved.
//  @version 1.0


#import <UIKit/UIKit.h>

@protocol BubblesDelegate <NSObject>

@required

- (void) bubblesDidReceiveNotification : (NSDictionary *) infos;

@end



@interface Bubbles : NSObject





+ (void)setDelegate:(id<BubblesDelegate>)delegate;




+ (void) initWithAPIKey : (NSString *) APIKey andLocalNotification :(UILocalNotification *) localNotication andIsProd :(BOOL) isProd;

/*!
 *  This mandatory method is the entry point to the Bubbles Beacon. It must be
 *  called in the scope of applicationDidFinishLaunching, in the launchOptions param.
 *
 * @code
 - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
 
 [Bubbles initWithAPIKey:@"YOUR_API_KEY_HERE" andLocalNotification:[launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey]];
 
 //...
 return YES;
 }
 * @endcode
 *
 *  @note This method must be called in AppDelegate
 */






+ (void) didReceiveLocalNotification : (NSDictionary *) userInfo;

/*!
 *
 *  This mandatory method is called when your app receives a local notification.
 *
 * @code
 -(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
 {
 [Bubbles didReceiveLocalNotification:notification];
 //...
 }
 * @endcode
 *
 *  @note This method must be called in AppDelegate
 *
 * @param "notification" forwards the received local notification from the AppDelegate's function didReceiveLocalNotification:(UILocalNotification *)notification
 */



+ (void) requestLocalizationAndNotificationsAuthorization;



+ (void) setUserId : (NSString *) userId;

/*!
 *  @brief
 *
 *  This is an optional method that send User ID.
 *
 *  @param NSString userId
 */


+ (void) setModeCustomView : (BOOL)  modeCustomView;


/*!
 *  @brief
 *
 *  This is an optional method that displays debug information related to the Bubbles SDK.
 *  It displays information in the console. The default setting is FALSE.
 *
 *
 *  @param BOOL modeCustomView
 *
 */


+ (void)setDebugLogEnabled:(BOOL)enable;

/*!
 *  @brief Generates debug logs to console.
 *
 *  This is an optional method that displays debug information related to the Bubbles SDK.
 *  It displays information in the console. The default setting is FALSE.
 *
 *
 *  @param BOOL enable
 *
 */


+ (void) setColorBackground : (UIColor *) color;
/*!
 *  This is an optional method that sets the color of the view.
 *
 *  @note This method must be called in AppDelegate
 *
 *  @param color (default color - Black)
 */


+ (void) setStatusBarStyle : (UIStatusBarStyle) statusBarStyle;

/*!
 *  This is an optional method that sets the status bar color within the view.
 *
 *  @note This method must be called in AppDelegate
 *
 *  @param UIStatusBarStyle
 */


+ (void) setCloseButtonImage : (UIImage *) image;
/*!
 *  This is an optional method that sets the image of close button.
 *
 *  @note This method must be called in AppDelegate
 *
 *  @param image size max 40x40px@2x
 */


@end