//
//  LoginViewController.m
//  CoolProject
//
//  Created by wuzhensong on 14-6-7.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "LoginViewController.h"
//#import "Controllers.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)regButtonClick:(id)sender {
    [self.navigationController pushViewController:[Controllers regViewController] animated:YES];
}

- (IBAction)loginButtonClick:(id)sender {
    [self.navigationController pushViewController:[Controllers userLoginViewController] animated:YES];
}
@end
