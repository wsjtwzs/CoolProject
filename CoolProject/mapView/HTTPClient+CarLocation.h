//
//  HTTPClient+CarLocation.h
//  CoolProject
//
//  Created by wuzhensong on 14-7-16.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "HTTPClient.h"

@interface HTTPClient (CarLocation)

- (void) getCarsLocationSuccess:(void(^)(NSMutableArray *dataArray))success;

- (void) getCarPathWithCarID:(NSString *)cid
                     Success:(void (^)(NSMutableArray *))success;

@end
