//
//  LocationViewController.m
//  CoolProject
//
//  Created by wuzhensong on 14-6-12.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "LocationViewController.h"
#import "WSPickerView.h"

static NSArray *locationType = nil;

@interface LocationViewController ()
{
    WSPickerView *_pickerView;
}
@end

@implementation LocationViewController

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
    locationType =   @[@"手机定位",@"GPS定位"];
    [self createBarWithLeftBarItem:MoshNavigationBarItemBack rightBarItem:MoshNavigationBarItemNone title:@"定位"];
    self.navigationItem.rightBarButtonItem = [BaseViewController createNavigationBarItemWithNormalImageName:@"nav_bg" highlightImageName:@"nav_bg" title:@"提交" isLeft:NO action:@selector(confirmButtonClick:) target:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) confirmButtonClick:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)selectButtonClick:(id)sender {
    
    if (!_pickerView.superview) {
        WSPickerView *view = [[WSPickerView alloc] initWithDataArray:locationType];
        view.backgroundColor = [UIColor grayColor];
        view.delegate = self;
        [self.view.window addSubview:view];
    }
}

- (void) wsPickerSelectIndex:(NSInteger)index pickerView:(WSPickerView *)view
{
    if (index < locationType.count) {
        [self.selectButton setTitle:locationType[index] forState:UIControlStateNormal];
    }
}

- (IBAction)serviceButtonClick:(id)sender
{
    [super serviceButtonClick:sender];
}


@end
