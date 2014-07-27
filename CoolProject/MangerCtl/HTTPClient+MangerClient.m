//
//  HTTPClient+MangerClient.m
//  CoolProject
//
//  Created by wuzhensong on 14-6-10.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "HTTPClient+MangerClient.h"
#import "GlobalConfig.h"
#import "MangerModel.h"

@implementation HTTPClient (MangerClient)

- (void) getMangerListSuccess:(void(^)(NSMutableArray *array))success {
    
    [self.request beginRequestWithUrl:[NSString stringWithFormat:URL_CARLIST,[GlobalConfig getObjectWithKey:USER_TOKEN]]
                         isAppendHost:YES
                            isEncrypt:NO
                              success:^(id jsonData) {
                                  NSArray *array = [self listAnalyze:jsonData Key:@"data"];
                                  if (array) {
                                      NSMutableArray *data = [NSMutableArray new];
                                      for (NSDictionary *dic in array) {
                                          MangerModel *model = (MangerModel *)[MangerModel modelWithDictionary:dic];
                                          [data addObject:model];
                                      }
                                      success(data);
                                  }
                                  else {
                                      success(nil);
                                  }
                              }
                                 fail:^{
                                     [GlobalConfig showAlertViewWithMessage:ERROR_LOADFAIL superView:nil];
                                     success(nil);
                                 }];

}


- (void) addNewCarWithMangerModel:(MangerModel *)model
                           addNew:(BOOL)add
                          success:(void (^)(NSDictionary *dic))success {
    
    NSString *url = [NSString stringWithFormat:URL_ADDCAR,model.carNumber,model.carType,model.carWidth,model.phoneNumber,model.locationNumber,[GlobalConfig getObjectWithKey:USER_TOKEN]];
    if (!add) {
        url = [NSString stringWithFormat:URL_UPDATECAR,model.carID,model.carNumber,model.carType,model.carWidth,model.phoneNumber,model.locationNumber,[GlobalConfig getObjectWithKey:USER_TOKEN]];
    }
    [self.request beginRequestWithUrl:url
                         isAppendHost:YES
                            isEncrypt:NO
                              success:^(id json) {
                                  NSDictionary *dic = [self infoAnalyze:json Key:@"data"];
                                  success(dic);
                              } fail:^{
                                  [GlobalConfig showAlertViewWithMessage:ERROR_LOADFAIL superView:nil];
                                  success(nil);
                              }];
}
@end
