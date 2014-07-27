//
//  CarPathViewController.h
//  CoolProject
//
//  Created by wuzhensong on 14-7-16.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "MapViewController.h"

@interface CarPathViewController : MapViewController
{
    NSString * _carID;
}

- (id) initWithCarID:(NSString *)cid;
@end
