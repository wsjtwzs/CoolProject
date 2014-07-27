//
//  ProductViewController.m
//  CoolProject
//
//  Created by 魔时网 on 14-6-4.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "ProductViewController.h"
#import "ProductCell.h"
#import "HTTPClient+ProductClient.h"
#import "ListCell.h"
#import "CarListViewController.h"
#import "AllListViewController.h"

static NSInteger firstAppear = 0;

@interface ProductViewController ()
{
    UIView *_titleView;
//    UITableView *_listView;
//    NSArray *_listArray;

    UIViewController *_carListCtl;//车辆
    UIViewController *_allListCtl;//货单
}
@end

@implementation ProductViewController

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
    self.sModel = SegmentModel_product;
    self.navigationItem.titleView = [self createTitleView];
    [self createSubViewController];
    [self showCarListView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - createView -
- (UIView *) createTitleView
{
    _titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 120.5, 35.5)];
    _titleView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"seg_1"]];
    NSArray *array = @[@[@"配货",@"seg_1"],
                       @[@"货单",@"seg_2"]];
    for (int i = 0 ;i < array.count; i++) {
        UIButton *button = [GlobalConfig createButtonWithFrame:CGRectMake(i * CGRectGetWidth(_titleView.frame)/2,0 ,CGRectGetWidth(_titleView.frame)/2, CGRectGetHeight(_titleView.frame)) ImageName:nil Title:[array[i] firstObject] Target:self Action:@selector(segmentValueChange:)];
        [button setTitleColor:BLACKCOLOR forState:UIControlStateNormal];
        button.tag = i;
        [_titleView addSubview:button];
    }
    
    return _titleView;
}

- (void) createSubViewController
{
    _carListCtl = [CarListViewController new];
    [self addChildViewController:_carListCtl];
    [self.view addSubview:_carListCtl.view];
    
    _allListCtl = [AllListViewController new];
    [self addChildViewController:_allListCtl];
    [self.view addSubview:_allListCtl.view];
}

#pragma mark - selfAction


- (void) segmentValueChange:(id)sender
{
    UIButton *button = (UIButton *)sender;
    switch (button.tag) {
        case 0:
            _titleView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"seg_1"]];
            self.sModel = SegmentModel_product;
            [self showCarListView];
            break;
            case 1:
            _titleView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"seg_2"]];
            self.sModel = SegmentModel_list;
            [self showAllListView];
            //类似tababr 只第一次显示的时候加载数据
            if (firstAppear == 0) {
                AllListViewController *ctl = (AllListViewController *)_allListCtl;
                if ([_allListCtl respondsToSelector:@selector(downloadData)]) {
                    [ctl downloadData];
                }
                firstAppear++;
            }

        default:
            break;
    }
}

- (void) showCarListView
{
    _carListCtl.view.hidden = NO;
    _allListCtl.view.hidden = YES;
    
}
- (void) showAllListView
{
    _carListCtl.view.hidden = YES;
    _allListCtl.view.hidden = NO;
    
}

@end
