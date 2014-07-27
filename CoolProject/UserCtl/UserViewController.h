//
//  UserViewController.h
//  CoolProject
//
//  Created by wuzhensong on 14-6-6.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "BaseViewController.h"

@interface UserViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UIScrollView *baseScrollView;
@property (weak, nonatomic) IBOutlet UILabel *userName;
- (IBAction)NotiSwitchValueChange:(id)sender;
- (IBAction)loginSwitchValueChange:(id)sender;
- (IBAction)callButtonClick:(id)sender;

@end
