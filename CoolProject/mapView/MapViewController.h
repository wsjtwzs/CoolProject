//
//  MapViewController.h
//  CoolProject
//
//  Created by wuzhensong on 14-6-15.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "BaseViewController.h"
#import "BMapKit.h"

@interface MapViewController : BaseViewController<BMKMapViewDelegate>
{
    BMKMapView *_mapView;
}
@end
