//
//  MangerCell.m
//  CoolProject
//
//  Created by wuzhensong on 14-6-10.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "MangerCell.h"

@implementation MangerCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setValueForCell:(BaseModel *)model
{
    MangerModel *manger = (MangerModel *)model;
    self.carNumber.text = manger.carNumber;
    self.phone.text = manger.phoneNumber;
    self.locationNumber.text = manger.locationNumber;

    if ([GlobalConfig isKindOfNSStringClassAndLenthGreaterThanZero:manger.temperature]) {
        self.temp.text = [NSString stringWithFormat:@"温度:%@℃",manger.temperature];
    }

    self.coordinator.text = [GlobalConfig isKindOfNSStringClassAndLenthGreaterThanZero:manger.coordinator] ? manger.coordinator : @"无数据";
    
    self.date.text = [GlobalConfig isKindOfNSStringClassAndLenthGreaterThanZero:manger.addTime] ? [GlobalConfig dateFormater:manger.addTime format:DATEFORMAT_08] : @"无数据";

    NSArray *typeArray = @[@"冷藏车",@"保温车"];
    NSArray *widthArray = @[@"7.6米",@"8.6米",@"9.6米",@"12.5米",@"13.7米",@"15米",@"16.2米",@"16.5米"];
    NSInteger x = [manger.carType integerValue];
    NSInteger i = [manger.carWidth integerValue];
    if (x > 0 && x < 3 && i > 0 && i < 9) {
        self.carType.text = [NSString stringWithFormat:@"%@-%@",widthArray[i - 1],typeArray[x - 1]];
    }

}

- (IBAction)locationClick:(id)sender {
    if ([self.delegate respondsToSelector:@selector(carLocation:)]) {
        [self.delegate carLocation:self];
    }
}

- (IBAction)carInfoUpdateClick:(id)sender {
    if ([self.delegate respondsToSelector:@selector(carInfoUpdate:)]) {
        [self.delegate carInfoUpdate: self];
    }
}
@end
