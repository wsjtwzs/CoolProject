//
//  CarListViewController.m
//  CoolProject
//
//  Created by 魔时网 on 14-7-17.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "CarListViewController.h"
#import "HTTPClient+ProductClient.h"


@interface CarListViewController ()

@end

@implementation CarListViewController

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
    [[HTTPClient shareHTTPClient] getCarListSuccess:^(NSMutableArray *array){
        
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


- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"productCell";
    ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([ProductCell class]) owner:self options:nil] objectAtIndex:0];
        cell.delegate = self;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell setValueWithProductModel:self.dataArray[indexPath.row]];
    return cell;
}

#pragma mark - productCellDelegate -

- (void) listSelected:(ProductCell *)cell
{
    NSIndexPath *indexPath = [self.baseTableView indexPathForCell:cell];
    if (indexPath) {
        ProductModel *model = self.dataArray[indexPath.row];
        [self.navigationController pushViewController:[Controllers ListViewControllerWithCid:model.carID] animated:YES];
    }
}

- (void) transferSelected:(ProductCell *)cell
{
    NSIndexPath *indexPath = [self.baseTableView indexPathForCell:cell];
    if (indexPath) {
        ProductModel *model = self.dataArray[indexPath.row];
        [self.navigationController pushViewController:[Controllers transferViewControllerWithCarID:model.carID] animated:YES];
    }
}

- (void) locationSelected:(ProductCell *)cell
{
    [self.navigationController pushViewController:[Controllers locationViewController] animated:YES];
}


@end
