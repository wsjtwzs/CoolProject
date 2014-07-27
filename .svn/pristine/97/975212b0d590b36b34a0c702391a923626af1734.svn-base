//
//  HTTPClient+ProductClient.m
//  CoolProject
//
//  Created by 魔时网 on 14-6-4.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "HTTPClient+ProductClient.h"
#import "GlobalConfig.h"
#import "ProductModel.h"
#import "ListModel.h"

@implementation HTTPClient (ProductClient)

- (void) getCarListSuccess:(void(^)(NSMutableArray *dataArray))success{
    //授权失败回调函数
    
    [self.request beginRequestWithUrl:[NSString stringWithFormat:URL_CARLIST,[GlobalConfig getObjectWithKey:USER_TOKEN]]
                         isAppendHost:YES
                            isEncrypt:NO
                              success:^(id jsonData) {
                                  NSArray *array = [self listAnalyze:jsonData Key:@"data"];
                                  if (array) {
                                      NSMutableArray *data = [NSMutableArray new];
                                      for (NSDictionary *dic in array) {
                                          ProductModel *model = (ProductModel *)[ProductModel modelWithDictionary:dic];
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



- (void) getAllListSuccess:(void(^)(NSMutableArray *dataArray))success {
    
    [self.request beginRequestWithUrl:[NSString stringWithFormat:URL_ALLLIST,[GlobalConfig getObjectWithKey:USER_TOKEN]]
                         isAppendHost:YES
                            isEncrypt:NO
                              success:^(id jsonData) {
                                  NSDictionary *dic = [self infoAnalyze:jsonData Key:@"data"];
                                  if (dic) {
                                      NSArray *list = [GlobalConfig convertToArray:dic[@"list"]];
                                      NSMutableArray *data = [NSMutableArray new];
                                      for (NSDictionary *dic in list) {
                                          ListModel *model = (ListModel *)[ListModel modelWithDictionary:dic];
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

- (void) getListWithCarID:(NSString *)cid
                  Success:(void(^)(NSMutableArray *dataArray))success {
    
    [self.request beginRequestWithUrl:[NSString stringWithFormat:URL_CARPRODUCTLIST,[GlobalConfig getObjectWithKey:USER_TOKEN],cid]
                         isAppendHost:YES
                            isEncrypt:NO
                              success:^(id jsonData) {
                                  NSDictionary *dic = [self infoAnalyze:jsonData Key:@"data"];
                                  if (dic) {
                                      NSArray *list = [GlobalConfig convertToArray:dic[@"list"]];
                                      NSMutableArray *data = [NSMutableArray new];
                                      for (NSDictionary *dic in list) {
                                          ListModel *model = (ListModel *)[ListModel modelWithDictionary:dic];
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

@end
