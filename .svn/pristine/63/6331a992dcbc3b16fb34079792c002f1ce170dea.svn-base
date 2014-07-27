//
//  HTTPClient+CarLocation.m
//  CoolProject
//
//  Created by wuzhensong on 14-7-16.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "HTTPClient+CarLocation.h"
#import "BMapKit.h"
#import "GlobalConfig.h"

@implementation HTTPClient (CarLocation)

- (void) getCarPathWithCarID:(NSString *)cid
                     Success:(void (^)(NSMutableArray *))success
{
    [self.request beginRequestWithUrl:[NSString stringWithFormat:URL_CARPATH,[GlobalConfig getObjectWithKey:USER_TOKEN],cid]
                         isAppendHost:YES
                            isEncrypt:NO
                              success:^(id jsonData) {
                                  NSDictionary *dic = [self infoAnalyze:jsonData Key:@"data"];
                                  if (dic) {
                                      NSArray *list = [GlobalConfig convertToArray:dic[@"list"]];
                                      NSMutableArray *data = [NSMutableArray new];
                                      for (NSDictionary *dic in list) {
                                          BMKPointAnnotation* annotation = [[BMKPointAnnotation alloc]init];
                                          CLLocationCoordinate2D coor;
                                          coor.latitude = [[GlobalConfig convertToString:dic[@"latitude"]] floatValue];
                                          coor.longitude = [[GlobalConfig convertToString:dic[@"longitude"]] floatValue];
                                          annotation.coordinate = coor;
                                          annotation.title = [GlobalConfig convertToString:dic[@"temperature"]];
                                          [data addObject:annotation];
                                      }
                                      success(data);
                                  }
                                  
                              }
                                 fail:^{
                                     [GlobalConfig showAlertViewWithMessage:ERROR_LOADFAIL superView:nil];
                                     success(nil);
                                 }];

    
    
//    BMKPointAnnotation* annotation = [[BMKPointAnnotation alloc]init];
//    CLLocationCoordinate2D coor;
//    coor.latitude = 39.915;
//    coor.longitude = 116.404;
//    annotation.coordinate = coor;
//    annotation.title = @"轨迹1";
//    
//
//    BMKPointAnnotation* annotation1 = [[BMKPointAnnotation alloc]init];
//    CLLocationCoordinate2D coor1;
//    coor1.latitude = 39.9;
//    coor1.longitude = 116.4;
//    annotation1.coordinate = coor1;
//    annotation1.title = @"轨迹2";
//    
//    NSMutableArray *array  = [NSMutableArray new];
//    [array addObject:annotation];
//    [array addObject:annotation1];
//    
//    success(array);
}


- (void) getCarsLocationSuccess:(void (^)(NSMutableArray *))success
{
    
    [self.request beginRequestWithUrl:[NSString stringWithFormat:URL_ALLCARLOCATION,[GlobalConfig getObjectWithKey:USER_TOKEN]]
                         isAppendHost:YES
                            isEncrypt:NO
                              success:^(id jsonData) {
                                  NSDictionary *dic = [self infoAnalyze:jsonData Key:@"data"];
                                  if (dic) {
                                      NSArray *list = [GlobalConfig convertToArray:dic[@"list"]];
                                      NSMutableArray *data = [NSMutableArray new];
                                      for (NSDictionary *dic in list) {
                                          BMKPointAnnotation* annotation = [[BMKPointAnnotation alloc]init];
                                          CLLocationCoordinate2D coor;
                                          coor.latitude = [[GlobalConfig convertToString:dic[@"latitude"]] floatValue];
                                          coor.longitude = [[GlobalConfig convertToString:dic[@"longitude"]] floatValue];
                                          annotation.coordinate = coor;
                                          annotation.title = [GlobalConfig convertToString:dic[@"temperature"]];
                                          [data addObject:annotation];
                                      }
                                      success(data);
                                  }
                                  
                              }
                                 fail:^{
                                     [GlobalConfig showAlertViewWithMessage:ERROR_LOADFAIL superView:nil];
                                     success(nil);
                                 }];

//    BMKPointAnnotation* annotation = [[BMKPointAnnotation alloc]init];
//    CLLocationCoordinate2D coor;
//    coor.latitude = 39.915;
//    coor.longitude = 116.404;
//    annotation.coordinate = coor;
//    annotation.title = @"车辆1";
//    
//    
//    BMKPointAnnotation* annotation1 = [[BMKPointAnnotation alloc]init];
//    CLLocationCoordinate2D coor1;
//    coor1.latitude = 39.899;
//    coor1.longitude = 116.511;
//    annotation1.coordinate = coor1;
//    annotation1.title = @"车辆2";
//    
//    NSMutableArray *array  = [NSMutableArray new];
//    [array addObject:annotation];
//    [array addObject:annotation1];
//    
//    success(array);
}


@end
