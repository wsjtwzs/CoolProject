//
//  ListCell.m
//  CoolProject
//
//  Created by wuzhensong on 14-6-26.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "ListCell.h"
#import "GlobalConfig.h"

@implementation ListCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//赋值
- (void) setValueWithModel:(ListModel *)model
{
    self.model = model;
    self.carNumbr.text = model.carNumber;
    self.path.text = model.path;
    self.product.text = model.product;
    self.date.text = model.date;
    self.linkMan.text = [NSString stringWithFormat:@"联系人:%@",model.linkMan];
    self.linkNUmber.text = model.linkNumber;
    
    self.backImage.image = model.cool ? [UIImage imageNamed:@"cell_bg_03"] : [UIImage imageNamed:@"cell_bg_04"];
    
}

- (IBAction)callLinkMan:(id)sender {
    if ([GlobalConfig isValidateMobile:self.model.linkNumber]) {
        [GlobalConfig makeCall:self.model.linkNumber];
    }
}
@end


@implementation ListCell2

- (void)awakeFromNib
{
    // Initialization code
}

//赋值
- (void) setValueWithModel:(ListModel *)model
{
    self.model = model;
    self.path.text = model.path;
    self.product.text = model.product;
    self.date.text = model.date;
    self.linkMan.text = [NSString stringWithFormat:@"联系人:%@",model.linkMan];
    self.linkNUmber.text = model.linkNumber;
    
    self.backImage.image = model.cool ? [UIImage imageNamed:@"cell_bg_05"] : [UIImage imageNamed:@"cell_bg_06"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
- (IBAction)callLinkMan:(id)sender {
    if ([GlobalConfig isValidateMobile:self.model.linkNumber]) {
        [GlobalConfig makeCall:self.model.linkNumber];
    }
}

@end
