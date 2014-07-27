//
//  AllListViewController.m
//  CoolProject
//
//  Created by 魔时网 on 14-7-17.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "AllListViewController.h"
#import "ListCell.h"
#import "HTTPClient+ProductClient.h"  


@interface AllListViewController ()

@end

@implementation AllListViewController

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
    self.cellHeight = 157.0f;
    [self addEGORefreshOnTableView:self.baseTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) downloadData
{
    [self showLoadingView];;

    [[HTTPClient shareHTTPClient] getAllListSuccess:^(NSMutableArray *array) {
            [self hideLoadingView];
            if (array != nil) {
                if (array.count == 0) {
                    [GlobalConfig showAlertViewWithMessage:@"暂时没有货单信息" superView:self.view];
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
    NSString *cellID = @"listCell";
    ListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([ListCell class]) owner:self options:nil] objectAtIndex:0];
        cell.backgroundColor = CLEARCOLOR;
        cell.contentView.backgroundColor = CLEARCOLOR;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell setValueWithModel:self.dataArray[indexPath.row]];
    return cell;
}


@end
