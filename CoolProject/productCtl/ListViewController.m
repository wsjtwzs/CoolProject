//
//  ListViewController.m
//  CoolProject
//
//  Created by 魔时网 on 14-7-17.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "ListViewController.h"
#import "HTTPClient+ProductClient.h"
#import "ListCell.h"    

@interface ListViewController ()
{
    NSString *_carId;
}
@end

@implementation ListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id) initWithCarID:(NSString *)cid
{
    if (self = [super init]) {
        _carId = cid;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.cellHeight = 127.0f;
    [self createBarWithLeftBarItem:MoshNavigationBarItemBack rightBarItem:MoshNavigationBarItemNone title:@"货单"];
    [self downloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) downloadData
{
    [self showLoadingView];
    [[HTTPClient shareHTTPClient] getListWithCarID:_carId Success:^(NSMutableArray *array){
        [self hideLoadingView];
        if (array != nil) {
            if (array.count == 0) {
                [GlobalConfig showAlertViewWithMessage:@"暂时没有货单信息" superView:nil];
            }
            else {
                self.dataArray = array;
                [self.baseTableView reloadData];
            }
        }
    }];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = @"listCell2";
    ListCell2 *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([ListCell class]) owner:self options:nil] objectAtIndex:1];
        cell.backgroundColor = CLEARCOLOR;
        cell.contentView.backgroundColor = CLEARCOLOR;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell setValueWithModel:self.dataArray[indexPath.row]];
    return cell;
}


@end
