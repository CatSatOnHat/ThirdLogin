//
//  WeiboLogin.h
//  ThirdLogin
//
//  Created by 李朕 on 2017/9/14.
//  Copyright © 2017年 datuhongan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeiboLoginHandle.h"

typedef void(^WeiboLoginSuccessHandle)(NSDictionary *userInfo);
typedef void(^WeiboLoginFailedHandle)(NSString *errorStr);

@interface WeiboLogin : NSObject

@property (nonatomic, strong) WeiboLoginHandle<WeiboSDKDelegate> *weiboHandle;

- (void)loginSuccessHandle:(WeiboLoginSuccessHandle)successHandle failedHandle:(WeiboLoginFailedHandle)failedHandle;

@end
