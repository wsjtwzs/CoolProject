//
//  HTTPClient+Transfer.m
//  CoolProject
//
//  Created by 魔时网 on 14-7-27.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "HTTPClient+Transfer.h"
#import "GlobalConfig.h"

@implementation HTTPClient (Transfer)

- (void) transferWithCarID:(NSString *)cid
                      info:(NSString *)info
                   success:(void(^)(id jsonData))success
{
    [self.request beginRequestWithUrl:[NSString stringWithFormat:URL_TRANSFER,[GlobalConfig getObjectWithKey:USER_TOKEN],cid,info]
                         isAppendHost:YES
                            isEncrypt:NO
                              success:^(id jsonData){
                                  success(jsonData);
                              }
                                 fail:^{
                                     [GlobalConfig showAlertViewWithMessage:ERROR_LOADFAIL superView:nil];
                                     success(nil);
                                 }];

}

@end
