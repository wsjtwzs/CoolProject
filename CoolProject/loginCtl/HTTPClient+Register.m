//
//  HTTPClient+Register.m
//  CoolProject
//
//  Created by wuzhensong on 14-6-17.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "HTTPClient+Register.h"

@implementation HTTPClient (Register)


- (void) registerWithUsername:(NSString *)user
                     password:(NSString *)password
                      success:(void(^)(id jsonData))success
                         fail:(void(^)(void))fail
{
    
    [self.request beginRequestWithUrl:[NSString stringWithFormat:URL_REG,user,password]
                         isAppendHost:YES
                            isEncrypt:NO
                              success:^(id jsonData){
                                  success(jsonData);
                              
                              }
                                 fail:^{
                                     fail();
                                 
                                 }];
    
}


@end
