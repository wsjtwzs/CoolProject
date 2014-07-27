//
//  ListModel.m
//  CoolProject
//
//  Created by 魔时网 on 14-7-17.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "ListModel.h"

@implementation ListModel


+ (BaseModel *) modelWithDictionary:(NSDictionary *)dic
{
    ListModel *model = [ListModel new];
    model.carNumber = [GlobalConfig convertToString:dic[@"code"]];
    model.lid = [GlobalConfig convertToString:dic[@"id"]];
    model.date = [GlobalConfig convertToString:dic[@"time"]];
    model.linkMan = [GlobalConfig convertToString:dic[@"communcate"]];
    model.linkNumber = [GlobalConfig convertToString:dic[@"mobile"]];

    //冷或温
    NSString *cool = [GlobalConfig convertToString:dic[@"win_du"]];
    if ([cool isEqualToString:@"1"]) {
        model.cool = YES;
    }
    else {
        model.cool = NO;
    }
    
    //轨迹
    NSString *from = [GlobalConfig convertToString:dic[@"from_l"]];
    NSString *to = [GlobalConfig convertToString:dic[@"end_l"]];
    model.path = [GlobalConfig convertToString:[NSString stringWithFormat:@"%@ - %@",from,to]];
    
    //货物
    NSString *product = [GlobalConfig convertToString:dic[@"name"]];
    NSString *weight = [GlobalConfig convertToString:dic[@"weight"]];
       model.product = [GlobalConfig convertToString:[NSString stringWithFormat:@"%@ - %@",product,weight]];
    return model;
}

@end
