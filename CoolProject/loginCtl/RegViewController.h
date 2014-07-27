//
//  RegViewController.h
//  CoolProject
//
//  Created by wuzhensong on 14-6-7.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "BaseViewController.h"

@interface RegViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *confimPassword;

//确定
- (IBAction)submitButtonClick:(id)sender;

//客服电话
- (IBAction)serviceButtonClick:(id)sender;


@end
