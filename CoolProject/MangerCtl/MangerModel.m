//
//  MangerModel.m
//  CoolProject
//
//  Created by wuzhensong on 14-6-10.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "MangerModel.h"

@implementation MangerModel

+ (MangerModel *) modelWithDictionary:(NSDictionary *)dic
{
    MangerModel *model = [MangerModel new];
    
    model.carID = [GlobalConfig convertToString:dic[@"id"]];
    model.carNumber = [GlobalConfig convertToString:dic[@"code"]];
    model.carType = [GlobalConfig convertToString:dic[@"c_type"]];
    model.carWidth = [GlobalConfig convertToString:dic[@"c_length"]];
    model.temperature = [GlobalConfig convertToString:dic[@"is_temperature"]];
    
    model.phoneNumber = [GlobalConfig convertToString:dic[@"phone"]];
    model.addTime = [GlobalConfig convertToString:dic[@"coordinator_time"]];
    model.coordinator = [GlobalConfig convertToString:dic[@"coordinator"]];
    
    model.locationNumber = [GlobalConfig convertToString:dic[@"c_number"]];
    model.locationID = [GlobalConfig convertToString:dic[@"number_id"]];
    
    model.formNumber = [GlobalConfig convertToString:dic[@"form_num"]];

    return model;
}
@end
