//
//  AppDelegate.m
//  CoolProject
//
//  Created by 魔时网 on 14-6-3.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "AppDelegate.h"
#import "Controllers.h"
#import "BaseNavigationController.h"
#import "GlobalConfig.h"
//#import <Frontia/FrontiaPush.h>
//#import <Frontia/Frontia.h>

#import "BPush.h"

static NSString *firstLaunch = @"firstLaunch";

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    //百度地图
    _mapManager = [[BMKMapManager alloc]init];
    // 如果要关注网络及授权验证事件，请设定     generalDelegate参数
    BOOL ret = [_mapManager start:APPID_BAIDUMAP  generalDelegate:nil];
    if (!ret) {
        NSLog(@"manager start failed!");
    }

    
//    [BPush setupChannel:launchOptions];
//    [BPush setDelegate:self];
//
//    [application setApplicationIconBadgeNumber:0];
//    [application registerForRemoteNotificationTypes:
//     UIRemoteNotificationTypeAlert
//     | UIRemoteNotificationTypeBadge
//     | UIRemoteNotificationTypeSound];
    
    if (![USERDEFAULT objectForKey:firstLaunch]) {
        [GlobalConfig saveUserDefaultWithDictionary:@{USERDEFAULT_AUTOLOGIN:@YES,USERDEFAULT_RECEIVENOTI:@YES,firstLaunch:@YES}];
    }
    
    
    self.window.rootViewController = [Controllers firstViewController];
//    self.window.rootViewController = [Controllers mainTabbarController];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
    
    
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    NSLog(@"frontia application:%@", deviceToken);
    [BPush registerDeviceToken:deviceToken];
    [BPush bindChannel];
    
}


- (void) onMethod:(NSString*)method response:(NSDictionary*)data {
    NSLog(@"On method:%@", method);
    NSLog(@"data:%@", [data description]);
    NSDictionary* res = [[NSDictionary alloc] initWithDictionary:data];
    if ([BPushRequestMethod_Bind isEqualToString:method]) {
        NSString *appid = [res valueForKey:BPushRequestAppIdKey];
        NSString *userid = [res valueForKey:BPushRequestUserIdKey];
        NSString *channelid = [res valueForKey:BPushRequestChannelIdKey];
        NSString *requestid = [res valueForKey:BPushRequestRequestIdKey];
        int returnCode = [[res valueForKey:BPushRequestErrorCodeKey] intValue];
        NSLog(@"appid:%@/userid:%@/nchannelid:%@requestid:%@returncode:%d",appid,userid,channelid,requestid,returnCode);
    }
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {

    [application setApplicationIconBadgeNumber:0];
    
    [BPush handleNotification:userInfo];
}


- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSLog(@"frontia application:%@", error);
}



- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end