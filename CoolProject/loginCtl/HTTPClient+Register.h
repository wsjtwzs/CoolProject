//
//  HTTPClient+Register.h
//  CoolProject
//
//  Created by wuzhensong on 14-6-17.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "HTTPClient.h"

@interface HTTPClient (Register)


- (void) registerWithUsername:(NSString *)user
                     password:(NSString *)password
                      success:(void(^)(id jsonData))success
                         fail:(void(^)(void))fail;

@end
