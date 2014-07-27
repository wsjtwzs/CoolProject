//
//  MapAnnotation.h
//  CoolProject
//
//  Created by wuzhensong on 14-6-15.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BMapKit.h"

@interface MapAnnotation : NSObject<BMKAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic , strong) NSString *title;
@property (nonatomic, strong) NSString *subTitle;

@end
