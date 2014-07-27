//
//  ListModel.h
//  CoolProject
//
//  Created by 魔时网 on 14-7-17.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "BaseModel.h"

@interface ListModel : BaseModel

@property (nonatomic, assign) BOOL cool;
@property (nonatomic ,strong) NSString *lid;//ID
@property (nonatomic, strong) NSString *carNumber;//车牌号
@property (nonatomic, strong) NSString *path;//轨迹
@property (nonatomic, strong) NSString *date;//日期
@property (nonatomic, strong) NSString *product;//货物
@property (nonatomic, strong) NSString *linkMan;//联系人
@property (nonatomic, strong) NSString *linkNumber;//联系电话
@property (nonatomic, strong) NSString *temp;//温度

@end
