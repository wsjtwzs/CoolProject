//
//  ProductCell.m
//  CoolProject
//
//  Created by 魔时网 on 14-6-4.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "ProductCell.h"
#import "GlobalConfig.h"

@implementation ProductCell

//- (void)awakeFromNib
//{
//    self.backView.layer.shadowColor = [UIColor blackColor].CGColor;
//    self.backView.layer.shadowOpacity = 0.8f;
//}

- (IBAction)locationClick:(id)sender {
    if ([self.delegate respondsToSelector:@selector(locationSelected:)]) {
        [self.delegate locationSelected:self];
    }
}

- (IBAction)transferClick:(id)sender {
    if ([self.delegate respondsToSelector:@selector(transferSelected:)]) {
        [self.delegate transferSelected:self];
    }
}

- (IBAction)listClick:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(listSelected:)]) {
        [self.delegate listSelected:self];
    }
}

- (void) setValueWithProductModel:(ProductModel *)model
{
    self.carNumber.text = model.carNumber;
    self.phone.text = model.phoneNumber;
    self.listNumber.text = model.formNumber;

    self.address.text = [GlobalConfig isKindOfNSStringClassAndLenthGreaterThanZero:model.coordinator] ? model.coordinator : @"无数据";
    
    self.date.text = [GlobalConfig isKindOfNSStringClassAndLenthGreaterThanZero:model.addTime] ? [GlobalConfig dateFormater:model.addTime format:DATEFORMAT_08] : @"无数据";
    
    NSArray *typeArray = @[@"冷藏车",@"保温车"];
    NSArray *widthArray = @[@"7.6米",@"8.6米",@"9.6米",@"12.5米",@"13.7米",@"15米",@"16.2米",@"16.5米"];
    NSInteger x = [model.carType integerValue];
    NSInteger i = [model.carWidth integerValue];
    if (x > 0 && x < 3 && i > 0 && i < 9) {
        self.height.text = [NSString stringWithFormat:@"%@-%@",widthArray[i - 1],typeArray[x - 1]];
    }

    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



@end
