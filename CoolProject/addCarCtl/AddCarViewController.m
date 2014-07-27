//
//  AddCarViewController.m
//  CoolProject
//
//  Created by wuzhensong on 14-6-14.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "AddCarViewController.h"
#import "HTTPClient+MangerClient.h"

static NSArray *typeArray = nil;
static NSArray *widthArray = nil;
//static NSArray *locationArray = nil;


#define IS_CH_SYMBOL(chr) ((int)(chr)>127)

@interface AddCarViewController ()
{
    WSPickerView *_typePicker;
    WSPickerView *_widthPicker;
//    WSPickerView *_locationPicker;
    
}

@end

@implementation AddCarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil addCarType:(AddCarType)type mangerModel:(MangerModel *)model
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.type = type;
        if (model) {
            self.model = model;
        }
        else {
            self.model = [MangerModel new];
        }
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //初始化
    typeArray = @[@"冷藏车",@"保温车"];
    widthArray = @[@"7.6米",@"8.6米",@"9.6米",@"12.5米",@"13.7米",@"15米",@"16.2米",@"16.5米"];
//    locationArray = @[@"手机定位",@"GPS定位"];
    [self createBarWithLeftBarItem:MoshNavigationBarItemBack rightBarItem:MoshNavigationBarItemNone title:@"车管理"];
    self.baseScrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - NAVHEIGHT);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardDidDisapper:) name:UIKeyboardDidHideNotification object:nil];
    
    
    //初始化（修改车信息）
    [self initView];
}

