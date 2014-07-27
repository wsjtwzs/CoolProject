//
//  HTTPClient.h
//  moshTickets
//
//  Created by 魔时网 on 13-11-14.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServerRequest.h"   
#import "CacheHanding.h"
#import "UIImageView+AFNetworking.h"
#import "URLDefine.h"

#define NOTI_INVIALIDTOKEN      @"NOTI_INVALIDTOKEN"
#define NOTI_CARINFOCHANGE      @"NOTI_CARINFOCHANGE"

typedef enum{
    ErrorCode_noUser =              -4,//用户不存在
    ErrorCode_invalidToken =        1,//登陆超时
    ErrorCode_loginError =          2,//用户账号或密码错误
    ErrorCode_invalidRequest =      3,//操作失败
    ErrorCode_missArgument =        4,//缺少参数
    ErrorCode_existUser =           5,//用户已存在
    ErrorCode_unExistgpsNumber =    6,//设备编号不存在
    ErrorCode_saveFail =            7,//gps/温度保存失败
    ErrorCode_argumentError =       8,//参数格式错误
    ErrorCode_existCarNumber =      9,//车牌号已经存在
    ErrorCode_bindingGpsNUmber =    10,//设备号码已经被绑定
    ErrorCode_unexistCar =          11,//车辆不存在/不属于当前用户
    ErrorCode_gpsNumberError =      12,//gps号错误
    ErrorCode_carNobindingGPS  =    13,//车辆没有绑定gps
} ErrorCode;

typedef void (^Success)(id jsonData);

@interface HTTPClient : NSObject

@property (nonatomic, strong) ServerRequest *request;



/*
 单例
 */
+ (HTTPClient *) shareHTTPClient;

//列表解析
- (NSArray *) listAnalyze:(id) jsonData Key:(NSString *)key;

//dic解析
- (NSDictionary *) infoAnalyze:(id) jsonData Key:(NSString *)key;

/*
 登录
 name 用化名
 password 密码
 */
- (void) testWithUserName:(NSString *)userName
                  password:(NSString *)password
                   success:(void (^)(id jsonData))success
                      fail:(void (^)(void))fail;


@end