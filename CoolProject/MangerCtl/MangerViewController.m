//
//  MangerViewController.m
//  CoolProject
//
//  Created by wuzhensong on 14-6-10.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "MangerViewController.h"
#import "HTTPClient+MangerClient.h"
#import "MangerCell.h"
#import "MangerModel.h"

@interface MangerViewController ()

@end

@implementation MangerViewController

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
    
    self.cellHeight = 190.0f;
    [self createBarWithLeftBarItem:MoshNavigationBarItemNone rightBarItem:MoshNavigationBarItemAdd title:@"车管理"];
    self.navigationItem.leftBarButtonItem = [BaseViewController createNavigationBarItemWithNormalImageName:@"nav_bg" highlightImageName:@"nav_bg" title:@"地图" isLeft:YES action:@selector(navMapButtonClick) target:self];
    [self addEGORefreshOnTableView:self.baseTableView];
    [self downloadData];
    
    
    [NOTIFICATIONCENTER addObserver:self selector:@selector(carInfoChanged) name:NOTI_CARINFOCHANGE object:nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) carInfoChanged
{
    [self downloadData];
}

#pragma mark - selfAction -
- (void) downloadData
{
    [self showLoadingView];
    [[HTTPClient shareHTTPClient] getMangerListSuccess:^(NSMutableArray *array){
        
        if (array) {
            self.dataArray = array;
            [self.baseTableView reloadData];
            if (array.count == 0) {
                [GlobalConfig showAlertViewWithMessage:@"还没有车辆信息，赶紧去添加吧" superView:nil];
            }
        }
        
        [self hideLoadingView];

    }];
}

- (void) navMapButtonClick
{
    [self.navigationController pushViewController:[Controllers MapViewController] animated:YES];
}

- (void) navAddClick
{
    [self.navigationController pushViewController:[Controllers addCarViewControllerWithModel:nil] animated:YES];
}

- (void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NOTI_CARINFOCHANGE object:nil];
}

#pragma mark - tableViewDelegate -

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"mangerCell";
    MangerCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([MangerCell class]) owner:self options:nil] objectAtIndex:0];
        cell.delegate = self;
    }
    MangerModel *model = self.dataArray[indexPath.row];
    [cell setValueForCell:model];
    
    return cell;
}

#pragma  mark - MnagerCellDelegate
- (void) carInfoUpdate:(MangerCell *)cell
{
    NSIndexPath *indexPath = [self.baseTableView indexPathForCell:cell];
    MangerModel *model = self.dataArray[indexPath.row];
    [self.navigationController pushViewController:[Controllers addCarViewControllerWithModel:model] animated:YES];
}


- (void) carLocation:(MangerCell *)cell
{
    NSIndexPath *indexPath = [self.baseTableView indexPathForCell:cell];
    MangerModel *model = self.dataArray[indexPath.row];
    [self.navigationController pushViewController:[Controllers PathViewControllerWithCid:model.carID] animated:YES];
}
@end
