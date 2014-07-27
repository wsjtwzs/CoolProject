//
//  HTTPClient+MangerClient.h
//  CoolProject
//
//  Created by wuzhensong on 14-6-10.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "HTTPClient.h"
#import "MangerModel.h"

@interface HTTPClient (MangerClient)

//车辆信息
- (void) getMangerListSuccess:(void(^)(NSMutableArray *array))success;

//车辆登记
- (void) addNewCarWithMangerModel:(MangerModel *)model
                           addNew:(BOOL)add
                          success:(void (^)(NSDictionary *dic))success;
@end
