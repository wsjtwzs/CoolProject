//
//  LocationViewController.h
//  CoolProject
//
//  Created by wuzhensong on 14-6-12.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "BaseViewController.h"
#import "WSPickerView.h"

@interface LocationViewController : BaseViewController<WSPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *selectButton;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;
- (IBAction)selectButtonClick:(id)sender;
- (IBAction)serviceButtonClick:(id)sender;

@end
