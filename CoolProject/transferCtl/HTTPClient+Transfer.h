//
//  HTTPClient+Transfer.h
//  CoolProject
//
//  Created by 魔时网 on 14-7-27.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "HTTPClient.h"

@interface HTTPClient (Transfer)

- (void) transferWithCarID:(NSString *)cid
                      info:(NSString *)info
                   success:(void(^)(id jsonData))success;
@end
