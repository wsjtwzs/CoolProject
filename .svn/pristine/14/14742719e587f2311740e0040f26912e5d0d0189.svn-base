//
//  HTTPClient+Login.m
//  CoolProject
//
//  Created by wuzhensong on 14-6-17.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "HTTPClient+Login.h"
#import "NSString+Hashing.h"

@implementation HTTPClient (Login)

- (void) loginWithUsername:(NSString *)user
                     password:(NSString *)password
                      success:(void(^)(id jsonData))success
                         fail:(void(^)(void))fail
{
    
    [self.request beginRequestWithUrl:[NSString stringWithFormat:URL_LOGIN,user,[password MD5Hash]]
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
