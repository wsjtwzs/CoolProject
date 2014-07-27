//
//  LocationViewController.m
//  CoolProject
//
//  Created by wuzhensong on 14-6-12.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "TransferViewController.h"
#import "HTTPClient+Transfer.h"

@interface TransferViewController ()
{
    CityPickerView *_cityPicker;
    WSDatePickerView *_datePicker;
    NSString *_carID;
}
@end

@implementation TransferViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil carId:(NSString *)cid
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _carID = cid;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createBarWithLeftBarItem:MoshNavigationBarItemBack rightBarItem:MoshNavigationBarItemNone title:@"调度"];
    self.navigationItem.rightBarButtonItem = [BaseViewController createNavigationBarItemWithNormalImageName:@"nav_bg" highlightImageName:@"nav_bg" title:@"提交" isLeft:NO action:@selector(confirmButtonClick:) target:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) confirmButtonClick:(id)sender
{
    if (![self.addressButton.titleLabel.text isEqualToString:@"点击选择调用点"]) {
        
        [self showLoadingView];
        [[HTTPClient shareHTTPClient] transferWithCarID:_carID info:self.addressButton.titleLabel.text success:^(id jsonData){
            [self hideLoadingView];
            //json格式正确
            if ([GlobalConfig isKindOfNSDictionaryClassAndCountGreaterThanZero:jsonData]) {
                
                //成功
                NSNumber *number = [GlobalConfig convertToNumber:jsonData[JSONKEY_SUCCESS]];
                if ([number boolValue] == YES) {
                    [GlobalConfig showAlertViewWithMessage:@"保存成功" superView:nil];
                     [self.navigationController popViewControllerAnimated:YES];
                }
                else {
                   [GlobalConfig showAlertViewWithMessage:@"保存失败，请重新保存" superView:nil];
                }
            }
            else {
                [GlobalConfig showAlertViewWithMessage:ERROR_LOADFAIL superView:nil];
            }

        }];
       
    }
}

- (IBAction)dateClick:(id)sender {
    if (!_datePicker.superview) {
        _datePicker = [[WSDatePickerView alloc] initWithdataPickerMode:UIDatePickerModeDate];
        _datePicker.backgroundColor = [UIColor grayColor];
        _datePicker.delegate = self;
        [self.view.window addSubview:_datePicker];
    }

}

- (IBAction)addressClick:(id)sender {
    if (!_cityPicker.superview) {
        _cityPicker = [[CityPickerView alloc] initWithFrame:CGRectZero];
        _cityPicker.backgroundColor = [UIColor grayColor];
        _cityPicker.delegate = self;
        [self.view.window addSubview:_cityPicker];
    }
}

- (IBAction)serviceButtonClick:(id)sender
{
    [super serviceButtonClick:sender];
}

#pragma mark - cityPickerViewDelegate -

- (void) doneWithSelectCity:(NSString *)cityName
{
    [self.addressButton setTitle:cityName forState:UIControlStateNormal];
}
#pragma mark - WSDatePickeViewDelegate -
- (void) wsdatePickerSelectDate:(NSDate *)date mode:(UIDatePickerMode)mode
{
        [self.dateButton setTitle:[GlobalConfig date:date format:DATEFORMAT_08] forState:UIControlStateNormal];
}

@end
