//
//  ProductViewController.h
//  CoolProject
//
//  Created by 魔时网 on 14-6-4.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "BaseTableViewController.h"
#import "ProductCell.h"
typedef enum{
    SegmentModel_product,
    SegmentModel_list,
} SegmentModel;

@interface ProductViewController : BaseTableViewController

@property (nonatomic, assign) SegmentModel sModel;

@end