- (void) initView
{
    if (self.type == AddCar_update) {
        self.carNumber.text = self.model.carNumber;
        self.locationNumber.text = self.model.locationNumber;
        self.phoneNumber.text = self.model.phoneNumber;
        //        [self.carLocation setTitle:self.model.carLocation forState:UIControlStateNormal];
        
        NSInteger x = [self.model.carType integerValue];
        if (x > 0 && x < 3) {
            [self.carType setTitle:typeArray[x - 1] forState:UIControlStateNormal];
        }
        
        
        NSInteger i = [self.model.carWidth integerValue];
        if (i > 0 && i < 9) {
            [self.carWidth setTitle:widthArray[i - 1] forState:UIControlStateNormal];
        }
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)carTypeButtonClick:(id)sender {
    if (!_typePicker.superview) {
        _typePicker = [self createPickerViewWithDataArray:typeArray];
    }
    [self textFieldResignFirstResp];
}

- (IBAction)carWidthClick:(id)sender {
    if (!_widthPicker.superview) {
        _widthPicker = [self createPickerViewWithDataArray:widthArray];
    }
    [self textFieldResignFirstResp];
}

- (void) textFieldResignFirstResp
{
    [self.carNumber resignFirstResponder];
    [self.locationNumber resignFirstResponder];
    [self.phoneNumber resignFirstResponder];
}

//- (IBAction)carLocationClick:(id)sender {
//    if (!_locationPicker.superview) {
//        _locationPicker = [self createPickerViewWithDataArray:locationArray];
//    }
//}

- (IBAction)confirmClick:(id)sender {
    
    if (![self confirmCheck]) {
        return;
    }
    self.model.carNumber = self.carNumber.text;
    self.model.locationNumber = self.locationNumber.text;
    self.model.phoneNumber = self.phoneNumber.text;
    
    [self showLoadingView];
    
    BOOL add = (self.type == AddCar_add) ? YES:NO;
    
    [[HTTPClient shareHTTPClient] addNewCarWithMangerModel:self.model
                                                    addNew:add
                                                   success:^(NSDictionary *dic){
               [self hideLoadingView];
            
               if (self.type == AddCar_add && dic) {
                   [GlobalConfig showAlertViewWithMessage:@"添加车辆信息成功" superView:nil];
                   [NOTIFICATIONCENTER  postNotificationName:NOTI_CARINFOCHANGE object:nil userInfo:nil];
                   [self.navigationController popViewControllerAnimated:YES];
               }
               else if (self.type == AddCar_update && dic)
               {
                   [GlobalConfig showAlertViewWithMessage:@"修改车辆信息成功" superView:nil];
                  [NOTIFICATIONCENTER  postNotificationName:NOTI_CARINFOCHANGE object:nil userInfo:nil];
                  [self.navigationController popViewControllerAnimated:YES];
               }
               else {
//                   [GlobalConfig alert:@"操作失败，请重新请求"];
               }
    }];
}

//提交检查输入是否规范
- (BOOL) confirmCheck
{
    //车牌号
    if (![self isCarNumberValid:self.carNumber.text]) {
        return NO;
    }
    
    NSInteger x = [self.model.carType integerValue];
    if (x < 1 || x > 2) {
        [GlobalConfig alert:@"请选择车辆类型"];
        return NO;
    }

    
    //长度
    NSInteger i = [self.model.carWidth integerValue];
    if (i < 1 || i > 8) {
        [GlobalConfig alert:@"请选择车厢长度"];
        return NO;
    }
    
    //定位手机号
    if (![GlobalConfig isKindOfNSStringClassAndLenthGreaterThanZero:self.locationNumber.text Alert:@"请输入定位手机号"]) {
        return NO;
    }
    else {
        if (![GlobalConfig isValidateMobile:self.locationNumber.text]) {
            [GlobalConfig alert:@"定位手机号格式错误，请重新输入"];
            return NO;
        }
    }
    
    //手机号
    if (![GlobalConfig isKindOfNSStringClassAndLenthGreaterThanZero:self.phoneNumber.text Alert:@"请输入跟车手机号"]) {
        return NO;
    }
    else {
        if (![GlobalConfig isValidateMobile:self.phoneNumber.text]) {
            [GlobalConfig alert:@"随车手机号格式错误，请重新输入"];
            return NO;
        }
    }
    return YES;
}

//判断车牌号是否正确
- (BOOL) isCarNumberValid:(NSString *)number
{
    if (![GlobalConfig isKindOfNSStringClassAndLenthGreaterThanZero:number Alert:@"车牌号不能为空"]){
       return NO;
    }
    else {
        
        if ([GlobalConfig isValidateCarNo:number]) {
            return YES;
        }
        else {
            [GlobalConfig alert:@"车牌号不正确，请重新输入"];
            return NO;
        }
    }
}

- (WSPickerView *) createPickerViewWithDataArray:(NSArray *)array
{
    WSPickerView *view = [[WSPickerView alloc] initWithDataArray:array];
    view.backgroundColor = [UIColor grayColor];
    view.delegate = self;
    [self.view.window addSubview:view];
    return view;
}

#pragma  mark - pickerViewDelegate -

- (void) wsPickerSelectIndex:(NSInteger)index pickerView:(WSPickerView *)view
{
    if (view == _typePicker) {
        if (index < typeArray.count) {
            [self.carType setTitle:typeArray[index] forState:UIControlStateNormal];
            self.model.carType = [NSString stringWithFormat:@"%d",index + 1];
        }
    }else if (view == _widthPicker) {
        
        if (index < widthArray.count) {
            [self.carWidth setTitle:widthArray[index] forState:UIControlStateNormal];
            self.model.carWidth = [NSString stringWithFormat:@"%d",index + 1];
        }
    }
//    else if (view == _locationPicker) {
//        if (index < locationArray.count) {
//            [self.carLocation setTitle:locationArray[index] forState:UIControlStateNormal];
//        }
//    }
}

- (IBAction)serviceButtonClick:(id)sender
{
    [super serviceButtonClick:sender];
}

#pragma mark - UIKeyboardNotification -
- (void) keyBoardDidShow:(NSNotification *)noti
{
    [GlobalConfig keyBoardDidShow:noti scrollView:self.baseScrollView];
}

- (void) keyBoardDidDisapper:(NSNotification *)noti
{
    [GlobalConfig keyBoardDidDisapper:noti scrollView:self.baseScrollView];
}


@end
