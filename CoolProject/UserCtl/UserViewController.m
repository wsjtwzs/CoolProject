//
//  UserViewController.m
//  CoolProject
//
//  Created by wuzhensong on 14-6-6.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "UserViewController.h"
#import "AppDelegate.h"
@interface UserViewController ()

@end

@implementation UserViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
  
- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.baseScrollView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT - NAVHEIGHT - TABBARHEIGHT);
    self.baseScrollView.contentSize = CGSizeMake(SCREENWIDTH, 568);
    [self createBarWithLeftBarItem:MoshNavigationBarItemNone rightBarItem:MoshNavigationBarItemNone title:@"账号"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"退出" style:UIBarButtonItemStylePlain target:self action:@selector(navUserExitClick)];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{UITextAttributeTextColor:BLUECOLOR} forState:UIControlStateNormal];
    [self.navigationItem hidesBackButton];
    self.userName.text = [GlobalConfig getObjectWithKey:USER_USERNAME];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) navUserExitClick
{
//    [GlobalConfig deleteUserInfo];
////    [self.tabBarController pushViewController:[Controllers loginViewController] animated:YES];
//    [self.tabBarController presentViewController:[Controllers loginViewController] animated:YES completion:^{}];
    [GlobalConfig deleteUserInfo];
    AppDelegate *delegae = [UIApplication sharedApplication].delegate;
    [delegae.window setRootViewController:[Controllers firstViewController]];
}

- (IBAction)NotiSwitchValueChange:(id)sender {
    UISwitch *sw = (UISwitch *)sender;
    if (!sw.isOn) {
        //关
        [[NSUserDefaults standardUserDefaults] setObject:@NO forKey:USERDEFAULT_RECEIVENOTI];
    }
    else {
        //开
        [[NSUserDefaults standardUserDefaults] setObject:@YES forKey:USERDEFAULT_RECEIVENOTI];
    }
}

- (IBAction)loginSwitchValueChange:(id)sender {
    UISwitch *sw = (UISwitch *)sender;
    if (!sw.isOn) {
        //关
        [[NSUserDefaults standardUserDefaults] setObject:@NO forKey:USERDEFAULT_AUTOLOGIN];
    }
    else {
        //开
        [[NSUserDefaults standardUserDefaults] setObject:@YES forKey:USERDEFAULT_AUTOLOGIN];
    }
}

- (IBAction)callButtonClick:(id)sender {
    [super serviceButtonClick:sender];
}
@end
