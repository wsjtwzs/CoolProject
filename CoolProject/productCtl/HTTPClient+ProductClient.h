//
//  HTTPClient+ProductClient.h
//  CoolProject
//
//  Created by 魔时网 on 14-6-4.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "HTTPClient.h"

@interface HTTPClient (ProductClient)

//配货
- (void) getCarListSuccess:(void(^)(NSMutableArray *dataArray))success;
//货单
- (void) getAllListSuccess:(void(^)(NSMutableArray *dataArray))success;
//某车货单
- (void) getListWithCarID:(NSString *)cid
                  Success:(void(^)(NSMutableArray *dataArray))success;
@end
