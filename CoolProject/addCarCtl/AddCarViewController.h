//
//  AddCarViewController.h
//  CoolProject
//
//  Created by wuzhensong on 14-6-14.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "BaseViewController.h"
#import "WSPickerView.h"    
#import "MangerModel.h"

typedef enum{
    AddCar_add,
    AddCar_update,
}AddCarType;

@interface AddCarViewController : BaseViewController<WSPickerViewDelegate>

@property (strong, nonatomic) MangerModel *model;
@property (assign, nonatomic) AddCarType type;
@property (weak, nonatomic) IBOutlet UIScrollView *baseScrollView;
@property (weak, nonatomic) IBOutlet UITextField *carNumber;
@property (weak, nonatomic) IBOutlet UIButton *carType;
@property (weak, nonatomic) IBOutlet UIButton *carWidth;
//@property (weak, nonatomic) IBOutlet UIButton *carLocation;
@property (weak, nonatomic) IBOutlet UITextField *locationNumber;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;


- (IBAction)carTypeButtonClick:(id)sender;
- (IBAction)carWidthClick:(id)sender;
//- (IBAction)carLocationClick:(id)sender;
- (IBAction)confirmClick:(id)sender;

//客服电话
- (IBAction)serviceButtonClick:(id)sender;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil addCarType:(AddCarType)type mangerModel:(MangerModel *)model;
@end
