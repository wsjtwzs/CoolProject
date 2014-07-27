//
//  ProductCell.h
//  CoolProject
//
//  Created by 魔时网 on 14-6-4.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductModel.h"

@protocol ProductCellDelegate;

@interface ProductCell : UITableViewCell

@property (assign, nonatomic) id<ProductCellDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UILabel *carNumber;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *height;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *phone;
@property (weak, nonatomic) IBOutlet UILabel *listNumber;

@property (weak, nonatomic) IBOutlet UIButton *locationButton;
@property (weak, nonatomic) IBOutlet UIButton *transferButton;
- (IBAction)locationClick:(id)sender;
- (IBAction)transferClick:(id)sender;
- (IBAction)listClick:(id)sender;

//赋值
- (void) setValueWithProductModel:(ProductModel *)model;
@end


@protocol ProductCellDelegate <NSObject>

- (void) locationSelected:(ProductCell *)cell;
- (void) transferSelected:(ProductCell *)cell;
- (void) listSelected:(ProductCell *)cell;

@end